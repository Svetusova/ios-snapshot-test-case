// swift-tools-version:5.3
import PackageDescription

let package = Package(
  name: "iOSSnapshotTestCase",
  platforms: [.iOS(.v10), .tvOS(.v10)],
  products: [
      .library(
          name: "iOSSnapshotTestCase",  // ← Must match what Xcode expects
          type: .dynamic,
          targets: ["iOSSnapshotTestCase", "iOSSnapshotTestCaseCore"]
      ),
  ],
  targets: [
      .target(
          name: "iOSSnapshotTestCase",
          dependencies: ["iOSSnapshotTestCaseCore"],
          path: "FBSnapshotTestCase",
          sources: ["SwiftSupport.swift"]
      ),
      .target(
          name: "iOSSnapshotTestCaseCore",
          path: "FBSnapshotTestCase",
          exclude: ["FBSnapshotTestCase-Info.plist", "SwiftSupport.swift"],
          publicHeadersPath: ".",
          cSettings: [.headerSearchPath("Categories")],
          linkerSettings: [
              .linkedFramework("XCTest"),
              .linkedFramework("UIKit"),
              .linkedFramework("Foundation"),
              .linkedFramework("QuartzCore")
          ]
      )
  ]
)
