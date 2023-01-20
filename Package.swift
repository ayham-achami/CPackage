// swift-tools-version: 5.7
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "CPackage",
    platforms: [.iOS(.v13), .macCatalyst(.v14)],
    products: [
        .library(name: "Auth", targets: ["AuthWrapper"]),
        .library(name: "Chat", targets: ["ChatWrapper"]),
        .library(name: "DCoreUI", targets: ["DCoreUIWrapper"]),
        .library(name: "Account", targets: ["AccountWrapper"]),
        .library(name: "Profile", targets: ["ProfileWrapper"]),
        .library(name: "Analytics", targets: ["AnalyticsWrapper"]),
        .library(name: "CoreNetwork", targets: ["CoreNetworkWrapper"]),
        .library(name: "Integration", targets: ["IntegrationWrapper"]),
        .library(name: "ConferenceCore", targets: ["ConferenceCoreWrapper"]),
        .library(name: "RealmFramework", targets: ["RealmFrameworkWrapper"]),
        .library(name: "CorePresentation", targets: ["CorePresentationWrapper"]),
        .library(name: "DionSDK", targets: ["DionSDKWrapper"])
    ],
    dependencies: [
        .package(url: "https://github.com/shimastripe/Texture", from: "3.1.1"),
        .package(url: "https://github.com/ayham-achami/CRest", branch: "mainline"),
        .package(url: "https://github.com/ayham-achami/CArch", branch: "mainline"),
        .package(url: "https://github.com/evgenyneu/Cosmos.git", branch: "master"),
        .package(url: "https://github.com/ayham-achami/CUIKit.git", branch: "mainline"),
        .package(url: "https://github.com/ayham-achami/CRepository", branch: "mainline"),
        .package(url: "https://github.com/ayham-achami/CWebRTC.git", branch: "mainline"),
        .package(url: "https://github.com/ra1028/DifferenceKit.git", from: .init(1, 3, 0)),
        .package(url: "https://github.com/ayham-achami/CFoundation.git", branch: "mainline"),
        .package(url: "https://github.com/ayham-achami/CArchSwinject.git", branch: "fix/SwinjectStoryboard"),
        .package(url: "https://github.com/Alamofire/AlamofireImage.git", .upToNextMajor(from: "4.2.0"))
    ],
    targets: [
        // RealmFramework
        .target(name: "RealmFrameworkWrapper",
                dependencies: [.target(name: "RealmFramework")],
                path: "RealmFrameworkWrapper"),
        .binaryTarget(
            name: "RealmFramework",
            url: "https://nexus.inno.tech/repository/vkc-hosted-raw-ios/com/innotech/RealmFramework/RealmFramework.xcframework.zip",
            checksum: "7ec4e064b5575176164a281b8b1f87dad465f05b2e95257f59e5586363a5b11f"),
        // CoreNetwork
        .target(name: "CoreNetworkWrapper",
                dependencies: [
                    .target(name: "CoreNetwork"),
                    .product(name: "CArch", package: "CArch"),
                    .product(name: "CRest", package: "CRest"),
                    .product(name: "CFoundation", package: "CFoundation"),
                    .product(name: "AlamofireImage", package: "AlamofireImage")
                ],
                path: "CoreNetworkWrapper"),
        .binaryTarget(
            name: "CoreNetwork",
            url: "https://nexus.inno.tech/repository/vkc-hosted-raw-ios/com/innotech/CoreNetwork/401626702/CoreNetwork-27870612.401626702.xcframework.zip",
            checksum: "92667b1062822f74c6b92af59a4f152ba3b9079a70f12da3f3c02761d2383569"),
        // Integration
        .target(name: "IntegrationWrapper",
                dependencies: [
                    .target(name: "Integration"),
                    .target(name: "RealmFrameworkWrapper"),
                    .target(name: "CoreNetworkWrapper"),
                    .product(name: "CRepository", package: "CRepository")
                ],
                path: "IntegrationWrapper"),
        .binaryTarget(
            name: "Integration",
            url: "https://nexus.inno.tech/repository/vkc-hosted-raw-ios/com/innotech/Integration/325461205/Integration-27870649.325461205.xcframework.zip",
            checksum: "26d6fc42c02f6d8baa368e0d58e20209b70313f6a36c29f09bfc463b6439349d"),
        // DCoreUI
        .target(name: "DCoreUIWrapper",
                dependencies: [
                    .target(name: "DCoreUI"),
                    .target(name: "CoreNetworkWrapper"),
                    .product(name: "CUIKit", package: "CUIKit")
                ],
                path: "DCoreUIWrapper"),
        .binaryTarget(
            name: "DCoreUI",
            url: "https://nexus.inno.tech/repository/vkc-hosted-raw-ios/com/innotech/DCoreUI/503712620/DCoreUI-27870673.503712620.xcframework.zip",
            checksum: "e023bb11c5684e7f0ef5272489f48709645c8e9ab4a63f909cb710b1d9fa6eac"),
        // Analytics
        .target(name: "AnalyticsWrapper",
                dependencies: [
                    .target(name: "Analytics"),
                    .target(name: "IntegrationWrapper"),
                    .product(name: "CArchSwinject", package: "CArchSwinject")
                ],
                path: "AnalyticsWrapper"),
        .binaryTarget(
            name: "Analytics",
            url: "https://nexus.inno.tech/repository/vkc-hosted-raw-ios/com/innotech/Analytics/368531883/Analytics-27871619.368531883.xcframework.zip",
            checksum: "2117b57f5cc5d8b4e734e5371960d339dc3038e3c49083e8903bbc02a610531f"),
        // CorePresentation
        .target(name: "CorePresentationWrapper",
                dependencies: [
                    .target(name: "DCoreUIWrapper"),
                    .target(name: "AnalyticsWrapper"),
                    .target(name: "CorePresentation")
                ],
                path: "CorePresentationWrapper"),
        .binaryTarget(
            name: "CorePresentation",
            url: "https://nexus.inno.tech/repository/vkc-hosted-raw-ios/com/innotech/CorePresentation/436998197/CorePresentation-27871629.436998197.xcframework.zip",
            checksum: "2c4572792e8606983591c17f2c6891140a25512332bb60de46af459f40475eee"),
        // Auth
        .target(name: "AuthWrapper",
                dependencies: [
                    .target(name: "Auth"),
                    .target(name: "CorePresentationWrapper"),
                ],
                path: "AuthWrapper"),
        .binaryTarget(
            name: "Auth",
            url: "https://nexus.inno.tech/repository/vkc-hosted-raw-ios/com/innotech/Auth/429261225/Auth-27871667.429261225.xcframework.zip",
            checksum: "93ab5ddbcf8a886c7e49e719ac18e4313304ef1fbbba99659ae73959268c6001"),
        // ConferenceCore
        .target(name: "ConferenceCoreWrapper",
                dependencies: [
                    .target(name: "ConferenceCore"),
                    .target(name: "CorePresentationWrapper"),
                    .product(name: "Cosmos", package: "Cosmos"),
                    .product(name: "CWebRTC", package: "CWebRTC"),
                    .product(name: "DifferenceKit", package: "DifferenceKit")
                ],
                path: "ConferenceCoreWrapper"),
        .binaryTarget(
            name: "ConferenceCore",
            url: "https://nexus.inno.tech/repository/vkc-hosted-raw-ios/com/innotech/ConferenceCore/417280605/ConferenceCore-27871838.417280605.xcframework.zip",
            checksum: "705bbc6d85f0406e66ff1a31d9fe7f551c2efd5aeaee607236870a82671b9d23"),
        // Profile
        .target(name: "ProfileWrapper",
                dependencies: [
                    .target(name: "Profile"),
                    .target(name: "CorePresentationWrapper")
                ],
                path: "ProfileWrapper"),
        .binaryTarget(
            name: "Profile",
            url: "https://nexus.inno.tech/repository/vkc-hosted-raw-ios/com/innotech/Profile/378350205/Profile-27871667.378350205.xcframework.zip",
            checksum: "6a82eae13fb3495cc1f91e1a282d0dfc913de5af845a2bb34fdd720854f8bdb7"),
        // Account
        .target(name: "AccountWrapper",
                dependencies: [
                    .target(name: "Account"),
                    .target(name: "CorePresentationWrapper")
                ],
                path: "AccountWrapper"),
        .binaryTarget(
            name: "Account",
            url: "https://nexus.inno.tech/repository/vkc-hosted-raw-ios/com/innotech/Account/418311827/Account-27871694.418311827.xcframework.zip",
            checksum: "47284283ede32aad3351f63391401b219dacdcf9c26c01fa73879bd58f23f151"),
        // Chat
        .target(name: "ChatWrapper",
                dependencies: [
                    .target(name: "Chat"),
                    .target(name: "ConferenceCoreWrapper"),
                    .product(name: "AsyncDisplayKit", package: "Texture")
                ],
                path: "ChatWrapper"),
        .binaryTarget(
            name: "Chat",
            url: "https://nexus.inno.tech/repository/vkc-hosted-raw-ios/com/innotech/Chat/501117504/Chat-27873297.501117504.xcframework.zip",
            checksum: "55349822062b5160bc53b035577053b3c9d6387406f7ccf7af2c4d3b2831b9a6"),
        // DionSDK
        .target(name: "DionSDKWrapper",
                dependencies: [
                    .target(name: "DionSDK"),
                    .target(name: "AuthWrapper"),
                    .target(name: "ProfileWrapper"),
                    .target(name: "ConferenceCoreWrapper")
                ],
                path: "DionSDKWrapper"),
        .binaryTarget(
            name: "DionSDK",
            url: "https://nexus.inno.tech/repository/vkc-hosted-raw-ios/com/innotech/DionSDK/291846011/DionSDK-27871839.291846011.xcframework.zip",
            checksum: "91b2f4885c10e0c94274f9e98d9000b7932531e23eed9df818061539d6320601")
    ]
)
