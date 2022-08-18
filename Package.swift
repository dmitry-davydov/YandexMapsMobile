// swift-tools-version: 5.5
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "YandexMapsMobile",
    platforms: [
        .iOS(.v12),
    ],
    products: [
        // Products define the executables and libraries a package produces, and make them visible to other packages.
        .library(
            name: "YandexMapsMobile",
            targets: ["YandexMapsMobile"]),
    ],
    dependencies: [
        // Dependencies declare other packages that this package depends on.
        // .package(url: /* package url */, from: "1.0.0"),
    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages this package depends on.
        .binaryTarget(
            name: "YandexMapsMobileBinary",
            url: "https://github.com/dmitry-davydov/YandexMapsMobile/releases/download/4.1.0/YandexMapsMobile.xcframework.zip",
            checksum: "39dfada35ae5e7df7ee5df6d5f489906bc093c8da60bc829c2361d0920062892"
        ),
        .target(
            name: "YandexMapsMobile",
            dependencies: [
                .target(name: "YandexMapsMobileBinary"),
            ],
            linkerSettings: [
                .linkedFramework("CoreLocation"),
                .linkedFramework("CoreTelephony"),
                .linkedFramework("SystemConfiguration"),
                .linkedLibrary("c++"),
                .unsafeFlags(["-ObjC"]),
            ]
        ),
    ]
)
