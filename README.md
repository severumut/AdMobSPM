
# AdMobSwiftPackage

A lightweight and modular Swift package for integrating Google AdMob ads into your iOS applications. This package supports **Banner Ads**, **Interstitial Ads**, and **Rewarded Ads** with a simple and reusable structure.

## Features

- **Banner Ads**: Display responsive banner ads with customizable sizes.
- **Interstitial Ads**: Show full-screen ads at logical breakpoints in your app.
- **Rewarded Ads**: Engage users with rewarded ads and handle user rewards efficiently.
- Easy integration with **SwiftUI** and **UIKit**.
- Centralized ad management with `AdMobManager`.

## Installation

You can integrate this package using **Swift Package Manager**:

1. Open your Xcode project.
2. Go to **File > Add Packages**.
3. Enter the repository URL and select the desired version.

## Usage

### 1. Initialize AdMob

Before displaying any ads, initialize the AdMob SDK in your `AppDelegate` or SwiftUI's `App` lifecycle:

```swift
import AdMobSwiftPackage

@main
struct MyApp: App {
    init() {
        AdMobManager.shared.initialize()
    }

    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
```

### 2. Banner Ads

Use the `BannerView` struct to add banner ads in your SwiftUI view:

```swift
import AdMobSwiftPackage
import GoogleMobileAds

struct ContentView: View {
    var body: some View {
        VStack {
            Text("Welcome to AdMob!")
            Spacer()
            BannerView(adSize: GADAdSizeBanner, adType: .banner(.testAd))
                .frame(height: 50)
        }
    }
}
```

### 3. Interstitial Ads

Create and manage interstitial ads with the `InterstitialCoordinator`:

```swift
import AdMobSwiftPackage

@StateObject var interstitialCoordinator = InterstitialCoordinator(adType: .testAd)

Button("Show Interstitial Ad") {
    if interstitialCoordinator.isAdReady {
        interstitialCoordinator.showAd()
    } else {
        print("Ad is not ready yet.")
    }
}
```

### 4. Rewarded Ads

Handle rewarded ads with the `RewardedCoordinator`:

```swift
import AdMobSwiftPackage

@StateObject var rewardedCoordinator = RewardedCoordinator(adType: .rewarded(.testAd))

Button("Show Rewarded Ad") {
    if rewardedCoordinator.isAdReady {
        rewardedCoordinator.showAd { reward in
            print("User earned \(reward.amount) \(reward.type).")
        }
    } else {
        print("Ad is not ready yet.")
    }
}
```

## Components Overview

### 1. **AdMobManager**
A singleton class to initialize the AdMob SDK and retrieve the root view controller.

### 2. **AdTypes**
Defines enums for ad types (`BannerType`, `InterstitialType`, `RewardedType`) and their associated `adUnitID`.

### 3. **BannerCoordinator**
A class to manage banner ads using `GADBannerViewDelegate`.

### 4. **BannerView**
A SwiftUI view for displaying banner ads.

### 5. **InterstitialCoordinator**
A class to handle interstitial ad loading and presentation.

### 6. **RewardedCoordinator**
A class to manage rewarded ads, including handling user rewards.

## Testing Ads

The package uses Google's test ad unit IDs by default:

- **Banner Ads**: `ca-app-pub-3940256099942544/6300978111`
- **Interstitial Ads**: `ca-app-pub-3940256099942544/4411468910`
- **Rewarded Ads**: `ca-app-pub-3940256099942544/5224354917`

Replace these with your own ad unit IDs in production.

## License

This project is licensed under the MIT License.
