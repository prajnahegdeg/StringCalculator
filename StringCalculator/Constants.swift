//
//  Constants.swift
//  StringCalculator
//
//  Created by Hegde, Prajna on 02/06/22.
//

import Foundation

enum StringCalculationError: Error {
    case NegativeNumbersNotAllowed(String)
    
    var description: String {
             switch self {
                 case .NegativeNumbersNotAllowed(let message):
                     return message
          }
    }
}
