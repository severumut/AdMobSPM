//
//  BannerView.swift
//
//
//  Created by Umut Sever on 23.11.2024.
//

import GoogleMobileAds
import SwiftUI

public struct BannerView: UIViewRepresentable {

    // MARK: - Properties
    public let adSize: GADAdSize
    public let adType: AdType

    // MARK: - UIViewRepresentable Methods
    public func makeUIView(context: Context) -> UIView {
        let container = UIView()
        let bannerView = context.coordinator.bannerView

        container.addSubview(bannerView)
        bannerView.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            bannerView.leadingAnchor.constraint(equalTo: container.leadingAnchor),
            bannerView.trailingAnchor.constraint(equalTo: container.trailingAnchor),
            bannerView.topAnchor.constraint(equalTo: container.topAnchor),
            bannerView.bottomAnchor.constraint(equalTo: container.bottomAnchor)
        ])

        return container
    }

    public func updateUIView(_ uiView: UIView, context: Context) {
        context.coordinator.bannerView.adSize = adSize
    }

    public func makeCoordinator() -> BannerCoordinator {
        BannerCoordinator(adType: adType, adSize: adSize)
    }
}

