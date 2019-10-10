//
//  ComponentHelper.swift
//  ReferenceiOSUITests
//
//  Created by Martin de Haan on 09/10/2019.
//  Copyright © 2019 ABN AMRO. All rights reserved.
//

import Foundation
import XCTest

final class ComponentHelper: Helper {
    let app = XCUIApplication.shared
    
    static func getBaseText() -> String {
        return TextItems.getTextItem(named: "baseText").label
    }
    
    static func getElement(containing text: String) -> XCUIElement {
        return app.staticTexts.element(matching: NSPredicate(format: "label CONTAINS[C] %@", text))
    }
    
    static func getTextField(named name: String) -> XCUIElement {
        return app.staticTexts[name]
    }
    
    static func getButton(named name: String) -> XCUIElement {
        return app.buttons[name]
    }
    
    static func tapButton(named name: String) {
        getButton(named: name).tapIfExists()
    }
    
    static func tapButton(named name: String, times number: Int) {
        getButton(named: name).tapIfExists(times: number)
    }
}
