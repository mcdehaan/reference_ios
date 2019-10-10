//
//  XCUIElementExtension.swift
//  ReferenceiOSUITests
//
//  Created by Martin de Haan on 09/10/2019.
//  Copyright © 2019 ABN AMRO. All rights reserved.
//

import XCTest

// MARK: - Utility functions -

extension XCUIElement {
    
    func tapIfExists() {
        if exists {
            tap()
        }
    }
    
    func tapIfExists(times number: Int) {
        if exists {
            tap(withNumberOfTaps: number, numberOfTouches: number)
        }
    }
}
