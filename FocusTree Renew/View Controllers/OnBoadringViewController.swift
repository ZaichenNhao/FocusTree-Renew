//
//  OnBoadringViewController.swift
//  FocusTree Renew
//
//  Created by Zaichen Nhao on 2020-06-09.
//  Copyright © 2020 Zaichen. All rights reserved.
//

import UIKit

class OnBoadringViewController: UIViewController {

    @IBOutlet weak var testButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func buttonTapped(_ sender: Any) {
        
        let defaults = UserDefaults.standard
        
        defaults.set(true, forKey: Constants.UserDefaults.doneOnBoarding)
        
        UserDefaults.standard.synchronize()
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        
        let vc = storyboard.instantiateViewController(identifier: Constants.Storyboard.loginViewController)
        
        vc.modalPresentationStyle = .overFullScreen
        
        present(vc, animated: true)
        
    }
}
