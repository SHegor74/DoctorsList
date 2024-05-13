//
//  UserDetailViewModel.swift
//  DoctorsList
//
//  Created by Egor Naberezhnov on 13.05.2024.
//

import Foundation

import SwiftUI

class UserDetailViewModel: ObservableObject {
    @Published var user: User
    
    init(user: User) {
        self.user = user
    }
    
    var avatar: String {
        return "\(WorkExperienceCalculator.checkImage(user.avatar))"
    }
    
    var lastName: String {
        return "\(user.lastName)"
    }
    
    var firstNameAndPatronymic: String {
        return "\(user.firstName) \(user.patronymic)"
    }
    
    var experience: String {
        return WorkExperienceCalculator.calculateExperience(workExperiences: user.workExpirience)
    }
    
    var scientificDegree: String {
        return user.scientificDegreeLabel.rawValue
    }
    
    var universityName: String {
        return WorkExperienceCalculator.universityName(user: user)
    }
    
    var lastWorkPlace: String {
        return WorkExperienceCalculator.lastWorkPlace(user: user)
    }
    
    var hospitalPrice: String {
        return "от \(user.hospitalPrice) руб."
    }
}
