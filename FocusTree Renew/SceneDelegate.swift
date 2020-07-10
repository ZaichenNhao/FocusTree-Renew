//
//  SceneDelegate.swift
//  FocusTree Renew
//
//  Created by Zaichen on 2020-05-31.
//  Copyright © 2020 Zaichen. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        // Use this method to optionally configure and attach the UIWindow `window` to the provided UIWindowScene `scene`.
        // If using a storyboard, the `window` property will automatically be initialized and attached to the scene.
        // This delegate does not imply the connecting scene or session are new (see `application:configurationForConnectingSceneSession` instead).
        guard let _ = (scene as? UIWindowScene) else { return }
        
        /*if let windowScene = scene as? UIWindowScene {
            
            let window = UIWindow(windowScene: windowScene)
            
            if !Core.shared.isLoggedIn() {
                
                window.rootViewController = LoginViewController()
                
                self.window = window
                window.makeKeyAndVisible()
            }
            else {
                
                window.rootViewController = StudySessionViewController()
                
                self.window = window
                window.makeKeyAndVisible()
            }
        }*/
        
        /*if let windowScene = scene as? UIWindowScene {
            
            self.window = UIWindow(windowScene: windowScene)
            let storyboard: UIStoryboard? = nil
            
            let isFirstTime = UserDefaults.standard.bool(forKey: Constants.UserDefaults.doneOnBoarding)
            let isIn = UserDefaults.standard.bool(forKey: Constants.UserDefaults.isUserLoggedIn)
            
            if(isIn == true) {
                //if they are already signed in
                
                let initialViewController = storyboard?.instantiateViewController(withIdentifier: Constants.Storyboard.studySessionViewController)
                self.window!.rootViewController = initialViewController
                self.window!.makeKeyAndVisible()
                
            }
            else if isFirstTime == true {
                //if this is first time, show onBoarding
                let initialViewController = storyboard?.instantiateViewController(withIdentifier: Constants.Storyboard.onBoardingViewController)
                self.window!.rootViewController = initialViewController
                self.window!.makeKeyAndVisible()
            }
            else {
                //show loginscreen
                let initialViewController = storyboard?.instantiateViewController(withIdentifier: Constants.Storyboard.loginViewController)
                self.window!.rootViewController = initialViewController
                self.window!.makeKeyAndVisible()
                
            }*/
            
        
        
    
        /*let onBoardingVC = OnBoadringViewController()
        let studySessionVC = StudySessionViewController()
        let loginVC = LoginViewController()
        let doneOnBoarding = UserDefaults.standard.bool(forKey: Constants.UserDefaults.doneOnBoarding)
        let isLoggedIn = UserDefaults.standard.bool(forKey: Constants.UserDefaults.isUserLoggedIn)
        
        if doneOnBoarding != true {
            self.window?.rootViewController = onBoardingVC
            self.window?.makeKeyAndVisible()
        }
        else if isLoggedIn == true {
            
            let username:String? = UserDefaults.standard.string(forKey: Constants.UserDefaults.Username)
            let password:String? = UserDefaults.standard.string(forKey: Constants.UserDefaults.Password)
            let defaultUsername:String! = Constants.UserDefaults.defaultUsername
            let defaultPassword:String! = Constants.UserDefaults.defaultPassword
            
            Auth.auth().signIn(withEmail: username ?? defaultUsername, password: password ?? defaultPassword) { (result, err) in
                
                if err == nil {
                    
                    self.window?.rootViewController = studySessionVC
                    self.window?.makeKeyAndVisible()
                    
                }
            }
        }
        else {
            self.window?.rootViewController = loginVC
            self.window?.makeKeyAndVisible()
        }*/
    }

    func sceneDidDisconnect(_ scene: UIScene) {
        // Called as the scene is being released by the system.
        // This occurs shortly after the scene enters the background, or when its session is discarded.
        // Release any resources associated with this scene that can be re-created the next time the scene connects.
        // The scene may re-connect later, as its session was not neccessarily discarded (see `application:didDiscardSceneSessions` instead).
    }

    func sceneDidBecomeActive(_ scene: UIScene) {
        // Called when the scene has moved from an inactive state to an active state.
        // Use this method to restart any tasks that were paused (or not yet started) when the scene was inactive.
    }

    func sceneWillResignActive(_ scene: UIScene) {
        // Called when the scene will move from an active state to an inactive state.
        // This may occur due to temporary interruptions (ex. an incoming phone call).
    }

    func sceneWillEnterForeground(_ scene: UIScene) {
        // Called as the scene transitions from the background to the foreground.
        // Use this method to undo the changes made on entering the background.
    }

    func sceneDidEnterBackground(_ scene: UIScene) {
        // Called as the scene transitions from the foreground to the background.
        // Use this method to save data, release shared resources, and store enough scene-specific state information
        // to restore the scene back to its current state.
    }


}

