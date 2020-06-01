//
//  Utilities.swift
//  FocusTree Renew
//
//  Created by Zaichen on 2020-06-01.
//  Copyright © 2020 Zaichen. All rights reserved.
//

import Foundation
import UIKit

class Utilities {
    
    static func isPasswordValid(_ password : String) -> Bool {
    
    let passwordTest = NSPredicate(format: "SELF MATCHES %@", "^(?=.*[a-z])(?=.*[$@$#!%*?&])[A-Za-z\\d$@$#!%*?&]{8,}")
    return passwordTest.evaluate(with: password)
    }
    
}
