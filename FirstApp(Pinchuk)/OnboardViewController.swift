//
//  OnboardViewController.swift
//  FirstApp(Pinchuk)
//
//  Created by Andrew Pinchuk on 23.02.17.
//  Copyright © 2017 Co.pinchuk. All rights reserved.
//

import UIKit
import PaperOnboarding

class OnboardViewController: UIViewController, PaperOnboardingDataSource, PaperOnboardingDelegate{

@IBOutlet weak var onboardingView: OnboardingView!

    
    
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
        

        return [("rocket", "A Great Rocket Start", "Privet Privet", "", backgroundColorOne, UIColor.white, UIColor.white, titleFont, descriptionFont),
                ("brush", "Design your experience", "Privet Privet", "", backgroundColorTwo, UIColor.white, UIColor.white, titleFont, descriptionFont),
                ("cat", "Stay Up to Date", "Get norified of important updates", "", backgroundColorThree, UIColor.white, UIColor.white, titleFont, descriptionFont)][index]
    }
    
    
    func onboardingConfigurationItem(_ item: OnboardingContentViewItem, index: Int) {
        
    }
    
    @IBOutlet weak var getStartedButton: UIButton!
    
//    @IBAction func goto(_ sender: Any ) {
//        
//    }
    
    func onboardingWillTransitonToIndex(_ index: Int) {
//        if index == 1
//        {
//            self.getStartedButton.alpha = 1
//
//        }
//        print(index)
       
    }
    
    func onboardingDidTransitonToIndex(_ index: Int) {
        let activeScreen = index
        
        switch activeScreen {
        case 1:
            self.performSegue(withIdentifier: "from1", sender: nil)
            print("1_case")
        case 2:
            self.performSegue(withIdentifier: "from2", sender: nil)
             print("2_case")
        case 3:
            self.performSegue(withIdentifier: "from3", sender: nil)
             print("3_case")
        default:
            print("Not the letter A")
        }

        if index == 2
        {
            
            UIView.animate(withDuration: 0.4, animations: {
            self.getStartedButton.alpha = 1
                            })
        }
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
