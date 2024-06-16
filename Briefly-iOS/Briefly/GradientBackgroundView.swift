//
//  GradientBackgroundVie.swift
//  Briefly
//
//  Created by Andreas Ink on 6/16/24.
//

import SwiftUI

@available(iOS 18.0, *)
struct GradientBackgroundView: View {
    
    @State var t: Float = 0.0
    @State var timer: Timer?
    
    let colors: [Color]
    
    var body: some View {
        MeshGradient(
            width: 4, height: 4,
            points: [
                [0, 0],
                [sinInRange(0.1...0.6, offset: 0.897, timeScale: 0.484, t: t), 0],
                [sinInRange(0.6...0.9, offset: 0.139, timeScale: 0.139, t: t), 0],
                [sinInRange(1.1...1.6, offset: 0.279, timeScale: 0.244, t: t), 0],
                [0, sinInRange(0.1...0.35, offset: 5.21, timeScale: 0.942, t: t)],
                [sinInRange(0.2...0.6, offset: 1.62, timeScale: 0.294, t: t), sinInRange(0.2...0.6, offset: 0.12, timeScale: 0.522, t: t)],
                [sinInRange(0.61...0.8, offset: 0.023, timeScale: 0.535, t: t), sinInRange(0.1...0.3, offset: 0.21, timeScale: 0.935, t: t)],
                [sinInRange(1.1...1.6, offset: 0.234, timeScale: 0.245, t: t), sinInRange(0.1...0.4, offset: 0.92, timeScale: 0.184, t: t)],
                [0, sinInRange(0.5...0.8, offset: 0.321, timeScale: 0.349, t: t)],
                [sinInRange(0.4...0.6, offset: 0.39, timeScale: 0.024, t: t), sinInRange(0.65...0.9, offset: 0.221, timeScale: 0.248, t: t)],
                [sinInRange(0.6...0.85, offset: 1.162, timeScale: 0.845, t: t), sinInRange(0.5...0.8, offset: 0.121, timeScale: 0.045, t: t)],
                [sinInRange(1.1...1.2, offset: 0.274, timeScale: 0.245, t: t), sinInRange(0.65...0.8, offset: 0.82, timeScale: 0.638, t: t)],
                [0, sinInRange(1.4...1.85, offset: 1.21, timeScale: 0.295, t: t)],
                [sinInRange(0.4...0.6, offset: 0.23, timeScale: 0.283, t: t), sinInRange(1.1...1.4, offset: 0.519, timeScale: 0.724, t: t)],
                [sinInRange(0.7...0.85, offset: 0.328, timeScale: 0.049, t: t), sinInRange(1.2...1.6, offset: 0.929, timeScale: 0.294, t: t)],
                [sinInRange(1.1...1.15, offset: 0.28, timeScale: 0.053, t: t), sinInRange(1.3...1.6, offset: 0.341, timeScale: 0.824, t: t)],
            ],
            colors: colors
        )
        .onAppear {
            timer = Timer.scheduledTimer(withTimeInterval: 0.02, repeats: true) { _ in
                t += 0.01
            }
        }
        .ignoresSafeArea()
    }
    
    func sinInRange(_ range: ClosedRange<Float>, offset: Float, timeScale: Float, t: Float) -> Float {
        let amplitude = (range.upperBound - range.lowerBound) / 2
        let midPoint = (range.upperBound + range.lowerBound) / 2
        return midPoint + amplitude * sin(timeScale * t + offset)
    }
}

#Preview {
    if #available(iOS 18.0, *) {
        GradientBackgroundView(colors: [
            Color(red: 0.26275, green: 0.03922, blue: 0.36471), // deepPurple
            Color(red: 0.14118, green: 0.02745, blue: 0.31373), // darkPurple
            Color(red: 0.502, green: 0.02745, blue: 0.502), // lightDarkPurple
            Color(red: 0.294, green: 0.0, blue: 0.510), // veryDarkPurple
            Color(red: 0.11765, green: 0.01176, blue: 0.25882) // darkerPurple
        ])
    } else {
        EmptyView()
    }
}
