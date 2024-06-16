//
//  BrieflyWidgetsLiveActivity.swift
//  BrieflyWidgets
//
//  Created by Andreas Ink on 6/16/24.
//

import ActivityKit
import WidgetKit
import SwiftUI

struct BrieflyWidgetsAttributes: ActivityAttributes {
    public struct ContentState: Codable, Hashable {
        // Dynamic stateful properties about your activity go here!
        var emoji: String
    }

    // Fixed non-changing properties about your activity go here!
    var name: String
}

struct BrieflyWidgetsLiveActivity: Widget {
    var body: some WidgetConfiguration {
        ActivityConfiguration(for: BrieflyWidgetsAttributes.self) { context in
            // Lock screen/banner UI goes here
            VStack {
                Text("Hello \(context.state.emoji)")
            }
            .activityBackgroundTint(Color.cyan)
            .activitySystemActionForegroundColor(Color.black)

        } dynamicIsland: { context in
            DynamicIsland {
                // Expanded UI goes here.  Compose the expanded UI through
                // various regions, like leading/trailing/center/bottom
                DynamicIslandExpandedRegion(.leading) {
                    Text("Leading")
                }
                DynamicIslandExpandedRegion(.trailing) {
                    Text("Trailing")
                }
                DynamicIslandExpandedRegion(.bottom) {
                    Text("Bottom \(context.state.emoji)")
                    // more content
                }
            } compactLeading: {
                Text("L")
            } compactTrailing: {
                Text("T \(context.state.emoji)")
            } minimal: {
                Text(context.state.emoji)
            }
            .widgetURL(URL(string: "http://www.apple.com"))
            .keylineTint(Color.red)
        }
    }
}

extension BrieflyWidgetsAttributes {
    fileprivate static var preview: BrieflyWidgetsAttributes {
        BrieflyWidgetsAttributes(name: "World")
    }
}

extension BrieflyWidgetsAttributes.ContentState {
    fileprivate static var smiley: BrieflyWidgetsAttributes.ContentState {
        BrieflyWidgetsAttributes.ContentState(emoji: "😀")
     }
     
     fileprivate static var starEyes: BrieflyWidgetsAttributes.ContentState {
         BrieflyWidgetsAttributes.ContentState(emoji: "🤩")
     }
}

#Preview("Notification", as: .content, using: BrieflyWidgetsAttributes.preview) {
   BrieflyWidgetsLiveActivity()
} contentStates: {
    BrieflyWidgetsAttributes.ContentState.smiley
    BrieflyWidgetsAttributes.ContentState.starEyes
}
