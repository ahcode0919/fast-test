// swift-tools-version:6.1

import Foundation
import PackageDescription

let skipPlugins: Bool = ProcessInfo.processInfo.environment["SKIP_PLUGINS"] != nil

let package = Package(
    name: "fast-test",
    products: [
        .library(
            name: "FastTest",
            targets: ["FastTest"]
        )
    ],
    dependencies: [
        .package(url: "https://github.com/SimplyDanny/SwiftLintPlugins", from: "0.62.3")
    ],
    targets: [
        .target(
            name: "FastTest",
            dependencies: [],
            plugins: skipPlugins ? [] : [
                .plugin(name: "SwiftLintBuildToolPlugin", package: "SwiftLintPlugins")
            ]
        ),
        .testTarget(
            name: "FastTestTests",
            dependencies: ["FastTest"],
            plugins: skipPlugins ? [] : [
                .plugin(name: "SwiftLintBuildToolPlugin", package: "SwiftLintPlugins")
            ]
        )
    ]
)
