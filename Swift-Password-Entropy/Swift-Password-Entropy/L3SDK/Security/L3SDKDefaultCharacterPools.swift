//
//  L3SDKDefaultCharacterPools.swift
//  Swift-Password-Entropy
//
//  Created by Domenico Vacchiano on 31/12/15.
//  Copyright © 2015 DomenicoVacchiano. All rights reserved.
//

import UIKit

class L3SDKDefaultCharacterPools: NSArray {
    
    //it represents the standard pool of characters used to evaluate the password entropy
    
    let defaultCharacterSet =  [
        //lowercase letters
        "abcdefghijklmnopqrstuvwxyz",
        //uppercase letters
        "ABCDEFGHIJKLMNOPQRSTUVWXYZ",
        //numbers
        "0123456789",
        //symbols above numbers
        "!@#$%^&*()",
        //other symbols
        "`~-_=+[{]}\\|;:'\",<.>/?",
        //space
        " "
    ]
    
    override var count: Int {
        get {
            return defaultCharacterSet.count
        }
    }
    
    override func objectAtIndex(index: Int) -> AnyObject {
        assert(index < count, "The index is out of bounds")
        return defaultCharacterSet[index]
    }
    
}

