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
            else {
                print("invalid input!")
                return 0
            }
        }
        
        let numberArray = numberString.components(separatedBy: ",")
        var sum = 0
        for element in numberArray {
            sum += Int(element) ?? 0
        }
        
        return sum
    }
}
