//
//  Helper.swift
//  ReferenceiOSUITests
//
//  Created by Martin de Haan on 09/10/2019.
//  Copyright © 2019 ABN AMRO. All rights reserved.
//

import Foundation
import XCTest

protocol Helper {
    static var app: XCUIApplication { get }
}

extension Helper {
    static var app: XCUIApplication {
        get {
            return XCUIApplication.shared
        }
    }
}
