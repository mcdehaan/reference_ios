//
//  Texts.swift
//  ReferenceiOSUITests
//
//  Created by Dunya Kirkali on 27/03/2019.
//  Copyright © 2019 ABN AMRO. All rights reserved.
//

import Foundation

struct TextItem: Equatable {
    let label: String
}

struct TextItems {
    
    static let baseText = TextItem(label: "Hello")
    static let emptyText = TextItem(label: "")
    
}

extension TextItems {
    static func getTextItem(named name: String) -> TextItem {
        switch name {
        case "baseText":
            return TextItems.baseText
        default:
            return TextItems.emptyText
        }
    }
}
