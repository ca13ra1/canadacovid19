//
//  Int+Extension.swift
//  Covid
//
//  Created by cole cabral on 2021-11-02.
//

import Foundation
import SwiftUI

extension Int {
    var color: Color {
        switch self {
        case 0:
            return Color.green
        case 1:
            return Color.orange
        case 2:
            return Color.blue
        case 3:
            return Color.pink
        case 4:
            return Color.brown
        case 5:
            return Color.red
        case 6:
            return Color.purple
        case 7:
            return Color.mint
        case 8:
            return Color.indigo
        case 9:
            return Color.cyan
        case 10:
            return Color.teal
        case 11:
            return Color.gray
        case 12:
            return Color.yellow
        case 13:
            return Color.primary
        default:
            return Color.white
        }
    }
}
