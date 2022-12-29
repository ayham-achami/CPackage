// swift-tools-version: 5.7
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "CPackage",
    platforms: [.iOS(.v13), .macCatalyst(.v14)],
    products: [
        .library(name: "Auth", targets: ["AuthWrapper"]),
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
        .package(url: "https://github.com/ayham-achami/CRest", branch: "mainline"),
        .package(url: "https://github.com/ayham-achami/CArch", branch: "mainline"),
        .package(url: "https://github.com/evgenyneu/Cosmos.git", branch: "master"),
        .package(url: "https://github.com/ayham-achami/CUIKit.git", branch: "mainline"),
        .package(url: "https://github.com/ayham-achami/CRepository", branch: "mainline"),
        .package(url: "https://github.com/ayham-achami/CWebRTC.git", branch: "mainline"),
        .package(url: "https://github.com/ra1028/DifferenceKit.git", from: .init(1, 3, 0)),
        .package(url: "https://github.com/ayham-achami/CFoundation.git", branch: "mainline"),
        .package(url: "https://github.com/ayham-achami/CArchSwinject.git", branch: "mainline"),
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
            url: "https://nexus.inno.tech/repository/vkc-hosted-raw-ios/com/innotech/Auth/467827946/Auth-27863437.467827946.xcframework.zip",
            checksum: "53a66a23433f793236f279597851c63969a1a94982b4364e46138d482642209c"),
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
            url: "https://nexus.inno.tech/repository/vkc-hosted-raw-ios/com/innotech/ConferenceCore/421664122/ConferenceCore-27863439.421664122.xcframework.zip",
            checksum: "986ba529e955713f958e9630c829b93e6091bfccdb367ba32ea5fe880666ed7f"),
        // Profile
        .target(name: "ProfileWrapper",
                dependencies: [
                    .target(name: "Profile"),
                    .target(name: "CorePresentationWrapper")
                ],
                path: "ProfileWrapper"),
        .binaryTarget(
            name: "Profile",
            url: "https://nexus.inno.tech/repository/vkc-hosted-raw-ios/com/innotech/Profile/509879943/Profile-27860598.509879943.xcframework.zip",
            checksum: "328cd6e1a7e2f51a74a51aa9ea6b8da84719047af3287d308b18ec31e68c25e6"),
        // Account
        .target(name: "AccountWrapper",
                dependencies: [
                    .target(name: "Account"),
                    .target(name: "CorePresentationWrapper")
                ],
                path: "AccountWrapper"),
        .binaryTarget(
            name: "Account",
            url: "https://nexus.inno.tech/repository/vkc-hosted-raw-ios/com/innotech/Account/309530927/Account-27863435.309530927.xcframework.zip",
            checksum: "defe0994c32ca0a6a16bb07081967f3728920cacd70090b57dc28280e9af3a1f"),
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
            url: "https://nexus.inno.tech/repository/vkc-hosted-raw-ios/com/innotech/DionSDK/377768781/DionSDK-27863445.377768781.xcframework.zip",
            checksum: "9e0f9c2d08e47351003214db517d0b7f7b611699124f20833a9a1fcb2fd45662")
    ]
)
