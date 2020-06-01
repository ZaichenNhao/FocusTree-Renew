// 
//  LoginViewController.swift
//  FocusTree Renew
//
//  Created by Zaichen on 2020-05-31.
//  Copyright © 2020 Zaichen. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var emailTextField: UITextField!
    
    @IBOutlet weak var passwordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func loginTapped(_ sender: Any) {
    }
    
    
    @IBAction func signUpTapped(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        
        let vc = storyboard.instantiateViewController(identifier: Constants.Storyboard.signUpViewController)
        
        vc.modalPresentationStyle = .overFullScreen
        
        present(vc, animated: true)
    }
    
}
