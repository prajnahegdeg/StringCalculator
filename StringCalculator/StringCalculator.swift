//
//  StringCalculator.swift
//  StringCalculator
//
//  Created by Hegde, Prajna on 02/06/22.
//

import Foundation

class StringCalculator {
    
    var calledCount = 0
    var newLineDelimiter = "\n"
    
    func add(numberString: String) throws -> Int {
        calledCount += 1
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
        
        return try addString(numberString: numberString)
        
    }
    
    func getCalledCount() -> Int {
        return calledCount
    }
    
    //MARK: private methods
    
    private func addString(numberString: String) throws -> Int {
        
        let result = getDelimiter(inputString: numberString)
        let numberArray = getNumberArrayFromString(originalString: numberString,numberString: result.1, delimiters: result.0)
        var sum = 0
        var negativeArray: [Int] = []
        for element in numberArray {
            if var value = Int(element) {
                if(value < 0) {
                    negativeArray.append(value)
                    continue
                } else if(value > 1000) {
                    value = 0
                }
                sum += value
            } else {
                print("invalid input!")
                return 0
            }
        }
        if(negativeArray.isEmpty) {
            return sum
        } else {
            throw StringCalculationError.NegativeNumbersNotAllowed(negativeArray)
        }
    }
    
    private func getDelimiter(inputString: String) -> ([String],String) {
        if inputString.hasPrefix("//[") {
            if inputString.numberOfOccurrencesOf(string: "[") == 1 && inputString.numberOfOccurrencesOf(string: "]") == 1 {
                if let startIndex = inputString.firstIndex(of: "["), let endIndex = inputString.firstIndex(of: "]") {
                    let delimiter = String(inputString[startIndex...endIndex].dropFirst().dropLast())
                    if let modifiedString = getNumberStringFromInputString(inputString: inputString) {
                        return ([delimiter],modifiedString)
                    }
                }
            } else {
                if let delimiters = inputString.getStringsBetweenString(startString: "[", endString: "]"), let modifiedString = getNumberStringFromInputString(inputString: inputString) {
                    return (delimiters,modifiedString)
                }
            }
            
        } else if inputString.hasPrefix("//") {
            if let index = inputString.firstIndex(of: "\n") {
                let prefix = inputString.prefix(upTo: index)
                let delimiter = String(prefix[prefix.index(prefix.startIndex, offsetBy: 2)])
                if let modifiedString = getNumberStringFromInputString(inputString: inputString) {
                    return ([delimiter+newLineDelimiter],modifiedString)
                }
            }
        }
        return ([","+newLineDelimiter],inputString)
    }
    
    private func getNumberArrayFromString(originalString:String, numberString:String, delimiters: [String]) -> [String] {
        var numberArray: [String] = []
        if originalString.hasPrefix("//[") && originalString.numberOfOccurrencesOf(string: "[") == 1 && originalString.numberOfOccurrencesOf(string: "]") == 1 {
            numberArray = numberString.components(separatedBy: delimiters.first!)
        }
        else  if originalString.hasPrefix("//[") && originalString.numberOfOccurrencesOf(string: "[") > 1 && originalString.numberOfOccurrencesOf(string: "]") > 1 {
            numberArray = numberString.components(separatedBy: delimiters)
        }
        else {
            numberArray = numberString.components(separatedBy: CharacterSet(charactersIn: delimiters.first!))
        }
        return numberArray
    }
    
    private func getNumberStringFromInputString(inputString: String) -> String? {
        if let index = inputString.firstIndex(of: "\n") {
            let startIndex = inputString.index(index, offsetBy: 1)
            let modifiedString = String(inputString[startIndex...])
            return modifiedString
        }
        return nil
    }
}
