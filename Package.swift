// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
   name: "FBSnapshotTestCase",
   platforms: [
       .iOS(.v10),
       .tvOS(.v10)
   ],
   products: [
       .library(
           name: "FBSnapshotTestCase",
           targets: ["FBSnapshotTestCase"]
       ),
   ],
   targets: [
       .target(
           name: "FBSnapshotTestCase",
           dependencies: [],
           path: "FBSnapshotTestCase",
           exclude: [
               "FBSnapshotTestCase-Info.plist"
           ],
           publicHeadersPath: ".",
           cSettings: [
               .headerSearchPath("Categories")
           ],
           linkerSettings: [
               .linkedFramework("XCTest"),
               .linkedFramework("UIKit"),
               .linkedFramework("Foundation"),
               .linkedFramework("QuartzCore")
           ]
       )
   ]
)
