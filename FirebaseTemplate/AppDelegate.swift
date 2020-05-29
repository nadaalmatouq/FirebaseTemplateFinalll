//
//  AppDelegate.swift
//  FirebaseTemplate
//
//  Created by Omar Alibrahim on 5/9/20.
//  Copyright © 2020 OMAR. All rights reserved.
//

import UIKit
import Firebase
import SwiftUI
@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    
   
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        FirebaseApp.configure()
        let forRetriveData = Env()
        forRetriveData.GetAllShoppingPosts()
        forRetriveData.GetAllCelebrationPosts()
        forRetriveData.GetAllTravelPosts()
        
        Networking.getListOf(COLLECTION_NAME: "Shopping", success: { (shoppingList: [ShoppingList]) in
                          // DispatchQueue.main.async {
            forRetriveData.allShoppingLists = shoppingList
            print("Get All shopping posts", forRetriveData.allShoppingLists)
                           //}
                       })
        
        Networking.getListOf(COLLECTION_NAME: "Celebration", success: { (celebrationList: [CelebrationList]) in
                       DispatchQueue.main.async {
                                          forRetriveData.allCelebrationLists = celebrationList
                           print("Get All shopping posts", forRetriveData.allCelebrationLists)
                   }
           
                   })
        
        Networking.getListOf(COLLECTION_NAME: "Celebration", success: { (travelList: [TravelList]) in
                    DispatchQueue.main.async {
                                       forRetriveData.alltravelLists = travelList
                        print("Get All shopping posts", forRetriveData.alltravelLists)
                }
        
                })
        
        // MainList().environmentObject(Env()).GetAll3Posts()
        // MainList().GetAll3Posts()
        // forRetriveData.GetAll3Posts()
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

