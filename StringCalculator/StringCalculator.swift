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
        
        let result = getDelimiter(inputString: numberString)
        let characterSet = result.0 + "\n"
        let numberArray = result.1.components(separatedBy: CharacterSet(charactersIn: characterSet))
        var sum = 0
        for element in numberArray {
            if let value = Int(element) {
                sum +=  value
            } else {
                print("invalid input!")
                return 0
            }
        }
        
        return sum
    }
    
    private func getDelimiter(inputString: String) -> (String,String) {
        if inputString.hasPrefix("//") {
            if let index = inputString.firstIndex(of: "\n") {
                let prefix = inputString.prefix(upTo: index)
                let delimiter = String(prefix[prefix.index(prefix.startIndex, offsetBy: 2)])
                let startIndex = inputString.index(index, offsetBy: 1)
                let modifiedString = String(inputString[startIndex...])
                return (delimiter,modifiedString)
            }
        }
        return (",",inputString)
    }
}
