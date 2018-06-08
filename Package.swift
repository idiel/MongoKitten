// swift-tools-version:4.0
import PackageDescription

var package = Package(
    name: "MongoKitten",
    dependencies: [
        // For MongoDB Documents
        .package(url: "https://github.com/idiel/BSON.git", .revision("7206cc7")),
        
        // For ExtendedJSON support
        .package(url: "https://github.com/OpenKitten/Cheetah.git", from: Version(2,0,0)),

        // Authentication
        .package(url: "https://github.com/OpenKitten/CryptoKitten.git", from: Version(0,2,0)),

        // Asynchronous behaviour
        .package(url: "https://github.com/OpenKitten/Schrodinger.git", from: Version(1,0,0)),
    ],
    targets: [
        .target(name: "GeoJSON"),
        .target(name: "MongoSocket"),
        .target(name: "ExtendedJSON"),
        .target(name: "MongoKitten", dependencies: ["GeoJSON", "MongoSocket", "ExtendedJSON"])
        ]
)

// Provides Sockets + SSL
#if !os(macOS) && !os(iOS)
package.dependencies.append(.Package(url: "https://github.com/OpenKitten/KittenCTLS.git", majorVersion: 1))
#endif
