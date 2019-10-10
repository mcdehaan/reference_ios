//
//  ReferenceiOSUITests.swift
//  ReferenceiOSUITests
//
//  Created by Dunya Kirkali on 27/03/2019.
//  Copyright © 2019 ABN AMRO. All rights reserved.
//

import XCTest
@testable import ReferenceiOS
var app: XCUIApplication!

class ReferenceiOSUITests: XCTestCase {
       
    let app = XCUIApplication()

    override func setUp() {
        super.setUp()
        continueAfterFailure = true
        app.launch()
    }
    
    override func tearDown() {
        continueAfterFailure = false
        app.terminate()
    }
    
    func testLabelDefaultText() {
        // given the user is on the currency screen
        let currencyLabel = ComponentHelper.getTextField(named: "currencyLabel")
        
        //then the label should display text "Hello"
        TestHelper.testEqual(text: currencyLabel.label,text: ComponentHelper.getBaseText())
    }

    func testLabelTextChangeOnButtonPress() {
        // given the label displays "Hello"
        let currencyLabel = ComponentHelper.getTextField(named: "currencyLabel")
        TestHelper.testEqual(text: currencyLabel.label,text: ComponentHelper.getBaseText())
        
        //when the user taps the button
        ComponentHelper.tapButton(named:"currencyButton")
        
        //then the label no longer displays "Hello"
        TestHelper.testNotEqual(text: currencyLabel.label,text: ComponentHelper.getBaseText())
    }
    
    func testLabelTextChangeOnMultipleButtonPress() {
        // given the label already changed to a value
        let currencyLabel = ComponentHelper.getTextField(named: "currencyLabel")
        ComponentHelper.tapButton(named:"currencyButton")
        let previousNumber = currencyLabel.label
        
        //when the user taps the button more than once
        ComponentHelper.tapButton(named:"currencyButton", times: 3)
        
        //then the label shows a different number
        let newNumber = currencyLabel.label
        TestHelper.testNotEqual(text: newNumber,text: previousNumber)
    }
}
