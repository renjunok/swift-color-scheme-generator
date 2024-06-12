//
//  ColorSchemeKit.swift
//  swift-color-scheme-kit
//
//  Created by renjunok on 2024/6/10.
//


import SwiftUI


@available(macOS 11.0, iOS 14, *)
public class ColorSchemeKit: ObservableObject {
    
    public typealias ColorSet2 = (c1: Color?, c2: Color?)
    public typealias ColorSet3 = (c1: Color?, c2: Color?, c3: Color?)
    public typealias Secondary = (monochromatic: ColorSet2,
                                  analogous: ColorSet2,
                                  triadic: ColorSet2,
                                  tetradic: ColorSet3
    )
    
    @Published private var primaryHSB: Color.HSB?
    
    // MARK: primary color
    public var primary: Color? {
        guard let hsb = primaryHSB else { return nil }
        return Color(hue: hsb.hue, saturation: hsb.saturation, brightness: hsb.brightness)
    }
    
    // MARK: accent color
    public var accent: Color? {
        adjustedHue(by: .degrees(180))
    }
    
    // MARK: shadown color
    public var shadow: Color? {
        adjustedHue(by: .degrees(180))
    }
    
    // MARK:
    public var secondary: Secondary {
        (monochromatic: monochromaticSet, analogous: analogousSet, triadic: triadicSet, tetradic: tetradicSet)
    }
    
    // MARK: monochromatic Set
    // Change saturation and brightness
    public var monochromaticSet: ColorSet2 {
        (adjustedSaturation(by: -0.5), adjustedBrightness(by: -0.5))
    }
    
    // MARK: analogousSet
    // Adjacent 60 degrees
    public var analogousSet: ColorSet2 {
        (adjustedHue(by: .degrees(60)), adjustedHue(by: .degrees(-60)))
    }
    
    // MARK: triadicSet
    // 120 degress
    public var triadicSet: ColorSet2 {
        (c1: adjustedHue(by: .degrees(120)), c2: adjustedHue(by: .degrees(-120)))
    }
    
    // MARK: tetradicSet
    // 90 degress
    public var tetradicSet: ColorSet3 {
        (c1: adjustedHue(by: .degrees(90)), c2: adjustedHue(by: .degrees(180)), c3: adjustedHue(by: .degrees(270)))
    }
    
    // MARK: neutral color
    // Make the primary color more prominent, black, white, gray, brown, as the background, with a sense of space, breathing, and white space
    public var neutral: ColorSet3 {
        (c1: .black, c2: .white, c3: .gray)
    }
    
    
    // Color init
    public init(color: Color) {
        self.primaryHSB = color.getHSB()
    }
    
    // Hexadecimal initialization
    public init(hex: Int) {
        self.primaryHSB = Color(hex: hex).getHSB()
    }
    
    
}

// MARK: primary color related functions
@available(macOS 11.0, iOS 14, *)
extension ColorSchemeKit {
    
    /// Adjust primary color hue
    /// - Parameters:
    ///   - hue: An angle value,
    ///
    /// Adjust primary color hue
    public func adjustedPrimary(hue angle: Angle) {
        guard let hsb = primaryHSB else { return }
        let newNormalizeHue =  normalizeAngle((hsb.hue * 360) + angle.degrees) / 360
        primaryHSB?.hue = newNormalizeHue
    }
    
    /// Adjust primary color saturation
    /// - Parameters:
    ///   - saturation: 0 ~ 1,  Positive numbers increase, negative numbers decrease
    ///
    /// Adjust primary color saturation
    public func adjustedPrimary(saturation amount: Double) {
        guard let hsb = primaryHSB else { return }
        primaryHSB?.saturation = min(max(hsb.saturation + amount, 0), 1)
    }
    
    /// Adjust primary color brightness
    /// - Parameters:
    ///   - brightness: 0 ~ 1,  Positive numbers increase, negative numbers decrease
    ///
    /// Adjust primary color brightness
    // 调整主色明度
    public func adjustedPrimary(brightness amount: Double) {
        guard let hsb = primaryHSB else { return }
        primaryHSB?.brightness = min(max(hsb.brightness + amount, 0), 1)
    }
    
    ///  Modify the primary color
    /// - Parameters:
    ///   - hue: An angle value,
    ///   - saturation: 0 ~ 1,  Positive numbers increase, negative numbers decrease
    ///   - brightness: 0 ~ 1,  Positive numbers increase, negative numbers decrease
    ///
    /// Modify the primary color
    public func modifyPrimary(hue angle: Angle, saturation amount1: Double, brightness amount2: Double) {
        guard primaryHSB != nil else { return }
        
        // /360 Make sure the new hue value is between 0 and 1
        let newNormalizeHue = normalizeAngle(angle.degrees) / 360
        
        primaryHSB?.hue = newNormalizeHue
        primaryHSB?.saturation = min(max(amount1, 0), 1)
        primaryHSB?.brightness = min(max(amount2, 0), 1)
    }
    
}


// MARK:  library related functions
@available(macOS 11.0, iOS 14, *)
private extension ColorSchemeKit {
    
    // MARK: Adjust hue
    private func adjustedHue(by angle: Angle) -> Color? {
        guard let hsb = primaryHSB else { return nil }
        let newNormalizeHue =  normalizeAngle((hsb.hue * 360) + angle.degrees) / 360
        return Color(hue: newNormalizeHue, saturation: hsb.saturation, brightness: hsb.brightness)
    }
    
    // MARK: Adjust saturation
    private func adjustedSaturation(by amount: Double) -> Color? {
        guard let hsb = primaryHSB else { return nil }
        
        let newSaturation =  min(max(hsb.saturation + amount, 0), 1)
        return Color(hue: hsb.hue, saturation: newSaturation, brightness: hsb.brightness)
    }
    
    // MARK: Adjust brightness
    private func adjustedBrightness(by amount: Double) -> Color? {
        guard let hsb = primaryHSB else { return nil }
        let newBrightness = min(max(hsb.brightness + amount, 0), 1)
        return Color(hue: hsb.hue, saturation: hsb.saturation, brightness: newBrightness)
    }
    
    // MARK: Normalize angle
    private func normalizeAngle(_ angle: Double) -> Double {
        let normalizedAngle = angle.truncatingRemainder(dividingBy: 360)
        return normalizedAngle < 0 ? normalizedAngle + 360 : normalizedAngle
    }
    
}
