//
//  Vaccine.swift
//  Covid
//
//  Created by cole cabral on 2021-11-02.
//

import Foundation

enum Vaccine: Codable {
    case enumeration(String)
    case integer(Int)
    
    init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        if let x = try? container.decode(Int.self) {
            self = .integer(x)
            return
        }
        if let x = try? container.decode(String.self) {
            self = .enumeration(x)
            return
        }
        throw DecodingError.typeMismatch(Vaccine.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Wrong type for Vaccine"))
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        switch self {
        case .enumeration(let x):
            try container.encode(x)
        case .integer(let x):
            try container.encode(x)
        }
    }
}
