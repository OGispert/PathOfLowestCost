//
//  PathOfLowestCostTests.swift
//  PathOfLowestCostTests
//
//  Created by Othmar Gispert on 1/18/17.
//  Copyright © 2017 Othmar Gispert. All rights reserved.
//

import XCTest
@testable import PathOfLowestCost

var controller = ViewController()

class PathOfLowestCostTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testWithYesAnswer() {
        
        let arrayOne = [1,2,3,4,5]
        let arrayTwo = [5,4,3,2,1]
        let arrayThree = [6,7,8,9,10]
        let arrayFour = [10,9,8,7,6]
        
        _ = controller.getResults(myArray: arrayOne)
        _ = controller.getResults(myArray: arrayTwo)
        _ = controller.getResults(myArray: arrayThree)
        _ = controller.getResults(myArray: arrayFour)
        
        let sum = controller.arrayOfMins.reduce(0, +)
        let ind = controller.arrayOfIndex

        XCTAssertEqual(sum, 14)
        XCTAssertEqual(ind, [1,5,1,5])
        
    }
    
    func testWithNoAnswer() {
        
        let arrayOne = [11,12,13,14,15]
        let arrayTwo = [25,24,23,22,21]
        let arrayThree = [36,37,38,39,40]
        let arrayFour = [50,49,48,47,46]
        
        _ = controller.getResults(myArray: arrayOne)
        _ = controller.getResults(myArray: arrayTwo)
        _ = controller.getResults(myArray: arrayThree)
        _ = controller.getResults(myArray: arrayFour)
        
        let sum = controller.arrayOfMins.reduce(0, +)
        let ind = controller.arrayOfIndex
        
        XCTAssertEqual(sum, 114)
        XCTAssertEqual(ind, [1,5,1,5])
        
    }
    
}
