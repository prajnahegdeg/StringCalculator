//
//  String+Extension.swift
//  StringCalculator
//
//  Created by Hegde, Prajna on 03/06/22.
//

import Foundation


extension String {
    
    func numberOfOccurrencesOf(string: String) -> Int {
        return self.components(separatedBy:string).count - 1
    }
    
    func indicesOf(string: String) -> [Int] {
            var indices = [Int]()
            var searchStartIndex = self.startIndex

            while searchStartIndex < self.endIndex,
                let range = self.range(of: string, range: searchStartIndex..<self.endIndex),
                !range.isEmpty
            {
                let index = distance(from: self.startIndex, to: range.lowerBound)
                indices.append(index)
                searchStartIndex = range.upperBound
            }

            return indices
        }
    
    func getStringsBetweenString(startString:String, endString:String) -> [String]? {
        var delimiters:[String] = []
        let startIndices = self.indicesOf(string: startString)
        let endIndices = self.indicesOf(string: endString)
        if startIndices.count == endIndices.count {
            for i in 0..<startIndices.count {
                let startIndex = self.index(self.startIndex, offsetBy: startIndices[i])
                let endIndex = self.index(self.startIndex, offsetBy: endIndices[i])
                let delimiter = self[startIndex...endIndex].dropFirst().dropLast()
                delimiters.append(String(delimiter))
            }
            return delimiters
        }
        return nil

    }
    
    
}

