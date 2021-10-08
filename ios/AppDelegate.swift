//
//  AppDelegate.swift
//  RNSample66Issue1
//
//  Created by Varun Gupta on 08/10/21.
//

import Foundation
import React
import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate, RCTBridgeDelegate {
    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        let bridge = RCTBridge(delegate: self, launchOptions: launchOptions)
        let rootView = RCTRootView(
          bridge: bridge!,
            moduleName: "RNSample66Issue1",
            initialProperties: nil)
        if #available(iOS 13.0, *) {
            rootView.backgroundColor = UIColor.systemBackground
        } else {
            rootView.backgroundColor = UIColor.white
        }
        window = UIWindow(frame: UIScreen.main.bounds)
        let rootViewController = UIViewController()
        rootViewController.view = rootView
        window!.rootViewController = rootViewController
        window!.makeKeyAndVisible()
        return true
    }

    func sourceURL(for bridge: RCTBridge?) -> URL? {
        #if DEBUG
        return RCTBundleURLProvider.sharedSettings().jsBundleURL(forBundleRoot: "index", fallbackResource: nil)
        #else
        return Bundle.main.url(forResource: "main", withExtension: "jsbundle")
        #endif
    }
}
