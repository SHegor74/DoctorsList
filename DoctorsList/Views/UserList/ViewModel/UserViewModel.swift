//
//  UserViewModel.swift
//  DoctorsList
//
//  Created by Egor Naberezhnov on 10.05.2024.
//

import Foundation

import SwiftUI

class UserViewModel: ObservableObject {
    
    @Published var users: [User] = []
    
    let userService: UserService
    
    init(userService: UserService) {
        self.userService = userService
    }
    
    public func fetchUsers() {
        userService.loadUsers { [weak self] result in
            switch result {
            case let .success(users):
                self?.users = users
            case let .failure(error):
                print(error)
            }
        }
    }
}
