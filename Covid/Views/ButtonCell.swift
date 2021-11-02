//
//  ButtonCell.swift
//  Covid
//
//  Created by cole cabral on 2021-11-02.
//

import SwiftUI

struct ButtonCell: View {
    @Environment(\.openURL) var openURL
    var body: some View {
        Button {
            openURL(URL(string: "https://opencovid.ca/api/")!)
        } label: {
            Text("opencovid")
        }
        .foregroundColor(Color.white)
    }
}

struct ButtonCell_Previews: PreviewProvider {
    static var previews: some View {
        ButtonCell()
    }
}
