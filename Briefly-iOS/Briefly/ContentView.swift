//
//  ContentView.swift
//  Briefly
//
//  Created by Andreas Ink on 6/15/24.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    @Environment(\.modelContext) private var modelContext
    @Query private var items: [Item]

    var body: some View {
        ZStack {
            
            ScrollView {
                VStack {
                    GreetingView()
                        .containerRelativeFrame(.vertical)
                    BriefView()
                        .containerRelativeFrame(.vertical)
                        .scrollIndicators(.never)
                    SwiftChartView()
                }
                .scrollTargetLayout()
            }
            .scrollTargetBehavior(.viewAligned)
            .scrollIndicators(.never)
            .ignoresSafeArea()
        }
    }

    private func addItem() {
        withAnimation {
            let newItem = Item(timestamp: Date())
            modelContext.insert(newItem)
        }
    }

    private func deleteItems(offsets: IndexSet) {
        withAnimation {
            for index in offsets {
                modelContext.delete(items[index])
            }
        }
    }
}

#Preview {
    ContentView()
        .modelContainer(for: Item.self, inMemory: true)
}
