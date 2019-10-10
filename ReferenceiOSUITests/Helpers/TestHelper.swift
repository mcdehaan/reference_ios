//
//  ComponentHelper.swift
//  ReferenceiOSUITests
//
//  Created by Martin de Haan on 09/10/2019.
//  Copyright © 2019 ABN AMRO. All rights reserved.
//

import Foundation
import XCTest

final class TestHelper: Helper {
    let app = XCUIApplication.shared
    
    static func getBaseText() -> String {
        return TextItems.getTextItem(named: "baseText").label
    }
    
    static func testEqual(text compareText1: String, text compareText2: String) {
        XCTAssertEqual(compareText1,compareText2)
    }
    
    static func testNotEqual(text compareText1: String, text compareText2: String) {
        XCTAssertNotEqual(compareText1,compareText2)
    }
    
    static func testNotEqual(text compareInt1: Double, text compareInt2: Double) {
        XCTAssertNotEqual(compareInt1,compareInt2)
    }
}
