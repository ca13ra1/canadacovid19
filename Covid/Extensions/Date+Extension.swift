//
//  Date+Extension.swift
//  Covid
//
//  Created by cole cabral on 2021-11-02.
//

import Foundation

extension String {
    var time: String {
        let formatter = DateFormatter()
        formatter.dateFormat = "EEEE, MMM d, yyyy"
        let date = formatter.date(from: self) ?? Date()
        return formatter.string(from: date)
    }
}
