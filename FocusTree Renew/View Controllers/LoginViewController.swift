// 
//  LoginViewController.swift
//  FocusTree Renew
//
//  Created by Zaichen on 2020-05-31.
//  Copyright © 2020 Zaichen. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth

class LoginViewController: UIViewController {

    @IBOutlet weak var emailTextField: UITextField!
    
    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBOutlet weak var loginButton: UIButton!
    
    @IBOutlet weak var errorLabel: UILabel!
    
    @IBOutlet weak var signUpButton: UIButton!
    
    @IBOutlet weak var loginLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view
        setUpElements()
    }
    

    
    func setUpElements(){
        
        //styles and setups the design of the fields and buttons
        errorLabel.alpha = 0
        
        //pass through elements to style
        Utilities.styleTextField(emailTextField)
        Utilities.styleTextField(passwordTextField)
        Utilities.styleFilledButton(loginButton)
        Utilities.styleHollowButton(signUpButton)
        Utilities.styleText(loginLabel)
        
        emailTextField.attributedPlaceholder = NSAttributedString(string:"Email", attributes: [NSAttributedString.Key.foregroundColor: UIColor.init(red: 1.00, green: 1.00, blue: 1.00, alpha: 1.00)])
        
        passwordTextField.attributedPlaceholder = NSAttributedString(string: "Password", attributes: [NSAttributedString.Key.foregroundColor: UIColor.init(red: 1.00, green: 1.00, blue: 1.00, alpha: 1.00)] )
        
    }
    
    func autoSignIn() {
        //auto sign in the user
        let isUserLoggedIn = UserDefaults.standard.bool(forKey: Constants.UserDefaults.isUserLoggedIn)
        
        if isUserLoggedIn == true {
            
            let username:String? = UserDefaults.standard.string(forKey: Constants.UserDefaults.Username)
            let password:String? = UserDefaults.standard.string(forKey: Constants.UserDefaults.Password)
            let defaultUsername:String! = Constants.UserDefaults.defaultUsername
            let defaultPassword:String! = Constants.UserDefaults.defaultPassword
            
                Auth.auth().signIn(withEmail: username ?? defaultUsername, password: password ?? defaultPassword) { (result, err) in
                
                if err != nil {
                    
                    if username != nil {
                        self.errorLabel.alpha = 1
                        self.errorLabel.text = err!.localizedDescription
                    }
                    
                    else {
                        self.errorLabel.alpha = 0
                    }
                }
                else {
                    self.checkUserInfo()
                }
            }
        }
    }
    
    func validateFields() -> String? {
        
        //checks if they have filled in all of the fields
        if emailTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" ||
            passwordTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" {
            return "Please fill in all fields"
        }
        return nil
    }
    
    func showError(_ message:String) {
        
        //makes the errorLabel visible and fills it with the error message
        errorLabel.text = message
        errorLabel.alpha = 1
    }
    
    func checkUserInfo() {
        
        //presents the main view controller
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        
        let vc = storyboard.instantiateViewController(identifier: Constants.Storyboard.studySessionViewController)
            
        vc.modalPresentationStyle = .overFullScreen
            
        present(vc, animated: true)
        
    }
    
    func SaveSetting() {
        
        //saves valeus for userDefaults
        let username:String? = emailTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines)
        let password:String? = passwordTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines)
        
        let defaults = UserDefaults.standard
        
        defaults.set(username, forKey: Constants.UserDefaults.Username)
        defaults.set(password, forKey: Constants.UserDefaults.Password)
        defaults.set(true, forKey: Constants.UserDefaults.isUserLoggedIn)
        
    }
    
    @IBAction func loginTapped(_ sender: Any) {
        
        //Validate Text Fields
        let error = validateFields()
        
        if error != nil {
            showError(error!)
        }
        
        else {
            
            let email = emailTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            let password = passwordTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            
            //signing in the user
            Auth.auth().signIn(withEmail: email, password: password) { (result, error) in
                //checks if there is any error
                if error != nil {
                    //user couldn't sign in
                    self.errorLabel.text = error!.localizedDescription
                    self.errorLabel.alpha = 1
                }
                else{
                    //if there is no error, set userDefaults and present the new view
                    UserDefaults.standard.set(true, forKey: Constants.UserDefaults.isUserLoggedIn)
                    UserDefaults.standard.synchronize()
                    self.SaveSetting()
                    self.checkUserInfo()
                }
            }
        }
    }
    
    @IBAction func signUpTapped(_ sender: Any) {
        
        //presents the signUp viewcontroller
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        
        let vc = storyboard.instantiateViewController(identifier: Constants.Storyboard.signUpViewController)
        
        vc.modalPresentationStyle = .overFullScreen
        
        present(vc, animated: true)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        //checks if the user is new
        if Core.shared.isNewUser() {
            //show onboarding
            let vc = storyboard?.instantiateViewController(identifier: Constants.Storyboard.onBoardingViewController) as! OnBoadringViewController
            vc.modalPresentationStyle = .fullScreen
            present(vc, animated: true)
        }
    }
    
}

class Core {
    
    static let shared = Core()
    
    func isNewUser() -> Bool {
        return !UserDefaults.standard.bool(forKey: Constants.UserDefaults.isNewUser)
    }
    
    ///
    func setIsNotNewUser(){
        UserDefaults.standard.set(true, forKey: Constants.UserDefaults.isNewUser)
    }
}
