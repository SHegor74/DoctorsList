//
//  WorkExperienceCalculator.swift
//  DoctorsList
//
//  Created by Egor Naberezhnov on 10.05.2024.
//
import Foundation

struct WorkExperienceCalculator {
    static func calculateExperience(workExperiences: [WorkExpirience]) -> String {
        guard !workExperiences.isEmpty else {
            return "Нет опыта"
        }
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd" // Формат даты
        
        if let firstExperience = workExperiences.first {
            if let endDate = firstExperience.endDate {
                
                let startDate = Date(timeIntervalSince1970: TimeInterval(firstExperience.startDate))
                let endDate = Date(timeIntervalSince1970: TimeInterval(endDate))
                let calendar = Calendar.current
                let components = calendar.dateComponents([.year], from: startDate, to: endDate)
                return "\(components.year ?? 0) лет"
            } else if firstExperience.untilNow {
                let startDate = Date(timeIntervalSince1970: TimeInterval(firstExperience.startDate))
                let currentDate = Date()
                let calendar = Calendar.current
                let components = calendar.dateComponents([.year], from: startDate, to: currentDate)
                return "\(components.year ?? 0) лет"
            } else {
                return "Не работает"
            }
        } else {
            return "Нет опыта"
        }
    }
    
    static func calculateSpecialization(specializations: [Specialization]) -> String {
        guard !specializations.isEmpty else {
            return "Не указано"
        }
        
        return specializations.map { $0.name }.joined(separator: ", ")
    }
    
    static func universityName(user: User) -> String {
            guard let higherEducation = user.higherEducation.first else {
                return "Не указано"
            }
            return higherEducation.university
        }
    
    static func lastWorkPlace(user: User) -> String {
            guard let lastWorkExperience = user.workExpirience.last else {
                return "Не указано"
            }
            return lastWorkExperience.organization
        }
    
    static func checkImage(_ avatar: String?) -> String {
           if let avatar = avatar {
               return avatar
           } else {
               return "no_photo"
           }
       }
}
