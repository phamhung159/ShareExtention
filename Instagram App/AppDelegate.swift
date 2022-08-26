//
//  AppDelegate.swift
//  Instagram App
//
//  Created by hung pham on 23/08/2022.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window:UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        self.window = UIWindow(frame: UIScreen.main.bounds)
        let navi = UINavigationController(rootViewController: LoginViewController())
        window?.rootViewController = navi
        window?.makeKeyAndVisible()

        return true
    }
}

