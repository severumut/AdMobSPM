//
//  AdMobManager.swift
//
//
//  Created by Umut Sever on 23.11.2024.

import GoogleMobileAds
import UIKit

public class AdMobManager: NSObject {
    public static let shared = AdMobManager()

    private override init() {}

    // MARK: - AdMob Initialization
    public func initialize() {
        GADMobileAds.sharedInstance().start { status in
            print("💰AdMob initialized successfully.")
        }
    }

    // MARK: - Get Root View Controller
    public func getRootViewController() -> UIViewController? {
        return UIApplication.shared
            .connectedScenes
            .compactMap { $0 as? UIWindowScene }
            .flatMap { $0.windows }
            .first { $0.isKeyWindow }?.rootViewController
    }
}
