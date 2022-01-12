// swift-tools-version:5.3
import PackageDescription

let package = Package(
    name: "FastTest",
    products: [
        .library(
            name: "FastTest",
            targets: ["FastTest"]),
    ],
    dependencies: [],
    targets: [
        .target(
            name: "FastTest",
            dependencies: []),
        .testTarget(
            name: "FastTestTests",
            dependencies: ["FastTest"]),
    ]
)
