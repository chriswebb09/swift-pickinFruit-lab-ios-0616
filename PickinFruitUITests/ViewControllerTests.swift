//
//  ViewControllerTests.swift
//  PickinFruit
//
//  Created by Joel Bell on 7/21/16.
//  Copyright © 2016 Flatiron School. All rights reserved.
//

import XCTest

class ViewControllerTests: PickinFruitUITests {
    
    func testPickerLosingScenario() {
        
        let fruitOne = NSPredicate(format: "label BEGINSWITH '\(Constants.FRUIT_ONE)'")
        let fruitOnePicker = app.pickerWheels.elementMatchingPredicate(fruitOne)
        
        let fruitTwo = NSPredicate(format: "label BEGINSWITH '\(Constants.FRUIT_TWO)'")
        let fruitTwoPicker = app.pickerWheels.elementMatchingPredicate(fruitTwo)
        
        let fruitThree = NSPredicate(format: "label BEGINSWITH '\(Constants.FRUIT_THREE)'")
        let fruitThreePicker = app.pickerWheels.elementMatchingPredicate(fruitThree)
        
        var fruitOneString: String
        var fruitTwoString: String
        var fruitThreeString: String
        
        repeat {
            
            app.buttons[Constants.SPIN_BUTTON].tap()
            
            fruitOneString = String(fruitOnePicker.value)
            fruitTwoString = String(fruitTwoPicker.value)
            fruitThreeString = String(fruitThreePicker.value)
        
        } while fruitOneString == fruitTwoString && fruitTwoString == fruitThreeString
        
        let predicate = NSPredicate(format: "label == 'TRY AGAIN'")
        let label = app.staticTexts.elementMatchingPredicate(predicate)
        
        XCTAssert(label.exists)
        
    }
    
    func testPickerWinningScenario() {
        
        let fruitOne = NSPredicate(format: "label BEGINSWITH '\(Constants.FRUIT_ONE)'")
        let fruitOnePicker = app.pickerWheels.elementMatchingPredicate(fruitOne)
        
        let fruitTwo = NSPredicate(format: "label BEGINSWITH '\(Constants.FRUIT_TWO)'")
        let fruitTwoPicker = app.pickerWheels.elementMatchingPredicate(fruitTwo)
        
        let fruitThree = NSPredicate(format: "label BEGINSWITH '\(Constants.FRUIT_THREE)'")
        let fruitThreePicker = app.pickerWheels.elementMatchingPredicate(fruitThree)
        
        var fruitOneString: String
        var fruitTwoString: String
        var fruitThreeString: String
        
        repeat {
            
            app.buttons[Constants.SPIN_BUTTON].tap()
            
            fruitOneString = String(fruitOnePicker.value)
            fruitTwoString = String(fruitTwoPicker.value)
            fruitThreeString = String(fruitThreePicker.value)
            
        } while fruitOneString != fruitTwoString || fruitTwoString != fruitThreeString || fruitOneString != fruitThreeString
        
        let predicate = NSPredicate(format: "label == 'WINNER!'")
        let label = app.staticTexts.elementMatchingPredicate(predicate)
        
        XCTAssert(label.exists)
        
    }

}
