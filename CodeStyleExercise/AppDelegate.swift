//
//  AppDelegate.swift
//  CodeStyleExercise
//
//  Created by Maya Saxena on 12/14/16.
//
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        window = UIWindow(frame: UIScreen.main.bounds)
        let colorsViewController = ColorsViewController()
        window?.rootViewController = colorsViewController
        window?.makeKeyAndVisible()

        return true
    }
}
