//
//  AppDelegate.swift
//  F1
//
//  Created by jiaguoshang on 2019/12/16.
//  Copyright © 2019 jiaguoshang. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?
//    var rootVC: ViewController?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
//        self.window?.backgroundColor = UIColor.white
//        self.window? = UIWindow(frame: UIScreen.main.bounds)
//        self.window?.makeKeyAndVisible()
//
//        self.rootVC = ViewController()
//        self.window?.rootViewController = self.rootVC
        
//        self.window = UIWindow(frame: UIScreen.main.bounds)
//
//        self.window?.backgroundColor = UIColor.white
//
//        self.window?.rootViewController = ViewController()
//
//        self.window?.makeKeyAndVisible()
        self.window = UIWindow.init(frame: UIScreen.main.bounds)

        let login = UINavigationController.init(rootViewController: HomeViewController())

        self.window?.rootViewController = login
        self.window?.backgroundColor = UIColor.white

        self.window?.makeKeyAndVisible()

        return true
    }

    // MARK: UISceneSession Lifecycle

//    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
//        // Called when a new scene session is being created.
//        // Use this method to select a configuration to create the new scene with.
//        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
//    }
//
//    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
//        // Called when the user discards a scene session.
//        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
//        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
//    }


}

