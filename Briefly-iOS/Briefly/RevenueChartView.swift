//
//  RevenueChartView.swift
//  Briefly
//
//  Created by Andreas Ink on 6/16/24.
//

import SwiftUI
import Charts

struct SwiftChartView: View {
    @State private var selectedData: ChartData?

    let data: [ChartData] = [
        ChartData(date: DateComponents(calendar: .current, year: 2024, month: 1).date!, value: 500),
        ChartData(date: DateComponents(calendar: .current, year: 2024, month: 2).date!, value: 800),
        ChartData(date: DateComponents(calendar: .current, year: 2024, month: 3).date!, value: 300),
        ChartData(date: DateComponents(calendar: .current, year: 2024, month: 4).date!, value: 700),
        ChartData(date: DateComponents(calendar: .current, year: 2024, month: 5).date!, value: 900),
        ChartData(date: DateComponents(calendar: .current, year: 2024, month: 6).date!, value: 600),
        ChartData(date: DateComponents(calendar: .current, year: 2024, month: 7).date!, value: 400)
    ]
    var body: some View {
        VStack {
            Chart {
                ForEach(data) { item in
                    BarMark(
                        x: .value("Month", item.date, unit: .month),
                        y: .value("Revenue", item.value)
                    )
                    .foregroundStyle(LinearGradient(colors: [.accentColor, .accentColor.opacity(0.1)], startPoint: .top, endPoint: .bottom))
                    .cornerRadius(26)
                    
                }
            }
            .chartXSelection(value: $selectedData)
            .chartXAxis {
                AxisMarks(values: .stride(by: .month)) { value in
                    AxisGridLine()
                    AxisTick()
                    AxisValueLabel(format: .dateTime.month(.abbreviated))
                }
            }
            .chartYAxis {
                AxisMarks(position: .leading)
            }
            .frame(height: 300)
            .padding()
            .background(Color(UIColor.systemBackground))
            
            if let selectedData = selectedData {
                HStack {
                    Text("Date: \(selectedData.date, formatter: dateFormatter)")
                    Text("Value: \(selectedData.value)")
                }
                .padding()
                .background(Color.blue.opacity(0.8))
                .cornerRadius(8)
                .foregroundColor(.white)
                .padding(.top, 10)
            }
        }
    }
    
    private var dateFormatter: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateFormat = "MMM yyyy"
        return formatter
    }
}

struct ChartData: Identifiable, Plottable {
    init?(primitivePlottable: Date) {
        self.date = primitivePlottable
        self.value = 0
    }
    
    init(date: Date, value: Double) {
        self.date = date
        self.value = value
    }
    
    typealias PrimitivePlottable = Date

    let id = UUID()
    let date: Date
    let value: Double

    var primitivePlottable: Date {
        date
    }
}

#Preview {
    SwiftChartView()
}
