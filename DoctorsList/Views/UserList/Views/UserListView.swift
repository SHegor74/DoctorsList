//
//  UserLIst.swift
//  DoctorsList
//
//  Created by Egor Naberezhnov on 10.05.2024.
//

import SwiftUI

struct UserListView: View {
    
    @ObservedObject var userViewModel: UserViewModel
    
    var filteredUsers: [User] {
        userViewModel.users.sorted { $0.lastName < $1.lastName }
    }
    
    init(userViewModel: UserViewModel) {
        self.userViewModel = userViewModel
        userViewModel.fetchUsers()
    }
    
    var body: some View {
        
        VStack(spacing: 1) {
            SearchView()
            SortPicker()
            
            List {
                ForEach(filteredUsers) { user in
                    NavigationLink {
                        UserDetailView(viewModel: UserDetailViewModel(user: user))
                    } label: {
                        UserCell(user: user)
                    }
                }
            }
            .listRowSpacing(10)
            .listRowSeparator(.hidden)
        }
    }
}
