//
//  ChartViewCell.swift
//  Covid
//
//  Created by cole cabral on 2021-11-02.
//

import SwiftUI
import SwiftUICharts

struct ChartViewCell: View {
    let image: String
    let title: String
    let color: Color
    let data: [DataPoint]
    var body: some View {
        HStack(spacing: 5) {
            Image(systemName: image)
                .foregroundColor(color)
                .font(Font.system(size: 18))
            Text(title)
        }
        BarChartView(dataPoints: data)
            .chartStyle(BarChartStyle(showAxis: true, showLabels: false, showLegends: true))
    }
}

struct ChartViewCell_Previews: PreviewProvider {
    static var previews: some View {
        ChartViewCell(image: "", title: "", color: .clear, data: [DataPoint]())
    }
}
