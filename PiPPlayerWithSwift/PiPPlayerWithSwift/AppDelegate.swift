//
//  AppDelegate.swift
//  PiPPlayerWithSwift
//
//  Created by 김혜리 on 2022/04/03.
//

import UIKit
import AVFoundation

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        window = UIWindow(frame: UIScreen.main.bounds)
        let nav = UINavigationController()
        nav.viewControllers = [ViewController()]
        window?.rootViewController = nav
        window?.makeKeyAndVisible()
        
        do {
            try AVAudioSession.sharedInstance().setCategory(.playback)
        } catch {
            print("Setting category to AVAudioSessionCategoryPlayback failed.")
        }
        
        return true
    }
}

