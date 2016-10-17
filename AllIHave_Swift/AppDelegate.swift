//
//  AppDelegate.swift
//  AllIHave_Swift
//
//  Created by pro on 2016/10/8.
//  Copyright © 2016年 daisy. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window : UIWindow?
    var homeVC = HomeViewController()


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        window                     = UIWindow(frame: UIScreen.main.bounds)
        homeVC                     = HomeViewController()
        window?.rootViewController = UINavigationController(rootViewController: homeVC)
        window?.makeKeyAndVisible()
        
        //MARK: - Add 3DTouch Icon
        creatShortcutItem()

        
        if let shortcutItem = launchOptions?[UIApplicationLaunchOptionsKey.shortcutItem] as? UIApplicationShortcutItem {
            if shortcutItem.type == "com.daisy.AllIHave-Swift.firstButton" {
                homeVC.navigationController?.pushViewController( MoveViewController(), animated: true)
            } else if shortcutItem.type == "com.daisy.AllIHave-Swift.secondButton" {
                
            }
            return false;
        }
        return true
    }
    
    func creatShortcutItem() {
        
        let icon  = UIApplicationShortcutIcon(type: .share)
        let item0 = UIApplicationShortcutItem(type: "com.daisy.AllIHave-Swift.firstButton", localizedTitle: "Move View", localizedSubtitle: nil, icon: icon, userInfo: nil)
        let item1 = UIApplicationShortcutItem(type: "com.daisy.AllIHave-Swift.secondButton", localizedTitle: "Second View", localizedSubtitle: "There is no vc to push!", icon: icon, userInfo: nil)
        UIApplication.shared.shortcutItems = [item0,item1];
    }
    
    func application(_ application: UIApplication, performActionFor shortcutItem: UIApplicationShortcutItem, completionHandler: @escaping (Bool) -> Void) {
        if shortcutItem.type == "com.daisy.AllIHave-Swift.firstButton" {
            homeVC.navigationController?.pushViewController( MoveViewController(), animated: true)
        } else if shortcutItem.type == "com.daisy.AllIHave-Swift.secondButton" {
            
        }
    }
    
    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

