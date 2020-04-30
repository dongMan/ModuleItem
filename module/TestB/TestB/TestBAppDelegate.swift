//
//  AppDelegate.swift
//  TestB
//
//  Created by 董雪娇 on 2020/3/3.
//  Copyright © 2020 董雪娇. All rights reserved.
//

import UIKit
import TestBasis

@UIApplicationMain
class TestBAppDelegate: BaseAppdelegate {
//    var window: UIWindow?

    func application(_ application: UIApplication, willFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        _ = TestBManager.shared.testB_Application(application, willFinishLaunchingWithOptions: launchOptions)
        return true
    }

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        

        self.window = UIWindow.init(frame: UIScreen.main.bounds)
        self.window?.backgroundColor = .red
        let nav = UINavigationController(rootViewController: TestBMainViewController())
        self.window?.rootViewController = nav
        self.window?.makeKeyAndVisible()
        return true
    }

    func application(_ app: UIApplication, open url: URL, options: [UIApplication.OpenURLOptionsKey : Any] = [:]) -> Bool {
        _ = TestBManager.shared.testB_Application(app, open: url, options: options)
        return true
    }
    
    func applicationWillEnterForeground(_ application: UIApplication) {
        TestBManager.shared.testB_ApplicationWillEnterForeground(application)
    }
    
    func applicationDidEnterBackground(_ application: UIApplication) {
        TestBManager.shared.testB_ApplicationDidEnterBackground(application)
    }
    
    func applicationDidBecomeActive(_ application: UIApplication) {
        TestBManager.shared.testB_ApplicationDidBecomeActive(application)
    }
    
    func applicationWillResignActive(_ application: UIApplication) {
        TestBManager.shared.testB_ApplicationWillResignActive(application)
    }
}

