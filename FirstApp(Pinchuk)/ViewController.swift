//
//  ViewController.swift
//  FirstApp(Pinchuk)
//
//  Created by Andrew Pinchuk on 21.02.17.
//  Copyright © 2017 Co.pinchuk. All rights reserved.
//

import UIKit
import PaperOnboarding

class ViewController: UIViewController {
    @IBOutlet weak var startBotton: UIButton!

   
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        //Adding gradient to the background
        let color1 = UIColor(red: 153 / 255, green: 26 / 255, blue: 61 / 255, alpha: 1.0).cgColor
        let color2 = UIColor(red: 243 / 255, green: 155 / 255, blue: 51 / 255, alpha: 1.0).cgColor
        let color3 = UIColor(red: 183 / 255, green: 34 / 255, blue: 69 / 255, alpha: 1.0).cgColor
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = self.view.bounds
        gradientLayer.colors = [color1, color2, color3]
        gradientLayer.startPoint = CGPoint(x: 0.0, y: 0.0)
        gradientLayer.endPoint = CGPoint(x: 0.0, y: 1.0)
        self.view.layer.insertSublayer(gradientLayer, at: 0)
        
        //Hide Navigation Controller
        self.navigationController?.setNavigationBarHidden(true, animated: false)
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

