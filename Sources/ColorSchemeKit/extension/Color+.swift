//
//  Color+.swift
//
//
//  Created by ren jun on 2024/6/10.
//

import SwiftUI

@available(macOS 11.0, iOS 14, *)
internal extension Color {
    typealias HSB = (hue: Double, saturation: Double, brightness: Double)
    
    // Convenience initializer to create Color from hex value
    init(hex: Int) {
        let red = Double((hex >> 16) & 0xFF) / 255.0
        let green = Double((hex >> 8) & 0xFF) / 255.0
        let blue = Double(hex & 0xFF) / 255.0
        self.init(.sRGB, red: red, green: green, blue: blue, opacity: 1.0)
    }
    
    // Function to convert Color to HSB
    func getHSB() -> HSB? {
#if canImport(UIKit)
        // iOS implementation using UIColor
        let uiColor = UIColor(self)
        var hue: CGFloat = 0
        var saturation: CGFloat = 0
        var brightness: CGFloat = 0
        var alpha: CGFloat = 0
        
        guard uiColor.getHue(&hue, saturation: &saturation, brightness: &brightness, alpha: &alpha) else {
            return nil
        }
        
        return (Double(hue), Double(saturation), Double(brightness))
        
#elseif canImport(AppKit)
        // macOS implementation using NSColor
        let nsColor = NSColor(self)
        var hue: CGFloat = 0
        var saturation: CGFloat = 0
        var brightness: CGFloat = 0
        var alpha: CGFloat = 0
        
        guard nsColor.usingColorSpace(.deviceRGB)?.getHue(&hue, saturation: &saturation, brightness: &brightness, alpha: &alpha) ?? false else {
            return nil
        }
        
        return (Double(hue), Double(saturation), Double(brightness))
#endif
    }
    

}


@available(macOS 11.0, iOS 14, *)
extension Color {
    /// Adjust the hue
    /// - Parameters:
    ///   - by: An angle value,
    /// - Returns: Return a new color
    ///
    /// Public function to adjust an angle to the hue
    public func adjustedHue(by angle: Angle) -> Color? {
        guard let hsb = self.getHSB() else { return nil }
        let normalizedAngle = ((hsb.hue * 360) + angle.degrees).truncatingRemainder(dividingBy: 360)
        let newNormalizeHue =  normalizedAngle < 0 ? (normalizedAngle + 360) / 360 : normalizedAngle / 360
        return Color(hue: newNormalizeHue, saturation: hsb.saturation, brightness: hsb.brightness)
    }
    
    
    /// Adjust the saturation
    /// - Parameters:
    ///   - by: 0 ~ 1,  Positive numbers increase, negative numbers decrease
    /// - Returns: Return a new color
    ///
    /// Adjust the color saturation
    public func adjustedSaturation(by amount: Double) -> Color? {
        guard let hsb = self.getHSB() else { return nil }
        let newSaturation = min(max(hsb.saturation + amount, 0), 1)
        return Color(hue: hsb.hue, saturation: newSaturation, brightness: hsb.brightness)
    }
    
    /// Adjust the brightness
    /// - Parameters:
    ///   - by: 0 ~ 1,  Positive numbers increase, negative numbers decrease
    /// - Returns: Return a new color
    ///
    /// Public function to adjust the brightness
    public func adjustedBrightness(by amount: Double) -> Color? {
        guard let hsb = self.getHSB() else { return nil }
        let newBrightness = min(max(hsb.brightness + amount, 0), 1)
        return Color(hue: hsb.hue, saturation: hsb.saturation, brightness: newBrightness)
    }
    
}


