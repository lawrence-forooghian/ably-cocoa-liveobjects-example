// swift-tools-version: 6.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "AblyCocoaLiveObjectsExample",
    platforms: [
        .macOS(.v11),
        .iOS(.v14),
        .tvOS(.v14),
    ],
    dependencies: [
        .package(
            url: "https://github.com/ably/ably-cocoa",
            branch: "2035-investigate-liveobjects-plugin"
        ),
        .package(
            url: "https://github.com/lawrence-forooghian/ably-cocoa-liveobjects-plugin",
            branch: "main"
        ),
    ],
    targets: [
        // Targets are the basic building blocks of a package, defining a module or a test suite.
        // Targets can depend on other targets in this package and products from dependencies.
        .executableTarget(
            name: "AblyCocoaLiveObjectsExample",
            dependencies: [
                .product(
                    name: "Ably",
                    package: "ably-cocoa"
                ),
                .product(
                    name: "AblyLiveObjects",
                    package: "ably-cocoa-liveobjects-plugin"
                ),
            ]
        ),
    ]
)
