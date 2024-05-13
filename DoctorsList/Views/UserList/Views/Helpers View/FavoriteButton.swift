//
//  FavoriteButton.swift
//  DoctorsList
//
//  Created by Egor Naberezhnov on 13.05.2024.
//

import SwiftUI

struct FavoriteButton: View {
    
    @Binding var isFavorite: Bool
    
    var body: some View {
        Button {
            isFavorite.toggle()
        } label: {
            Label("Favorite toggle", systemImage: isFavorite ? "heart.fill" : "heart")
                .labelStyle(.iconOnly)
                .foregroundStyle(.pink)
                .frame(width: 10, height: 10)
        }
    }
}
