// swift-tools-version:5.3
import PackageDescription

let package = Package(
  name: "iOSSnapshotTestCase",
  platforms: [.iOS(.v10), .tvOS(.v10)],
  products: [
      .library(
          name: "iOSSnapshotTestCase",
          type: .dynamic,
          targets: ["iOSSnapshotTestCase", "iOSSnapshotTestCaseCore"]
      ),
  ],
  dependencies: [],
  targets: [
      .target(
          name: "iOSSnapshotTestCase",
          dependencies: ["iOSSnapshotTestCaseCore"],
          path: "FBSnapshotTestCase",
          sources: ["SwiftSupport.swift"]
      ),
      .target(
          name: "iOSSnapshotTestCaseCore",
          dependencies: [],
          path: ".",                                    // ← Repository root
          sources: ["FBSnapshotTestCase"],              // ← Source directory
          exclude: [
              "FBSnapshotTestCase/FBSnapshotTestCase-Info.plist",
              "FBSnapshotTestCase/SwiftSupport.swift"
          ],
          publicHeadersPath: "FBSnapshotTestCase",      // ← Preserves FBSnapshotTestCase/ prefix!
          cSettings: [
              .headerSearchPath("FBSnapshotTestCase/Categories")
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
