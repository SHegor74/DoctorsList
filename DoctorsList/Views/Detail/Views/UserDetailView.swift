//
//  UserDetailView.swift
//  DoctorsList
//
//  Created by Egor Naberezhnov on 13.05.2024.
//

import SwiftUI

struct UserDetailView: View {
    
    @ObservedObject var viewModel: UserDetailViewModel
    
    var body: some View {
        VStack {
            VStack(alignment: .leading, spacing: 20) {
                HStack(alignment: .center, spacing: 10) {
                    AsyncImage(url: URL(string: viewModel.user.avatar ?? "")) { image in
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
                    
                    VStack(alignment: .leading) {
                        Text(viewModel.lastName)
                        Text(viewModel.firstNameAndPatronymic)
                    }
                    .font((.headline))
                    Spacer()
                }
                .offset(y: -80)
                .padding(.bottom, -80)
                .padding(.trailing)
                
                VStack(alignment: .leading, spacing: 10) {
                    HStack {
                        Image(systemName: "clock")
                        Text(viewModel.experience)
                    }
                    HStack {
                        Image(systemName: "cross.case")
                        Text(viewModel.scientificDegree)
                    }
                    HStack {
                        Image(systemName: "graduationcap")
                        Text(viewModel.universityName)
                    }
                    HStack {
                        Image(systemName: "location")
                        Text(viewModel.lastWorkPlace)
                    }
                }
                .font(.headline)
                .foregroundColor(.gray)
                .padding()
                
                RoundedRectangle(cornerRadius: 15)
                    .fill(Color.white)
                    .overlay(
                        HStack {
                            Text("Стоимость услуг")
                            Spacer()
                            Text(viewModel.hospitalPrice)
                        }
                            .padding()
                    )
                    .frame(height: 50)
                
                Text("Детальная информация об услугах")
                    .padding()
                
                Spacer()
            }
            .padding()
            
            HStack {
                Button {
                } label: {
                    Text("Записаться")
                        .frame(width: 250)
                }
                .foregroundColor(.white)
                .padding()
                .background(Color.pink)
                .cornerRadius(15)
            }
        }
        .padding()
        .background(Color.gray.opacity(0.1))
    }
}
