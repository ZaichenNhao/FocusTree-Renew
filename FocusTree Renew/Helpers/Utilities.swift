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
    
    static func styleText(_ label:UILabel) {
        
        label.textColor = UIColor.init(red: 1.0, green: 1.0, blue: 1.0, alpha: 1)
        label.font = UIFont(name: "ModernSansLight", size:45)
        
    }
    
    static func styleTextField(_ textfield:UITextField) {
        
        // Create the bottom line
        let bottomLine = CALayer()
        
        bottomLine.frame = CGRect(x: 0, y: textfield.frame.height - 2, width: textfield.frame.width, height: 2)
        
        bottomLine.backgroundColor = UIColor.init(red: 1.00, green: 1.00, blue: 1.00, alpha: 1.00).cgColor
        
        // Remove border on text field
        textfield.borderStyle = .none
        
        // Add the line to the text field
        textfield.layer.addSublayer(bottomLine)
        
    }
    
    static func styleFilledButton(_ button:UIButton) {
        
        // Filled rounded corner style
        button.backgroundColor = UIColor.init(red: 1.0, green: 1.0, blue: 1.0, alpha: 1)
        button.layer.cornerRadius = 20.0
        button.tintColor = UIColor.white
    }
    
    static func styleHollowButton(_ button:UIButton) {
        
        // Hollow rounded corner style
        button.layer.borderWidth = 2
        button.layer.borderColor = UIColor.black.cgColor
        button.layer.cornerRadius = 23.0
        button.tintColor = UIColor.black
    }
    
    static func isPasswordValid(_ password : String) -> Bool {
        
        let passwordTest = NSPredicate(format: "SELF MATCHES %@", "^(?=.*[a-z])(?=.*[$@$#!%*?&])[A-Za-z\\d$@$#!%*?&]{8,}")
        return passwordTest.evaluate(with: password)
        
        /*if(password.count < 8) {
            return false;
        }
        else { return true; }*/
        
    }
    
}
