//
//  Summary.swift
//  Covid
//
//  Created by cole cabral on 2021-11-02.
//

import Foundation

struct Summary: Codable {
    let activeCases, activeCasesChange: Int
    let avaccine: Vaccine
    let cases: Int
    let cumulativeAvaccine: Vaccine
    let cumulativeCases: Int
    let cumulativeCvaccine: Vaccine
    let cumulativeDeaths: Int
    let cumulativeDvaccine: Vaccine
    let cumulativeRecovered, cumulativeTesting: Int
    let cvaccine: Vaccine
    let date: String
    let deaths: Int
    let dvaccine: Vaccine
    let province: String
    let recovered, testing: Int
    
    enum CodingKeys: String, CodingKey {
        case activeCases = "active_cases"
        case activeCasesChange = "active_cases_change"
        case avaccine, cases
        case cumulativeAvaccine = "cumulative_avaccine"
        case cumulativeCases = "cumulative_cases"
        case cumulativeCvaccine = "cumulative_cvaccine"
        case cumulativeDeaths = "cumulative_deaths"
        case cumulativeDvaccine = "cumulative_dvaccine"
        case cumulativeRecovered = "cumulative_recovered"
        case cumulativeTesting = "cumulative_testing"
        case cvaccine, date, deaths, dvaccine, province, recovered, testing
    }
}
