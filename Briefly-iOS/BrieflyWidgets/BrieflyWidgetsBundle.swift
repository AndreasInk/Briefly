//
//  BrieflyWidgetsBundle.swift
//  BrieflyWidgets
//
//  Created by Andreas Ink on 6/16/24.
//

import WidgetKit
import SwiftUI

@main
struct BrieflyWidgetsBundle: WidgetBundle {
    var body: some Widget {
        BrieflyWidgets()
        BrieflyWidgetsControl()
        BrieflyWidgetsLiveActivity()
    }
}
