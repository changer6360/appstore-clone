//
//  App.swift
//  AppStore
//
//  Created by Tihomir Videnov on 11/12/16.
//  Copyright © 2016 Tihomir Videnov. All rights reserved.
//

import UIKit

class App: NSObject {
    
    var id: NSNumber?
    var name: String?
    var category: String?
    var imageName: String?
    var price: NSNumber?
    
    var screenshots: [String]?
    var desc: String?
    var appInformation: AnyObject?
    
    override func setValue(_ value: Any?, forKey key: String) {
        if key == "description" {
            self.desc = value as? String
        } else {
            super.setValue(value, forKey: key)
        }
    }
}
