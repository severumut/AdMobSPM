//
//  RewardedCoordinator.swift
//
//
//  Created by Umut Sever on 23.11.2024.
//

import GoogleMobileAds
import SwiftUI

public class RewardedCoordinator: NSObject, ObservableObject {

    // MARK: - Published Properties
    @Published public var isAdReady = false

    // MARK: - Ad Properties
    private var rewardedAd: GADRewardedAd?

    // MARK: - Initialization
    public let adType: AdType

    public init(adType: AdType) {
        self.adType = adType
        super.init()
        loadAd()
    }

    // MARK: - Ad Loading
    public func loadAd() {
        let request = GADRequest()
        GADRewardedAd.load(withAdUnitID: adType.adUnitID, request: request) { [weak self] ad, error in
            guard let self else { return }
            if let error {
                print("💰Failed to load rewarded ad: \(error.localizedDescription)")
                self.isAdReady = false
                return
            }
            self.rewardedAd = ad
            self.isAdReady = true
            print("💰Rewarded ad loaded successfully.")
        }
    }

    // MARK: - Ad Presentation
    public func showAd(onUserEarnedReward: @escaping (GADAdReward) -> Void) {
        guard let rewardedAd = rewardedAd else {
            print("💰Rewarded Ad wasn't ready to be shown.")
            return
        }

        guard let rootViewController = AdMobManager.shared.getRootViewController() else {
            print("Root view controller is not available.")
            return
        }

        rewardedAd.present(fromRootViewController: rootViewController) {
            let reward = rewardedAd.adReward
            onUserEarnedReward(reward)
        }
        isAdReady = false
        loadAd()
    }
}
