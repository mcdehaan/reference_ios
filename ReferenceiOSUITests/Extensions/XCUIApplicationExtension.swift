//
//  XCUIApplicationExtension.swift
//  ReferenceiOSUITests
//
//  Created by Martin de Haan on 09/10/2019.
//  Copyright © 2019 ABN AMRO. All rights reserved.
//

import XCTest

extension XCUIApplication {
    
    // MARK: - Static properties -

    static var shared = XCUIApplication()
    
    // MARK: - Static functions -
    @discardableResult
    static func launch() -> XCUIApplication {
        self.shared.launch()
        return self.shared
    }
}
