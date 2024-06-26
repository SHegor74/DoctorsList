//
//  UserCell.swift
//  DoctorsList
//
//  Created by Egor Naberezhnov on 09.05.2024.
//

import SwiftUI

struct UserCell: View {
    
    let user: User
    
    @State private var isFavorite = false
    @State private var rating = 3
    @State private var isDetailScreenActive = false
    
    var body: some View {
        
        VStack {
            HStack(alignment: .top) {
                VStack(alignment: .leading) {
                    AsyncImage(url: URL(string: user.avatar ?? "")) { image in
                        image
                            .resizable()
                            .frame(width: 129, height: 100)
                            .aspectRatio(contentMode: .fit)
                            .clipShape(Circle())
                    } placeholder: {
                        Image("no_photo")
                            .resizable()
                            .frame(width: 100, height: 100)
                            .aspectRatio(contentMode: .fit)
                            .clipShape(Circle())
                    }
                }
                .frame(width: 100)
                
                VStack(alignment: .leading) {
                    Text(user.lastName)
                        .font(.headline)
                    
                    Text("\(user.firstName) \(user.patronymic)")
                        .font(.headline)
                    
                    HStack {
                        ForEach(0 ..< 5) { index in
                            Image(systemName: index < Int(user.ratingsRating) ? "star.fill" : "star")
                                .foregroundColor(.yellow)
                        }
                    }
                    .padding(.top, 5)
                    
                    HStack {
                        Text("\(WorkExperienceCalculator.calculateSpecialization(specializations: user.specialization))\nCтаж: \(WorkExperienceCalculator.calculateExperience(workExperiences: user.workExpirience))")
                    }
                    .font(.subheadline)
                    .foregroundColor(.gray)
                    .padding(.top)
                    
                    Text("От \(user.hospitalPrice) руб.")
                        .font(.subheadline)
                    
                }
                .padding()
                .frame(width: 200, alignment: .leading)
                
                FavoriteButton(isFavorite: $isFavorite)
                    .frame(width: 10, height: 10)
                    .buttonStyle(PlainButtonStyle())
                
            }
            .padding()
            .presentationCornerRadius(15)
            
            NavigationLink(
                destination: UserDetailView(viewModel: UserDetailViewModel(user: user)),
                isActive: $isDetailScreenActive,
                label: {
                    EmptyView()
                })
            .hidden()
            
            Button {
                isDetailScreenActive = true
            } label: {
                Text("Записаться")
                    .frame(width: 250)
            }
            .foregroundColor(.white)
            .padding()
            .background(Color.pink)
            .cornerRadius(15)
            .buttonStyle(PlainButtonStyle())
        }
    }
}
