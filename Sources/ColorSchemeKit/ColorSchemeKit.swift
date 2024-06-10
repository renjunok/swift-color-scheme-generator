import CoreGraphics

//
//  ColorSchemeKit.swift
//  swift-color-scheme-kit
//
//  Created by renjunok on 2024/6/10.
//


// MARK: scheme
enum ColorScheme {
    case complementary  // 对比，  180度
    case monochromatic  // 单色调 // 只调节饱和度和明亮度
    case analogous  // 近似色 // 60度内
    case triadic  // 三分  // 120度
    case tetradic  // 四分  // 90度  主色(蓝)60%  30%洋红/白(平均分配) , 10%亮绿色和黄色平均分配
}


public class ColorSchemeKit {
    private(set) var primary: String
    
    var complementary: String {
        primary + "comp"
    }
    
    // 单色调, 三个
    var secondary: String { primary + "1"}
    var secondary2: String? { primary + "2" }
    var secondary3: String? { primary + "3" }
    
    // MARK: accent color, 最多2个
    var accent: String {
        primary + " accent"
    }
    var accent2: String? {
        primary + " accent"
    }
    
    // 阴影 , 在主色调中添加黑色
    var shade: String {
        primary + "shade"
    }
    
    var dark: String {
        primary + "dark"
    }
    
    // 中性色，让主色更突出，是黑色，白色，灰，棕色，做为背景，有空间感，呼吸感，留白
    var neutral: String { "1" }
    var neutral2: String { "1" }
    var neutral3: String { "1" }
    var neutral4: String { "1" }
    var neutral5: String { "1" }
    
    // 调整主要色
    func changePrimary(_ value: CGFloat) {
        self.primary = self.primary + "\(value)"
    }
    
    
    // 微调
    // 次要色调整，但要限定在度数内0-1, 默认0.5(数字检测)
    
    public init(primaryColor: String) {
        self.primary = primaryColor
    }
    
//    static let shared = ColorSchemeKit()
    
    // 单例
    // 16进制初始化(数值检测)
    // hsv初始化
    // 系统颜色初始化
    // 初始化需要传入配色方案吗？
    
    // 1 16进制转hsv
    //
    
    
    
    // 生成次要色(单色、多色几种方案)
    
    
    
    
    
}

