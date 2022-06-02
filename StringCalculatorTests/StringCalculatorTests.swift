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
        do {
            let sum = try stringCalculator.add(numberString:"")
            XCTAssertEqual(0, sum)
        } catch {
            XCTFail("StringCalculator.add() should not throw an exception")
        }
      }
    
    func testSingleNumberStringShouldReturnSameNumber() {
        let number = 2
        do {
            let sum = try stringCalculator.add(numberString:String(number))
            XCTAssertEqual(number, sum)
        } catch {
            XCTFail("StringCalculator.add() should not throw an exception")
        }
    }

    func testInvalidSingleNumberStringShouldReturnZero() {
        do {
            let sum = try stringCalculator.add(numberString:".")
            XCTAssertEqual(0, sum)
        } catch {
            XCTFail("StringCalculator.add() should not throw an exception")
        }
    }

    func testShouldReturnValidSum() {
        do {
            let sum = try  stringCalculator.add(numberString:"1,2")
            XCTAssertEqual(3, sum)
        } catch {
            XCTFail("StringCalculator.add() should not throw an exception")
        }
    }

    func testShouldReturnValidSumForMoreThanTwoNumbers() {
        do {
            let sum = try  stringCalculator.add(numberString:"1,2,3,4")
            XCTAssertEqual(10, sum)
        } catch {
            XCTFail("StringCalculator.add() should not throw an exception")
        }
    }

    func testShouldReturnValidSumForNewLineDelimiter() {
        do {
            let sum = try  stringCalculator.add(numberString:"1\n2")
            XCTAssertEqual(3, sum)
        } catch {
            XCTFail("StringCalculator.add() should not throw an exception")
        }
    }

    func testShouldReturnValidSumForMultipleDelimiter() {
        do {
            let sum = try  stringCalculator.add(numberString:"1\n2,3")
            XCTAssertEqual(6, sum)
        } catch {
            XCTFail("StringCalculator.add() should not throw an exception")
        }
    }

    func testShouldSupportDifferentDelimiters() {
        do {
            let sum = try  stringCalculator.add(numberString:"//;\n1;2")
            XCTAssertEqual(3, sum)
        } catch {
            XCTFail("StringCalculator.add() should not throw an exception")
        }
    }
    
    func testShouldReturnZeroInCaseOfUnknownnDelimeter() {
        do {
            let sum = try  stringCalculator.add(numberString:"//;\n1;2:3,6")
            XCTAssertEqual(0, sum)
        } catch {
            XCTFail("StringCalculator.add() should not throw an exception")
        }
    }
    
    func testShouldThrowExceptionWhenFoundNegativeNumber() {
        do {
            let _ = try  stringCalculator.add(numberString:"1,-2")
            XCTFail("StringCalculator.add() should throw StringCalculationError")
        } catch let error as StringCalculationError {
            print("User creation failed with error: \(error.description)")
        } catch {
            XCTFail("StringCalculator.add() should throw StringCalculationError")
        }
    }
}
