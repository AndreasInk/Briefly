//
//  Graident+Ext.swift
//  Briefly
//
//  Created by Andreas Ink on 6/16/24.
//
import SwiftUI

@available(iOS 18.0, *)
extension GradientBackgroundView {
    
    static let purpleGradientColors: [Color] = [
        Color(red: 0.26275, green: 0.03922, blue: 0.36471), // deepPurple
        Color(red: 0.14118, green: 0.02745, blue: 0.31373), // darkPurple
        Color(red: 0.502, green: 0.02745, blue: 0.502), // lightDarkPurple
        Color(red: 0.294, green: 0.0, blue: 0.510), // veryDarkPurple
        Color(red: 0.11765, green: 0.01176, blue: 0.25882) // darkerPurple
    ]
    
    static let blueGradientColors: [Color] = [
        Color(red: 0.0, green: 0.0, blue: 0.5), // deepBlue
        Color(red: 0.0, green: 0.0, blue: 0.8), // darkBlue
        Color(red: 0.5, green: 0.5, blue: 1.0), // lightBlue
        Color(red: 0.0, green: 0.0, blue: 0.3), // veryDarkBlue
        Color(red: 0.0, green: 0.0, blue: 0.4) // darkerBlue
    ]
    
    static let greenGradientColors: [Color] = [
        Color(red: 0.0, green: 0.5, blue: 0.0), // deepGreen
        Color(red: 0.0, green: 0.8, blue: 0.0), // darkGreen
        Color(red: 0.5, green: 1.0, blue: 0.5), // lightGreen
        Color(red: 0.0, green: 0.3, blue: 0.0), // veryDarkGreen
        Color(red: 0.0, green: 0.4, blue: 0.0) // darkerGreen
    ]
    
    static let redGradientColors: [Color] = [
        Color(red: 0.5, green: 0.0, blue: 0.0), // deepRed
        Color(red: 0.8, green: 0.0, blue: 0.0), // darkRed
        Color(red: 1.0, green: 0.5, blue: 0.5), // lightRed
        Color(red: 0.3, green: 0.0, blue: 0.0), // veryDarkRed
        Color(red: 0.4, green: 0.0, blue: 0.0) // darkerRed
    ]
    
    static let yellowGradientColors: [Color] = [
        Color(red: 0.5, green: 0.5, blue: 0.0), // deepYellow
        Color(red: 0.8, green: 0.8, blue: 0.0), // darkYellow
        Color(red: 1.0, green: 1.0, blue: 0.5), // lightYellow
        Color(red: 0.3, green: 0.3, blue: 0.0), // veryDarkYellow
        Color(red: 0.4, green: 0.4, blue: 0.0) // darkerYellow
    ]
}
