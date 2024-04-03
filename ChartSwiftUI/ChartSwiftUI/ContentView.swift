//
//  ContentView.swift
//  ChartSwiftUI
//
//  Created by Rahul on 02/04/24.
//

import SwiftUI
import Charts

struct ContentView: View {
    
    let thisYearFirst6Month: [MonthlySales] = [
        .init(date: .createDate(1, 1, 2024), sales: 6000),
        .init(date: .createDate(1, 2, 2024), sales: 8000),
        .init(date: .createDate(1, 3, 2024), sales: 9000),
        .init(date: .createDate(1, 4, 2024), sales: 10000),
        .init(date: .createDate(1, 5, 2024), sales: 11000),
        .init(date: .createDate(1, 6, 2024), sales: 12000)
    ]
    
    var body: some View {
        Chart(thisYearFirst6Month, id: \.id) { sale in
            RuleMark(y: .value("Average", average(thisYearFirst6Month)))
                .foregroundStyle(.white).lineStyle(StrokeStyle(lineWidth: 1, dash: [5])).annotation(alignment: .leading) {
                    Text("Average").font(.caption).foregroundStyle(.secondary)
                }
            
            BarMark(x: .value("Month", sale.month),
                    y: .value("Sales", sale.sales))
            .cornerRadius(5)
            .foregroundStyle(by: .value("Month", sale.month))
        }
        .chartPlotStyle(content: { plotContent in
            plotContent
                .background(.thinMaterial)
        })
        .frame(height: 300)
        .padding()
    }
    
    func average(_ sales: [MonthlySales]) -> Double {
        var average: Double = 0
        for sale in sales {
            average += sale.sales
        }
        
        return average / Double(sales.count)
    }
}

#Preview {
    ContentView()
}
