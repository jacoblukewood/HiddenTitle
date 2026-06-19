# HiddenTitle

A Swift Package Manager library that visually hides a navigation bar's title in SwiftUI while preserving the value set via `.navigationTitle(_:)`.

## The Problem

SwiftUI has no `.hidden` display mode for navigation titles. Setting `.navigationTitle("")` visually hides the title but also clears the back-button long-press menu title (which reads `navigationItem.title`). `HiddenTitle` solves this gap by keeping the `navigationTitle` intact for system menus/back-buttons while hiding it from the navigation bar.

## Requirements

- **iOS:** 16.0+
- **macOS:** 13.0+
- **Swift Tools:** 5.9+

## Installation

### Xcode

1. Go to **File** > **Add Packages...**
2. Enter the repository URL: `https://github.com/jacoblukewood/HiddenTitle.git`
3. Select the version or dependency rule you want to use.

### Swift Package Manager (Package.swift)

Add `HiddenTitle` to the dependencies of your `Package.swift`:

```swift
dependencies: [
    .package(url: "https://github.com/jacoblukewood/HiddenTitle.git", from: "1.0.0")
]
```

And add it to your target's dependencies:

```swift
.target(
    name: "MyTarget",
    dependencies: [
        .product(name: "HiddenTitle", package: "HiddenTitle")
    ]
)
```

## Usage

Import `HiddenTitle` and apply the `.toolbarTitleHidden()` modifier:

```swift
import SwiftUI
import HiddenTitle

struct ContentView: View {
    var body: some View {
        NavigationStack {
            VStack {
                Text("Content Screen")
            }
            .navigationTitle("Real Title")
            .toolbarTitleHidden() // Hides the title visually but keeps it in back-button menus
        }
    }
}
```

## License

This package is available under the MIT license. See the [LICENSE](LICENSE) file for more info.
