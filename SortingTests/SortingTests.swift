//
//  SortingTests.swift
//  SortingTests
//
//  Created by YANGSHENG ZOU on 2016-05-29.
//  Copyright © 2016 YANGSHENG ZOU. All rights reserved.
//

import XCTest

class SortingTests: XCTestCase {
    
    let viewController = ViewController()
    
    override func setUp() {
        super.setUp()
        
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testSort(array:[Int]){
        viewController.array = array
        viewController.mergeSort(0, right: viewController.array!.count-1)
        XCTAssertEqual(viewController.array!, array.sort())
        
        viewController.array = array
        viewController.quickSort(0, right: viewController.array!.count-1)
        XCTAssertEqual(viewController.array!, array.sort())
        
        viewController.array = array
        viewController.heapSort()
        XCTAssertEqual(viewController.array!, array.sort())
    }
    
    func testExample(){
        testSort([12,34,56,12,11,43,56,78,33])
        testSort([12,34,16,12,15,43,52,78,23])
        testSort([11,31,16,10,14,43,56,76,25])
        testSort([22,14,16,19,15,43,24,78,24])
        testSort([62,34,16,12,35,43,52,48,23])
        testSort([12,17,16,12,15,43,52,28,63])
        testSort([52,34,36,52,15,43,22,78,23])
    }
    
    
    
}
