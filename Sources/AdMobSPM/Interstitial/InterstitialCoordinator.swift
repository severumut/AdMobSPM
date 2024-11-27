//
//  InterstitialCoordinator.swift
//
//
//  Created by Umut Sever on 23.11.2024.
//

import GoogleMobileAds
import SwiftUI

public class InterstitialCoordinator: NSObject, ObservableObject {

    // MARK: - Published Properties
    @Published public var isAdReady = false

    // MARK: - Ad Properties
    private var interstitialAd: GADInterstitialAd?

    // MARK: - Initialization
    public let adType: InterstitialType

    public init(adType: InterstitialType) {
        self.adType = adType
        super.init()
        loadAd()
    }

    // MARK: - Ad Loading
    public func loadAd() {
        let request = GADRequest()
        GADInterstitialAd.load(withAdUnitID: adType.adUnitID, request: request) { [weak self] ad, error in
            guard let self else { return }
            if let error {
                print("💰Interstitial ad failed to load: \(error.localizedDescription)")
                self.isAdReady = false
                return
            }
            self.interstitialAd = ad
            self.isAdReady = true
            print("💰Interstitial ad loaded.")
        }
    }

    // MARK: - Ad Presentation
    public func showAd() {
        guard let rootViewController = AdMobManager.shared.getRootViewController() else {
            print("💰Root view controller is not available.")
            return
        }
        guard let interstitialAd = interstitialAd else {
            print("💰Interstitial ad is not ready.")
            return
        }
        interstitialAd.present(fromRootViewController: rootViewController)
        isAdReady = false
        loadAd()
    }
}
