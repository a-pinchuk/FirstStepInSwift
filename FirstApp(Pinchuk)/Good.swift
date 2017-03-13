//
//  Good.swift
//  FirstApp(Pinchuk)
//
//  Created by Andrew Pinchuk on 05.03.17.
//  Copyright © 2017 Co.pinchuk. All rights reserved.
//

import UIKit
import Foundation
import RealmSwift


class Good: Object {
    dynamic var name = ""
    dynamic var count = 0
    dynamic var completed = false
}
