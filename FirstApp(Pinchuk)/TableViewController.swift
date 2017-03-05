//
//  TableViewController.swift
//  FirstApp(Pinchuk)
//
//  Created by Andrew Pinchuk on 05.03.17.
//  Copyright © 2017 Co.pinchuk. All rights reserved.
//

import UIKit
import RealmSwift

class TableViewController: UITableViewController
{

    var goods : Results<Good>?
    

    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Мои товары"
        self.tableView.estimatedRowHeight = 53
        self.tableView.rowHeight = UITableViewAutomaticDimension
        
        self.navigationController?.setNavigationBarHidden(false, animated: true)
        self.loadGoods()
    }
    
    
    
    func loadGoods() {
        
        let realm = try! Realm()
        
        goods = realm.objects(Good.self)
        
        self.tableView.reloadData()
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return goods?.count ?? 0
    }
    
    // MARK: UITableViewDataSource
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let objectsGood = goods?.sorted(byKeyPath: "completed", ascending: true)
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! TableViewCell
        
        if objectsGood?[indexPath.row].count == 0 {
            cell.countLabel.isHidden = true
        }else{
            cell.countLabel.isHidden = false
            cell.countLabel.text = String(describing: objectsGood![indexPath.row].count)
        }
        
        cell.mainLabel.attributedText = !(objectsGood?[indexPath.row].completed)! ?  NSAttributedString(string: (objectsGood?[indexPath.row].name)! , attributes: [NSForegroundColorAttributeName: UIColor.black,])  : NSAttributedString(string: (objectsGood?[indexPath.row].name)! , attributes: [NSStrikethroughStyleAttributeName: NSUnderlineStyle.styleSingle.rawValue])
        
        
        cell.backgroundColor = !(objectsGood?[indexPath.row].completed)! ? UIColor.white : UIColor(red:0.92, green:0.93, blue:0.93, alpha:1.00)
        
        return cell
    }
    
    
    // MARK: UITableViewDelegate
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let realm = try! Realm()
        
        let objectsGood = goods?.sorted(byKeyPath: "completed", ascending: true)
        
        let alertController = UIAlertController(title: "Выберите действие:", message: "", preferredStyle: .actionSheet)
        
        let complated = UIAlertAction(title: "Куплен", style: .destructive, handler: { (action) -> Void in
            
            try! realm.write {
                objectsGood?[indexPath.row].completed = true
                self.tableView.reloadData()
            }
        })
        
        let  backComplated = UIAlertAction(title: "Не куплен", style: .default, handler: { (action) -> Void in
            
            try! realm.write {
                objectsGood?[indexPath.row].completed = false
                self.tableView.reloadData()
            }
            
        })
        
        let cancelButton = UIAlertAction(title: "Cancel", style: .cancel, handler: { (action) -> Void in
            
        })
        
        if (objectsGood?[indexPath.row].completed)! {
            alertController.addAction(backComplated)
        }else{
            alertController.addAction(complated)
        }
        alertController.addAction(cancelButton)
        
        self.navigationController!.present(alertController, animated: true, completion: nil)
        self.tableView.deselectRow(at: indexPath, animated: true)
    }
    
    
    
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        
        let realm = try! Realm()
        
        if editingStyle == .delete {
            
            try! realm.write {
                realm.delete((goods?[indexPath.row])!)
            }
            
            tableView.reloadData()
        }
    }
    
    
    // MARK: BarButtonAction
    
    @IBAction func addBarButtonItemTapped(_ sender: Any) {
        let realm = try! Realm()
        
        let alert = UIAlertController(title: "Добавить товар:", message: "", preferredStyle: .alert)
        
        alert.addTextField { (textField) in
            textField.placeholder = "Название товара"
            textField.autocorrectionType = .yes
        }
        
        alert.addTextField { (textField) in
            textField.keyboardType = .numberPad
            textField.placeholder = "Количество"
        }
        
        alert.addAction(UIAlertAction(title: "Добавить", style: .default, handler: { [weak alert] (_) in
            
            if alert!.textFields![0].isEmpty()  {
                
                AlertStandart().show("Ошибка", text: "Нельзя добавить товар без названия! Пожалуйста, заполните поле «Название товара» перед добавлением.", view: self)
                
            }else{
                
                let newGood = Good()
                newGood.name = alert!.textFields![0].delSpaces()
                
                if !alert!.textFields![1].isEmpty() {
                    newGood.count = Int(alert!.textFields![1].delSpaces())!
                }
                
                try! realm.write {
                    realm.add(newGood)
                    self.tableView.reloadData()
                }
            }
            
        }))
        
        alert.addAction(UIAlertAction(title: "Отмена", style: .cancel, handler: nil))
        
        self.present(alert, animated: true, completion: nil)
    }
        
    }
    

