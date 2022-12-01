// swift-tools-version: 5.7
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "CoreNetwork",
    platforms: [.iOS(.v13), .macCatalyst(.v14)],
    products: [
        // Products define the executables and libraries a package produces, and make them visible to other packages.
        .library(
            name: "CoreNetwork",
            targets: ["CoreNetwork"])
    ],
    dependencies: [],
    targets: [
        .binaryTarget(name: "CoreNetwork",
                      url: "https://nexus.inno.tech/repository/vkc-hosted-raw-ios/test/CoreNetwork.xcframework.zip",
                      checksum: "becf21793a04d3059780ae4f9cce2f96897d812d34f39dad0457ac18a2a0a316")
    ]
)
