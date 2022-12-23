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
            url: "https://nexus.inno.tech/repository/vkc-hosted-raw-ios/com/innotech/CoreNetwork/431735181/CoreNetwork-27858910.431735181.xcframework.zip",
            checksum: "2ae67c63f345636c9c2d1db38cefb4ff387ee2a9db232ce4de0d5fc66ef181ca"),
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
            url: "https://nexus.inno.tech/repository/vkc-hosted-raw-ios/com/innotech/Integration/401047679/Integration-27857473.401047679.xcframework.zip",
            checksum: "05f77a9ad0ffc8eefeec99a066c81b0b1bbad338fe650d61bd14c4d755bdfd30"),
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
            url: "https://nexus.inno.tech/repository/vkc-hosted-raw-ios/com/innotech/DCoreUI/368299066/DCoreUI-27863100.368299066.xcframework.zip",
            checksum: "06b172c61c0f0887b5c906dd238aa5cdcc5cb6e0cb66461a2928e456bcded921"),
        // Analytics
        .target(name: "AnalyticsWrapper",
                dependencies: [
                    .target(name: "Analytics"),
                    .target(name: "IntegrationWrapper")
                ],
                path: "AnalyticsWrapper"),
        .binaryTarget(
            name: "Analytics",
            url: "https://nexus.inno.tech/repository/vkc-hosted-raw-ios/com/innotech/Analytics/350025445/Analytics-27863468.350025445.xcframework.zip",
            checksum: "bdb6cdf30aebb67c7b7ecda7353d9a4fd5474ac92bff268daf50acb17a8cd51c"),
        // CorePresentation
        .target(name: "CorePresentationWrapper",
                dependencies: [
                    .target(name: "DCoreUIWrapper"),
                    .target(name: "AnalyticsWrapper"),
                    .target(name: "CorePresentation"),
                    .product(name: "CArchSwinject", package: "CArchSwinject")
                ],
                path: "CorePresentationWrapper"),
        .binaryTarget(
            name: "CorePresentation",
            url: "https://nexus.inno.tech/repository/vkc-hosted-raw-ios/com/innotech/CorePresentation/417648692/CorePresentation-27860567.417648692.xcframework.zip",
            checksum: "705a4c4abfe6e93bd93518805700dd87eaca53dd17971a57844d89829c9a3200"),
        // Auth
        .target(name: "AuthWrapper",
                dependencies: [
                    .target(name: "Auth"),
                    .target(name: "CorePresentationWrapper"),
                ],
                path: "AuthWrapper"),
        .binaryTarget(
            name: "Auth",
            url: "https://nexus.inno.tech/repository/vkc-hosted-raw-ios/com/innotech/Auth/386430886/Auth-27860570.386430886.xcframework.zip",
            checksum: "1fdc556fdfdc19da119734999fbc1ebac42b822be3ed1446db7f299e62051864"),
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
            url: "https://nexus.inno.tech/repository/vkc-hosted-raw-ios/com/innotech/ConferenceCore/471449589/ConferenceCore-27860580.471449589.xcframework.zip",
            checksum: "9e9e9c1b389b0e1ba9c26761db39b7780b94f1783a001e4d7cf81d38f6d40cf1"),
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
            url: "https://nexus.inno.tech/repository/vkc-hosted-raw-ios/com/innotech/Account/273741133/Account-27860639.273741133.xcframework.zip",
            checksum: "87bcf31b3e993c97642e37cc598ac1a79fe6a06a2b6c7026daaafc7605572151")
    ]
)
