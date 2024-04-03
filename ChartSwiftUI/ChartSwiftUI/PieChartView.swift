//
//  PieChartView.swift
//  ChartSwiftUI
//
//  Created by Rahul on 02/04/24.
//

import SwiftUI
import Charts

struct PieChartView: View {
    
    let thisYearFirst6Month: [MonthlySales] = [
        .init(date: .createDate(1, 1, 2024), sales: 6000),
        .init(date: .createDate(1, 2, 2024), sales: 8000),
        .init(date: .createDate(1, 3, 2024), sales: 9000),
        .init(date: .createDate(1, 4, 2024), sales: 10000),
        .init(date: .createDate(1, 5, 2024), sales: 11000),
        .init(date: .createDate(1, 6, 2024), sales: 12000)
    ]
    
    var body: some View {
        Chart(thisYearFirst6Month.sorted(by: { $0.sales > $1.sales }), id: \.id) { sale in
            SectorMark(angle: .value("Sales", sale.sales), angularInset: 1)
                .cornerRadius(5)
                .foregroundStyle(by: .value("Month", sale.month))
        }
        .chartLegend(position: .bottom, alignment: .center, spacing: 25)
        .frame(height: 300)
        .padding()
    }
}

#Preview {
    PieChartView()
}
 
