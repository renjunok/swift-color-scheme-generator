import XCTest
@testable import ColorSchemeKit

@available(macOS 11.0, iOS 14, *)
final class ColorSchemeKitTests: XCTestCase {
    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        let hexColor = 0xFF0000 // Example hex color value
        let colorScheme = ColorSchemeKit(hex: hexColor)
        
        // results.
        XCTAssertEqual(colorScheme.neutral.c1!, .black)
        
        // TODO: add test case...
        
    }
}
