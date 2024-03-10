//
//  AppDelegate.swift
//  iOS-Assignment2
//
//  Created by user239796 on 2/21/24.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    //
    var test = 0
    var globalProducts = [Product]()
    
    var p1 = Product(name: "Paper", price: 5.5, quantity: 50, id:1)
    var p2 = Product(name: "Scissors", price: 13.5, quantity: 15, id:2)
    var p3 = Product(name: "Sticky Notes", price: 14.5, quantity: 35, id:3)


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        globalProducts.append(p1)
        globalProducts.append(p2)
        globalProducts.append(p3)
        // Override po	int for customization after application launch.
        return true
    }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }


}

