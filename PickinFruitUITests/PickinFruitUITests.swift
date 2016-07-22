//
//  PickinFruitUITests.swift
//  PickinFruitUITests
//
//  Created by Joel Bell on 7/21/16.
//  Copyright © 2016 Flatiron School. All rights reserved.
//

import XCTest

class PickinFruitUITests: XCTestCase {
    let app = XCUIApplication()
    
    override func setUp() {
        super.setUp()
        continueAfterFailure = false
        app.launchArguments = ["ReplaceValue"]
        app.launch()
        
    }
    
    override func tearDown() {
        super.tearDown()
        app.terminate()
    }
    
}


