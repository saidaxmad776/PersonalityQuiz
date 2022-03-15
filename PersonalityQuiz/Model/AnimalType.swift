//
//  AnimalType.swift
//  PersonalityQuiz
//
//  Created by Test on 14/03/22.
//

import Foundation

enum AnimalType: String {
    case dog = "🐶"
    case cat = "🐱"
    case rabbit = "🐰"
    case turtle = "🐢"
    
    var difinition: String {
        switch self {
        case .dog:
            return "Ti lyubish mnogo druzey"
        case .cat:
            return "Ti lyubish Odinochestva"
        case .rabbit:
            return "Ti ochen bistriy Chel"
        case .turtle:
            return "Ti ochen medlenniy slabiy chel"
        }
    }
}
