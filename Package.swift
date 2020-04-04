// swift-tools-version:5.2
import PackageDescription

let package = Package(
    name: "AlexisUI",
    platforms: [
        .iOS(.v13)
    ],
    products: [
        .library(name: "AlexisUI", targets: ["AlexisUI"]),
    ],
    targets: [
        .target(name: "AlexisUI"),
    ]
)
