// swift-tools-version: 6.1
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "ClutchNavigationKit",
    defaultLocalization: "en",
    platforms: [
        .iOS(.v17)
    ],
    products: [
        // Products define the executables and libraries a package produces, making them visible to other packages.
        .library(
            name: "ClutchNavigationKit",
            targets: ["ClutchNavigationKit"]),
    ],
    dependencies: [
        .package(url: "https://github.com/engingulek/HPDependencyKit", from: "1.0.0"),
        .package(url: "https://github.com/engingulek/ClutchModularProtocols", from: "0.0.2"),
    ],
    targets: [
        // Targets are the basic building blocks of a package, defining a module or a test suite.
        // Targets can depend on other targets in this package and products from dependencies.
        .target(
            name: "ClutchNavigationKit",
            dependencies: [
                .product(name: "DependencyKit",package: "HPDependencyKit"),
                .product(name: "ClutchModularProtocols", package: "ClutchModularProtocols")
            ]
        ),
    

    ]
)
