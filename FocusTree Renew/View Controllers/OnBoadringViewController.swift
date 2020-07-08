//
//  OnBoadringViewController.swift
//  FocusTree Renew
//
//  Created by Zaichen Nhao on 2020-06-09.
//  Copyright © 2020 Zaichen. All rights reserved.
//

import UIKit

class OnBoadringViewController: UIViewController {

    @IBOutlet var holderView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
            
        // Do any additional setup after loading the view.
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        configure()
    }
    private func configure() {
        // sets up the scrollview
        
        let scrollView = UIScrollView(frame: holderView.bounds)
        holderView.addSubview(scrollView)
        
        for x in 0..<3 {
            
            let pageView = UIView(frame:CGRect(x: <#T##CGFloat#>, y: <#T##CGFloat#>, width: <#T##CGFloat#>, height: <#T##CGFloat#>))
        }
        
    }
    
}
