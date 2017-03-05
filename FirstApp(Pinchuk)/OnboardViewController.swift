//
//  OnboardViewController.swift
//  FirstApp(Pinchuk)
//
//  Created by Andrew Pinchuk on 23.02.17.
//  Copyright © 2017 Co.pinchuk. All rights reserved.
//

import UIKit
import PaperOnboarding

extension UIImage {
    enum Asset: String {
        case Banks = "Banks"
        case Hotels = "Hotels"
        case Key = "Key"
        case Shopping_Cart = "Shopping-cart"
        case Stores = "Stores"
        case Wallet = "Wallet"
        
        var image: UIImage {
            return UIImage(asset: self)
        }
    }
    
    convenience init!(asset: Asset) {
        self.init(named: asset.rawValue)
    }
}



class OnboardViewController: UIViewController, PaperOnboardingDataSource, PaperOnboardingDelegate{
    
    @IBOutlet weak var onboardingView: OnboardingView!
    
    
    //    let activeScreen = 1
    // Эта переменная будет изменяться при смене активного экрана, и так как индексация с 0, значит стандарнтое значение ее должно быть 0
    var activeScreen = 0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        onboardingView.dataSource = self
        onboardingView.delegate = self
    }
    
    func onboardingItemsCount() -> Int {
        return 3
    }
    
    func onboardingItemAtIndex(_ index: Int) -> OnboardingItemInfo {
        let backgroundColorOne = UIColor(red: 217/255, green: 72/255, blue: 89/255, alpha: 1)
        let backgroundColorTwo = UIColor(red: 106/255, green: 166/255, blue: 211/255, alpha: 1)
        let backgroundColorThree = UIColor(red: 168/255, green: 200/255, blue: 78/255, alpha: 1)
        
        let titleFont = UIFont(name: "AvenirNext-Bold", size: 24)!
        let descriptionFont = UIFont(name: "AvenirNext-Regular", size: 18)!
        
        
        //        return [("rocket", "A Great Rocket Start", "Privet Privet", "", backgroundColorOne, UIColor.white, UIColor.white, titleFont, descriptionFont),
        //                ("brush", "Design your experience", "Privet Privet", "", backgroundColorTwo, UIColor.white, UIColor.white, titleFont, descriptionFont),
        //                ("cat", "Stay Up to Date", "Get norified of important updates", "", backgroundColorThree, UIColor.white, UIColor.white, titleFont, descriptionFont)][index]
        
        return [("Limousine", "A Great Rocket Start", "Privet Privet", UIImage.Asset.Key.rawValue, backgroundColorOne, UIColor.white, UIColor.white, titleFont, descriptionFont),
                ("brush", "Design your experience", "Privet Privet", UIImage.Asset.Wallet.rawValue, backgroundColorTwo, UIColor.white, UIColor.white, titleFont, descriptionFont),
                ("cat", "Stay Up to Date", "Get norified of important updates", UIImage.Asset.Shopping_Cart.rawValue, backgroundColorThree, UIColor.white, UIColor.white, titleFont, descriptionFont)][index]
    }
    
    
    func onboardingConfigurationItem(_ item: OnboardingContentViewItem, index: Int) {
        
    }
    
    @IBOutlet weak var getStartedButton: UIButton!
    
    @IBAction func goto(_ sender: Any ) {
        
        //индексация должна быть с 0, у тебя было начало с еденицы
        switch activeScreen {
        case 0:
            self.performSegue(withIdentifier: "shoplist", sender: nil)
            print("1_case")
        case 1:
            self.performSegue(withIdentifier: "from2", sender: nil)
            print("2_case")
        case 2:
            self.performSegue(withIdentifier: "from3", sender: nil)
            print("3_case")
        default:
            print("Not the letter A")
        }
    }
    
    func onboardingWillTransitonToIndex(_ index: Int) {
        
        
    }
    
    func onboardingDidTransitonToIndex(_ index: Int) {
        activeScreen = index
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
