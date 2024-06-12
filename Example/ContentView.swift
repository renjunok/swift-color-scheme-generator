//
//  SwiftUIView.swift
//  
//
//  Created by ren jun on 2024/6/12.
//

import SwiftUI
import ColorSchemeKit

@available(iOS 14, *)
struct ContentView: View {
    @StateObject private var colorScheme = ColorSchemeKit(hex: 0xFF0000)

    var body: some View {
        VStack {
            Text("primary")
            RoundedRectangle(cornerRadius: 10, style: .continuous)
                .fill(colorScheme.primary?.adjustedSaturation(by: 10) ?? .gray)
                .padding(.horizontal)
                .onTapGesture {
                    colorScheme.adjustedPrimary(hue: .degrees(94), saturation: 0.96, brightness: 0.74)
//                    colorScheme.adjustedPrimary(hue: .degrees(94))
//                    colorScheme.adjustedPrimary(saturation: -0.5)
//                    colorScheme.adjustedPrimary(brightness: -0.5)
                }
            
            Text("accent")
            RoundedRectangle(cornerRadius: 10, style: .continuous)
                .fill(colorScheme.accent ?? .gray)
                .padding(.horizontal)
                .shadow(color: a.shadow ?? .gray, radius: 10)
            
            Text("monochromatic")
            RoundedRectangle(cornerRadius: 10, style: .continuous)
                .fill(colorScheme.secondary.monochromatic.c1 ?? .gray)
                .padding(.horizontal)
            RoundedRectangle(cornerRadius: 10, style: .continuous)
                .fill(colorScheme.secondary.monochromatic.c2 ?? .gray)
                .padding(.horizontal)
            
            Text("analogous")
            RoundedRectangle(cornerRadius: 10, style: .continuous)
                .fill(colorScheme.secondary.analogous.c1 ?? .gray)
                .padding(.horizontal)
            RoundedRectangle(cornerRadius: 10, style: .continuous)
                .fill(colorScheme.secondary.analogous.c2 ?? .gray)
                .padding(.horizontal)
            
            Text("triadic")
            RoundedRectangle(cornerRadius: 10, style: .continuous)
                .fill(colorScheme.secondary.triadic.c1 ?? .gray)
                .padding(.horizontal)
            RoundedRectangle(cornerRadius: 10, style: .continuous)
                .fill(colorScheme.secondary.triadic.c2 ?? .gray)
                .padding(.horizontal)
            
            Text("tetradic")
            RoundedRectangle(cornerRadius: 10, style: .continuous)
                .fill(colorScheme.secondary.tetradic.c1 ?? .gray)
                .padding(.horizontal)
            RoundedRectangle(cornerRadius: 10, style: .continuous)
                .fill(colorScheme.secondary.tetradic.c2 ?? .gray)
                .padding(.horizontal)
            RoundedRectangle(cornerRadius: 10, style: .continuous)
                .fill(colorScheme.secondary.tetradic.c3 ?? .gray)
                .padding(.horizontal)
            
            Text("neutral")
            RoundedRectangle(cornerRadius: 10, style: .continuous)
                .fill(colorScheme.neutral.c1 ?? .gray)
                .padding(.horizontal)
            RoundedRectangle(cornerRadius: 10, style: .continuous)
                .fill(colorScheme.neutral.c2 ?? .gray)
                .padding(.horizontal)
            RoundedRectangle(cornerRadius: 10, style: .continuous)
                .fill(colorScheme.neutral.c3 ?? .gray)
                .padding(.horizontal)
            
        }
    }
}

@available(iOS 14, *)
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

