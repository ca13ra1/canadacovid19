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
            VStack {
                if data.loading {
                    ProgressView("Loading")
                } else {
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
                    .refreshable {
                        data.loading = false
                        await data.covidgraphdata()
                    }
                }
            }
            .navigationTitle("Canada")
            .navigationBarTitleDisplayMode(.automatic)
        }
        .navigationViewStyle(.stack)
        .task {
            await data.covidgraphdata()
        }
        .onReceive(NotificationCenter.default.publisher(for: UIApplication.significantTimeChangeNotification)) { _ in
            Task {
                data.loading = true
                await data.covidgraphdata()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
