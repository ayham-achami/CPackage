// swift-tools-version: 5.7
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "CPackage",
    platforms: [.iOS(.v13), .macCatalyst(.v14)],
    products: [
        // Products define the executables and libraries a package produces, and make them visible to other packages.
        .library(
            name: "CPackage",
            targets: [
                "CoreNetwork",
                "Integration"
            ]
        )
    ],
    dependencies: [],
    targets: [
        .binaryTarget(
            name: "CoreNetwork",
            url: "https://nexus.inno.tech/repository/vkc-hosted-raw-ios/com/innotech/CoreNetwork/526911581/CoreNetwork-27837641.526911581.xcframework.zip",
            checksum: "ba6f15c9b98487952b17dfa4a5234342a5a7d1bc7b25fa89803cdde7d619a943"),
        .binaryTarget(
            name: "Integration",
            url: "https://nexus.inno.tech/repository/vkc-hosted-raw-ios/com/innotech/Integration/496814869/Integration-27843082.496814869.xcframework.zip",
            checksum: "48720a196ccf5db819f4aa0f61acae7a798573b883b539fe8e5e81a60cfc29b4")
    ]
)
