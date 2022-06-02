//
//  StringCalculatorTests.swift
//  StringCalculatorTests
//
//  Created by Hegde, Prajna on 02/06/22.
//

import XCTest
@testable import StringCalculator

class StringCalculatorTests: XCTestCase {

    var stringCalculator: StringCalculator!
    
    override func setUp() {
        super.setUp()
        stringCalculator = StringCalculator()
    }
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
    func testEmptyStringShouldReturnZero() {
        XCTAssertEqual(0, stringCalculator.add(numberString:""))
      }
    
    func testSingleNumberStringShouldReturnSameNumber() {
        let number = 2
        XCTAssertEqual(number, stringCalculator.add(numberString:String(number)))
    }
    
    func testInvalidSingleNumberStringShouldReturnZero() {
        XCTAssertEqual(0, stringCalculator.add(numberString:"."))
    }
    
    func testShouldReturnValidSum() {
        XCTAssertEqual(3, stringCalculator.add(numberString:"1,2"))
    }
}
