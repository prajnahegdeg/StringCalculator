//
//  StringCalculator.swift
//  StringCalculator
//
//  Created by Hegde, Prajna on 02/06/22.
//

import Foundation

class StringCalculator {
    
    func add(numberString: String) -> Int {
        if(numberString.isEmpty) {
            return 0
        }
        if(numberString.count == 1) {
            let intValue = Int(numberString)
            if let value = intValue {
                return value
            }
        }
        return 0
    }
}
