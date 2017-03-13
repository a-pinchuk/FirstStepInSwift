//
//  UITextFieldExtensions.swift
//  FirstApp(Pinchuk)
//
//  Created by Andrew Pinchuk on 05.03.17.
//  Copyright © 2017 Co.pinchuk. All rights reserved.
//

import Foundation
import UIKit

extension UITextField {
    func delSpaces() -> String {
        return self.text!.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
    }
    
    func isEmpty() -> Bool {
        return self.delSpaces() == "" ? true : false
    }
}
