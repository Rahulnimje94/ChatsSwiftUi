//
//  LineChartView.swift
//  ChartSwiftUI
//
//  Created by Rahul on 03/04/24.
//

import SwiftUI
import Charts


struct LineChartView: View {
    
    private let lastYearFirst6Month: [MonthlySales] = [
        .init(date: .createDate(1, 1, 2023), sales: 2950),
        .init(date: .createDate(1, 2, 2023), sales: 4700),
        .init(date: .createDate(1, 3, 2023), sales: 2750),
        .init(date: .createDate(1, 4, 2023), sales: 1500),
        .init(date: .createDate(1, 5, 2023), sales: 5540),
        .init(date: .createDate(1, 6, 2023), sales: 7000),
    ]
    
    let thisYearFirst6Month: [MonthlySales] = [
        .init(date: .createDate(1, 1, 2024), sales: 6000),
        .init(date: .createDate(1, 2, 2024), sales: 8000),
        .init(date: .createDate(1, 3, 2024), sales: 9000),
        .init(date: .createDate(1, 4, 2024), sales: 5000),
        .init(date: .createDate(1, 5, 2024), sales: 11000),
        .init(date: .createDate(1, 6, 2024), sales: 10000)
    ]
    
    
    var body: some View {
        
        Chart(thisYearFirst6Month + lastYearFirst6Month, id: \.id) { sale in
            LineMark(x: .value("Month", sale.month),
                     y: .value("Sales", sale.sales)).foregroundStyle(by: .value("Year", sale.year))
            
            PointMark(x: .value("Month", sale.month),
                      y: .value("Sales", sale.sales)).foregroundStyle(by: .value("Year", sale.year))
            .annotation(position: .overlay, alignment: .bottom, spacing: 10) {
                Text("\(Int(sale.sales))").font(.caption)
            }
        }.frame(height: 300).padding()
    }
}

#Preview {
    LineChartView()
}
