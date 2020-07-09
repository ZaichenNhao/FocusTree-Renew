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
    
    let scrollView = UIScrollView()
    
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
        
        scrollView.frame = holderView.bounds
        holderView.addSubview(scrollView)
        
        let titles = ["First", "Second", "Third"]
        let desc = ["First view description :)", "Second view description", "Third view description"]
        for x in 0..<3 {
            
            let pageView = UIView(frame:CGRect(x: CGFloat(x) * (holderView.frame.size.width), y: 0, width: holderView.frame.size.width, height: holderView.frame.size.height))
            
            scrollView.addSubview(pageView)
            
            //Title, Image, Description,Button
            let titleLabel = UILabel(frame: CGRect(x: 10, y: 25, width: pageView.frame.size.width-20, height: 120))
            let imageView = UIImageView(frame: CGRect(x: 10, y: 90, width: pageView.frame.size.width-20, height: pageView.frame.size.height
            - 205))
            let descLabel = UILabel(frame: CGRect(x: 10, y: pageView.frame.size.height-300, width: pageView.frame.size.width-20, height: 120))
            let button = UIButton(frame: CGRect(x: 10, y: pageView.frame.size.height-60, width: pageView.frame.size.width-40, height: 50))
            
            titleLabel.textAlignment = .center
            titleLabel.font = UIFont(name: "Helvetica-Bold", size: 32)
            pageView.addSubview(titleLabel)
            titleLabel.text = titles[x]
            
            descLabel.textAlignment = .center
            descLabel.font = UIFont(name: "Helvetica", size: 20)
            pageView.addSubview(descLabel)
            descLabel.text = desc[x]
            
            imageView.contentMode = .scaleAspectFit
            imageView.image = UIImage(named: "onBoarding_\(x+1)")
            pageView.addSubview(imageView)
            
            button.setTitleColor(.white, for: .normal)
            button.backgroundColor = .black
            button.setTitle("Next", for: .normal)
            if x == 2 {
                button.setTitle("Get Started", for: .normal)
            }
            button.addTarget(self, action: #selector(didTapButton(_:)), for: .touchUpInside)
            button.tag = x+1
            pageView.addSubview(button)
            
        }
        
        scrollView.contentSize = CGSize(width: holderView.frame.size.width*3, height: 0)
        scrollView.isPagingEnabled = true
        
    }
    
    @objc func didTapButton(_ button: UIButton) {
        guard button.tag<3 else {
            //dismiss onboarding flow
            Core.shared.setIsNotNewUser()
            dismiss(animated: true, completion: nil)
            return
        }
        //scroll the scrollView
        scrollView.setContentOffset(CGPoint(x: holderView.frame.size.width * CGFloat(button.tag), y: 0), animated: true)
    }
    
}
