//
//  SearchView.swift
//  DoctorsList
//
//  Created by Egor Naberezhnov on 13.05.2024.
//

import SwiftUI

struct SearchView: View {
    @State private var searchText = ""

    var body: some View {
        HStack {
            Image(systemName: "magnifyingglass")
                .foregroundColor(.gray)

            TextField("Поиск", text: $searchText)
        }
        .padding(10)

        .background(
            RoundedRectangle(cornerRadius: 15)
                .stroke(Color.gray.opacity(0.4), lineWidth: 1)
            )
        .padding()

    }
}
