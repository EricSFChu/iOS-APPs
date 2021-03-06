//
//  AppDelegate.swift
//  Tips
//
//  Created by Eric Chu on 11/28/15.
//  Copyright © 2015 Eric Chu. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    //will store time to a dictionary when app terminates
    let timeForRestartBillAmount = NSUserDefaults.standardUserDefaults();
    let loadingForFirstTime = NSUserDefaults.standardUserDefaults();
    let localeIdentifier = NSUserDefaults.standardUserDefaults();

    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        // initialize key
        localeIdentifier.setValue(String("en_US"), forKey: "locale")
        localeIdentifier.synchronize()
        return true
    }

    func applicationWillResignActive(application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
        timeForRestartBillAmount.setObject(NSDate(), forKey: "appCloseTime")
        print(timeForRestartBillAmount.objectForKey("appCloseTime"))
        timeForRestartBillAmount.synchronize()
        loadingForFirstTime.setValue(Bool(false), forKey: "loadForFirstTime")
        loadingForFirstTime.synchronize()
    }

    func applicationDidEnterBackground(application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
        timeForRestartBillAmount.setObject(NSDate(), forKey: "appCloseTime")
        print(timeForRestartBillAmount.objectForKey("appCloseTime"))
        timeForRestartBillAmount.synchronize()
        loadingForFirstTime.setValue(Bool(false), forKey: "loadForFirstTime")
        loadingForFirstTime.synchronize()
    }

    func applicationWillEnterForeground(application: UIApplication) {
        // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
        if (NSDate().timeIntervalSinceDate(timeForRestartBillAmount.objectForKey("appCloseTime") as! NSDate) > 600)
        {
            print("Success1")
            timeForRestartBillAmount.setValue("", forKey: "restartValue")
            timeForRestartBillAmount.synchronize()
        }
    }

    func applicationDidBecomeActive(application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
        if (NSDate().timeIntervalSinceDate(timeForRestartBillAmount.objectForKey("appCloseTime") as! NSDate) > 600)
        {
            print("Success2")
            timeForRestartBillAmount.setValue("", forKey: "restartValue")
            timeForRestartBillAmount.synchronize()
        }
    }

    func applicationWillTerminate(application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
        timeForRestartBillAmount.setObject(NSDate(), forKey: "appCloseTime")
        timeForRestartBillAmount.synchronize()
        loadingForFirstTime.setValue(Bool(false), forKey: "loadForFirstTime")
        loadingForFirstTime.synchronize()
    }


}

