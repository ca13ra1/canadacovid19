//
//  Vaccine+Extension.swift
//  Covid
//
//  Created by cole cabral on 2021-11-02.
//

import Foundation

extension Vaccine {
    var value: Int {
        var integer = 0
        switch self {
        case .enumeration(_):
            break
        case .integer(let value):
            integer = value
        }
        return integer
    }
}
