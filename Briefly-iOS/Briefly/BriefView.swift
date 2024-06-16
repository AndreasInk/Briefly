//
//  BriefView.swift
//  Briefly
//
//  Created by Andreas Ink on 6/16/24.
//

import SwiftUI

@available(iOS 18.0, *)
struct BriefView: View {
    let colors: [[Color]] = [GradientBackgroundView.blueGradientColors, GradientBackgroundView.purpleGradientColors, GradientBackgroundView.redGradientColors, GradientBackgroundView.yellowGradientColors, GradientBackgroundView.greenGradientColors]
    var body: some View {
        ScrollView(.horizontal) {
            LazyHStack(spacing: 16) {
                ForEach(colors, id: \.self) { color in
                    VStack(spacing: 8) {
                        ZStack {
                            if #available(iOS 18.0, *) {
                                GradientBackgroundView(colors: color)
                                    .clipShape(RoundedRectangle(cornerRadius: 32))
                                    .scrollTransition(
                                        axis: .horizontal
                                    ) { content, phase in
                                        return content
                                            .offset(x: phase.value * -250)
                                    }
                            } else {
                                EmptyView()
                            }
                        }
                        .containerRelativeFrame(.horizontal)
                        .clipShape(RoundedRectangle(cornerRadius: 32))
                    }
                    
                }.scrollTargetLayout()
                    .scrollIndicators(.never)
            }
            .contentMargins(.horizontal, 32)
            .contentMargins(.bottom, 32)
            .scrollTargetBehavior(.paging)
            .ignoresSafeArea()
        }
    }
}

#Preview {
    BriefView()
}
