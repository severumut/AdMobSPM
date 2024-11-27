//
//  BannerCoordinator.swift
//
//
//  Created by Umut Sever on 23.11.2024.
//

import Foundation
import GoogleMobileAds

public class BannerCoordinator: NSObject, GADBannerViewDelegate {

    // MARK: - Properties
    public let adType: AdType
    public let adSize: GADAdSize

    // MARK: - Banner View
    private(set) public lazy var bannerView: GADBannerView = {
        let banner = GADBannerView(adSize: adSize)
        banner.adUnitID = adType.adUnitID
        banner.delegate = self
        banner.load(GADRequest())
        return banner
    }()

    // MARK: - Initialization
    public init(adType: AdType, adSize: GADAdSize) {
        self.adType = adType
        self.adSize = adSize
        super.init()
    }

    // MARK: - GADBannerViewDelegate Methods
    public func bannerViewDidReceiveAd(_ bannerView: GADBannerView) {
        print("💰Banner Ad received successfully!")
    }

    public func bannerView(_ bannerView: GADBannerView, didFailToReceiveAdWithError error: Error) {
        print("💰Banner Ad Failed to receive ad: \(error.localizedDescription)")
    }
}

