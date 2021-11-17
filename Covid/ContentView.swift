//
//  ContentView.swift
//  Covid
//
//  Created by cole cabral on 2021-11-02.
//

import SwiftUI
import SwiftUICharts

struct ContentView: View {
    @StateObject var data = CovidData()
    var body: some View {
        NavigationView {
            List {
                Section {
                    ChartViewCell(image: "exclamationmark.triangle.fill", title: "Active", color: .yellow, data: data.active)
                }
                Section {
                    ChartViewCell(image: "checkmark.circle.fill", title: "Recovered", color: .green, data: data.recovered)
                }
                Section {
                    ChartViewCell(image: "exclamationmark.triangle.fill", title: "Deaths", color: .red, data: data.deaths)
                }
                Section {
                    ChartViewCell(image: "cross.vial.fill", title: "Vaccinations", color: .green, data: data.vaccine)
                }
                Section(footer: Text("\(data.date.time)")) {
                    ButtonCell()
                        .listRowBackground(Color.blue)
                }
            }
            .navigationBarTitle("Canada", displayMode: .automatic)
            .refreshable {
                await data.covidgraphdata()
            }
        }
        .navigationViewStyle(.stack)
        .task {
            await data.covidgraphdata()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
