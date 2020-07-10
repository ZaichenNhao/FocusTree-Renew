//
//  SignUpViewController.swift
//  FocusTree Renew
//
//  Created by Zaichen on 2020-05-31.
//  Copyright © 2020 Zaichen. All rights reserved.
//

import UIKit
import FirebaseAuth
import Firebase
import FirebaseFirestore

class SignUpViewController: UIViewController {

    @IBOutlet weak var firstNameTextField: UITextField!
    
    @IBOutlet weak var lastNameTextField: UITextField!
    
    @IBOutlet weak var emailTextField: UITextField!
     
    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBOutlet weak var signUpButtom: UIButton!
    
    @IBOutlet weak var errorLabel: UILabel!
    
    @IBOutlet weak var signUpLabel: UILabel!
    
    @IBOutlet weak var loginButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        setUpElements()
        if UserDefaults.standard.bool(forKey: "isUserLoggedIn") == true {
            transitionToStudySession()
        }
    }
    
    func setUpElements() {
        errorLabel.alpha = 0
        
        //here you can pass through the elements that you want to be styled
        Utilities.styleTextField(firstNameTextField)
        Utilities.styleTextField(lastNameTextField)
        Utilities.styleTextField(emailTextField)
        Utilities.styleTextField(passwordTextField)
        Utilities.styleText(signUpLabel)
        Utilities.styleFilledButton(signUpButtom)
        Utilities.styleHollowButton(loginButton)
        
        //change the placeholder text, and color
        emailTextField.attributedPlaceholder = NSAttributedString(string:"Email", attributes: [NSAttributedString.Key.foregroundColor: UIColor.init(red: 1.00, green: 1.00, blue: 1.00, alpha: 1.00)])
        
        passwordTextField.attributedPlaceholder = NSAttributedString(string:"Password", attributes: [NSAttributedString.Key.foregroundColor: UIColor.init(red: 1.00, green: 1.00, blue: 1.00, alpha: 1.00)])
        
        firstNameTextField.attributedPlaceholder = NSAttributedString(string:"First Name", attributes: [NSAttributedString.Key.foregroundColor: UIColor.init(red: 1.00, green: 1.00, blue: 1.00, alpha: 1.00)])
        
        lastNameTextField.attributedPlaceholder = NSAttributedString(string:"Last Name", attributes: [NSAttributedString.Key.foregroundColor: UIColor.init(red: 1.00, green: 1.00, blue: 1.00, alpha: 1.00)])
        
        //setup background gradient
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = self.view.bounds
        
        gradientLayer.colors = [UIColor(red: 0.00, green: 0.61, blue: 0.55, alpha: 1).cgColor, UIColor(red: 0.00, green: 0.64, blue: 0.27, alpha: 1.00).cgColor]
        self.view.layer.insertSublayer(gradientLayer, at: 0)
        
    }
    
    func validateFields() -> String? {
        
        if firstNameTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" ||
            lastNameTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" ||
            emailTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" ||
            passwordTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == ""
        {
            return "Please fill in all fields"
        }
        
        //check if the password is secure
        let cleanedPassword = passwordTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        
        if Utilities.isPasswordValid(cleanedPassword) == false {
            return "Please make sure your password is at least 8 characters, contains a special character and a number"
        }
        
        return nil
    }
    
    func showError(_ message:String){
        errorLabel.text = message
        errorLabel.alpha = 1
    }
    
    func transitionToStudySession() {
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        
        let vc = storyboard.instantiateViewController(identifier: Constants.Storyboard.studySessionViewController)
        
        vc.modalPresentationStyle = .overFullScreen
        
        present(vc, animated: true)
        
    }
    
    @IBAction func signUpTapped(_ sender: Any) {
        
        // validate the fields
        
        let error = validateFields()
        
        if error != nil {
            showError(error!)
        }
            
        else{
            
            // Create cleaned versions of the data
            let firstName = firstNameTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            let lastName = lastNameTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            let email = emailTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            let password = passwordTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            
            //Create the user
            Auth.auth().createUser(withEmail: email, password: password) { (result, err) in
                    
                    
                //check for errors
                    
                if err != nil {
                    self.errorLabel.text = err!.localizedDescription
                    self.errorLabel.alpha = 1
                }
                    
                else {
                        
                    //user was created successfully
                    let db = Firestore.firestore()
                        
                    db.collection("users").addDocument(data: ["firstName": firstName, "lastName": lastName, "uid": result!.user.uid]) { (error) in
                        if error != nil{
                            self.showError("User data couldn't be saved on the database")
                        }
                        UserDefaults.standard.set(true, forKey: "isUserLoggedIn")
                        self.transitionToStudySession()
                    }
                }
            }
        }
    }
    
    @IBAction func loginTapped(_ sender: Any) {
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        
        let vc = storyboard.instantiateViewController(identifier: Constants.Storyboard.loginViewController)
        
        vc.modalPresentationStyle = .overFullScreen
        
        present(vc, animated: true)
        
    }
    
}
