//
//  CovidData.swift
//  Covid
//
//  Created by cole cabral on 2021-11-02.
//

import Foundation
import SwiftUI
import Combine
import SwiftUICharts

class CovidData: ObservableObject {
    private var cancellables = Set<AnyCancellable>()
    @Published var active: [DataPoint] = []
    @Published var recovered: [DataPoint] = []
    @Published var deaths: [DataPoint] = []
    @Published var vaccine: [DataPoint] = []
    @Published var date: String = ""
    
    func covidgraphdata() async {
        let request = URLRequest(url: URL(string: "https://api.opencovid.ca/summary")!)
        URLSession.shared.dataTaskPublisher(for: request)
            .map{ $0.data }
            .decode(type: Covid.self, decoder: JSONDecoder())
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { print ("Received completion: \($0).") },
                  receiveValue: { covid in
                self.date = covid.summary.first?.date ?? ""
                
                self.active.removeAll()
                self.active = covid.summary.enumerated().filter { data in
                    return !self.active.contains(where: {$0.endValue == Double(data.element.activeCases) })
                }
                .map {
                    return DataPoint(value: Double($0.element.activeCases), label: "", legend: Legend(color: $0.offset.color, label: "\($0.element.province) ", order: $0.offset))
                }
                
                self.recovered.removeAll()
                self.recovered = covid.summary.enumerated().filter { data in
                    return !self.recovered.contains(where: {$0.endValue == Double(data.element.recovered) })
                }
                .map {
                    return DataPoint(value: Double($0.element.recovered), label: "", legend: Legend(color: $0.offset.color, label: "\($0.element.province)", order: $0.offset))
                }
                
                self.deaths.removeAll()
                self.deaths = covid.summary.enumerated().filter { data in
                    return !self.deaths.contains(where: {$0.endValue == Double(data.element.deaths) })
                }
                .map {
                    return DataPoint(value: Double($0.element.deaths), label: "", legend: Legend(color: $0.offset.color, label: "\($0.element.province)", order: $0.offset))
                }
                
                self.vaccine.removeAll()
                self.vaccine = covid.summary.enumerated().filter { data in
                    return !self.vaccine.contains(where: {$0.endValue == Double(data.element.avaccine.value) })
                }
                .map {
                    return DataPoint(value: Double($0.element.avaccine.value), label: "", legend: Legend(color: $0.offset.color, label: "\($0.element.province)", order: $0.offset))
                }
            })
            .store(in: &cancellables)
    }
}
