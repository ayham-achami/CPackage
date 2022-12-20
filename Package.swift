// swift-tools-version: 5.7
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "CPackage",
    platforms: [.iOS(.v13), .macCatalyst(.v14)],
    products: [
        .library(name: "Auth", targets: ["AuthWrapper"]),
        .library(name: "CoreUI", targets: ["CoreUIWrapper"]),
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
            url: "https://nexus.inno.tech/repository/vkc-hosted-raw-ios/com/innotech/CoreNetwork/302172153/CoreNetwork-27841957.302172153.xcframework.zip",
            checksum: "c7e10c7d95a68fa72239dc895252f6306d2639d546c632b9b85fe2a17e4d205c"),
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
        // CoreUI
        .target(name: "CoreUIWrapper",
                dependencies: [
                    .target(name: "CoreUI"),
                    .target(name: "CoreNetworkWrapper"),
                    .product(name: "CUIKit", package: "CUIKit")
                ],
                path: "CoreUIWrapper"),
        .binaryTarget(
            name: "CoreUI",
            url: "https://nexus.inno.tech/repository/vkc-hosted-raw-ios/com/innotech/CoreUI/419514678/CoreUI-27857351.419514678.xcframework.zip",
            checksum: "85213193d3bd3bab673a461be156f386fa1571cf2ab30b4e667eb44ff89a64bb"),
        // Analytics
        .target(name: "AnalyticsWrapper",
                dependencies: [
                    .target(name: "Analytics"),
                    .target(name: "IntegrationWrapper")
                ],
                path: "AnalyticsWrapper"),
        .binaryTarget(
            name: "Analytics",
            url: "https://nexus.inno.tech/repository/vkc-hosted-raw-ios/com/innotech/Analytics/300716819/Analytics-27857233.300716819.xcframework.zip",
            checksum: "b76b1431d26f05729ac7c963621e313fc0963a7dcf08dd0b74990a6846461bf5"),
        // CorePresentation
        .target(name: "CorePresentationWrapper",
                dependencies: [
                    .target(name: "CoreUIWrapper"),
                    .target(name: "AnalyticsWrapper"),
                    .target(name: "CorePresentation"),
                    .product(name: "CArchSwinject", package: "CArchSwinject")
                ],
                path: "CorePresentationWrapper"),
        .binaryTarget(
            name: "CorePresentation",
            url: "https://nexus.inno.tech/repository/vkc-hosted-raw-ios/com/innotech/CorePresentation/316729615/CorePresentation-27857758.316729615.xcframework.zip",
            checksum: "60f97df34c92487ec2ada083ffc876756ffaa0db802d30d6ee3b8dede628dedd"),
        // Auth
        .target(name: "AuthWrapper",
                dependencies: [
                    .target(name: "Auth"),
                    .target(name: "CorePresentationWrapper"),
                ],
                path: "AuthWrapper"),
        .binaryTarget(
            name: "Auth",
            url: "https://nexus.inno.tech/repository/vkc-hosted-raw-ios/com/innotech/Auth/286060656/Auth-27858722.286060656.xcframework.zip",
            checksum: "ee2180f38160daec76a7e620539bf7627f5e407058dba4ebe8a5e8b7169cfcdc"),
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
            url: "https://nexus.inno.tech/repository/vkc-hosted-raw-ios/com/innotech/ConferenceCore/438530739/ConferenceCore-27858759.438530739.xcframework.zip",
            checksum: "538e833eef2b2aadfcf1d111c87df49f3a8395e56e820fa59ea012703e533cf6"),
        // Profile
        .target(name: "ProfileWrapper",
                dependencies: [
                    .target(name: "Profile"),
                    .target(name: "CorePresentationWrapper")
                ],
                path: "ProfileWrapper"),
        .binaryTarget(
            name: "Profile",
            url: "https://nexus.inno.tech/repository/vkc-hosted-raw-ios/com/innotech/Profile/276760598/Profile-27858779.276760598.xcframework.zip",
            checksum: "3c992e8488d59913d96b712ece69a6f74a16bae63c7352a668b9f7170d6ef59f"),
        // Account
        .target(name: "AccountWrapper",
                dependencies: [
                    .target(name: "Account"),
                    .target(name: "CorePresentationWrapper")
                ],
                path: "AccountWrapper"),
        .binaryTarget(
            name: "Account",
            url: "https://nexus.inno.tech/repository/vkc-hosted-raw-ios/com/innotech/Account/291050602/Account-27858813.291050602.xcframework.zip",
            checksum: "ed66eef751809defc890a958ba9f2da4a5e69cb1bd0941df9abee20fa57782b6")
    ]
)
