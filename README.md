# swift-color-scheme-kit

This kit is a color combination toolkit.
It provides a base color and generates primary color, accent color, shadow color, monochromatic color, analogous color, triadic color, tetradic color, and neutral color based on the color wheel.
It aims to help individual developers and small to medium-sized development teams who lack professional UI designers.

## UI Color Scheme Principles

- **Primary Color**: 60%
- **Secondary Color**: 30%
- **Accent Color**: 10%

**Primary Color** is the main color set by the developer.

**Secondary Color** contains 4 color schemes, each offering 2-4 colors for developers to choose from.

**Accent Color** is mainly used for text or UI elements that need emphasis.

## Usage

- **Swift version**: > 5.3
- **iOS**: > 14

## Installation via Xcode Package Manager
### Swift Package Manager

You can add ColorSchemeKit to your Xcode project by adding it as a dependency.

1. From the **File** menu, select **Swift Packages > Add Package Dependency**.
2. Enter `https://github.com/renjunok/swift-color-scheme-kit.git` as the repository URL.
3. Specify the version as `1.0.0`.


Import the library:

```swift
import ColorSchemeKit
```

### Example

```swift
@StateObject private var colorScheme = ColorSchemeKit(hex: 0xFF0000)  // Developer-specified color
// or
@StateObject private var colorScheme = ColorSchemeKit(.red) // Developer-specified color
```

Access the primary color:

```swift
colorScheme.primary
```

Access the secondary color schemes:

```swift
colorScheme.secondary.monochromatic.c1 - c2
colorScheme.secondary.analogous.c1 - c2
colorScheme.secondary.triadic.c1 - c2
colorScheme.secondary.tetradic.c1 - c3
```

Access the neutral colors:

```swift
colorScheme.neutral.c1 - c3
```

Access the shadow color:

```swift
colorScheme.shadow
```

### Adjusting the Primary Color

```swift
colorScheme.adjustedPrimary(hue: .degrees(94))
colorScheme.adjustedPrimary(saturation: -0.5)
colorScheme.adjustedPrimary(brightness: -0.5)
colorScheme.modifyPrimary(hue: .degrees(94), saturation: 0.96, brightness: 0.74)
```

### Personalizing Color Adjustments

```swift
colorScheme.accent?.adjustedHue(by: .degrees(-100))
colorScheme.secondary.monochromatic?.c1.adjustedSaturation(by: 0.5)
colorScheme.secondary.tetradic?.c1.adjustedBrightness(by: -0.1)
```

For more examples, refer to the `Example` directory.

Feel free to star and fork the repository, and submit issues.

---

