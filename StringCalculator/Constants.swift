//
//  Constants.swift
//  StringCalculator
//
//  Created by Hegde, Prajna on 02/06/22.
//

import Foundation

enum StringCalculationError: Error {
    case NegativeNumbersNotAllowed([Int])
    
    var description: String {
             switch self {
                 case .NegativeNumbersNotAllowed(let values):
                 return "negatives not allowed - \(values)"
          }
    }
    
    var erroneousCount: Int {
        switch self {
        case .NegativeNumbersNotAllowed(let values):
            return values.count
        }
    }
}
