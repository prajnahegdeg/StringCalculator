//
//  Constants.swift
//  StringCalculator
//
//  Created by Hegde, Prajna on 02/06/22.
//

import Foundation

enum StringCalculationError: Error {
    case NegativeNumbersNotAllowed(Int)
    
    var description: String {
             switch self {
                 case .NegativeNumbersNotAllowed(let value):
                     return "negatives not allowed - \(value)"
          }
    }
}
