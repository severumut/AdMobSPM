//
//  AdTypes.swift
//
//
//  Created by Umut Sever on 23.11.2024.
//

import Foundation

// MARK: - Ad Types Enum
public enum AdType {
    case banner(BannerType)
    case interstitial(InterstitialType)
    case rewarded(RewardedType)

    public var adUnitID: String {
        switch self {
        case .banner(let type):
            return type.adUnitID
        case .interstitial(let type):
            return type.adUnitID
        case .rewarded(let type):
            return type.adUnitID
        }
    }
}

// MARK: - Banner Ads
public enum BannerType {
    case testAd

    public var adUnitID: String {
        switch self {
        case .testAd:
            return "ca-app-pub-3940256099942544/6300978111"
        }
    }
}

// MARK: - Interstitials Ads
public enum InterstitialType {
    case testAd

    public var adUnitID: String {
        switch self {
        case .testAd:
            return "ca-app-pub-3940256099942544/4411468910"
        }
    }
}

// MARK: - Rewarded Ads
public enum RewardedType {
    case testAd

    public var adUnitID: String {
        switch self {
        case .testAd:
            return "ca-app-pub-3940256099942544/5224354917"
        }
    }
}
