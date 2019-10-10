//
//  CurrencyHelper.swift
//  ReferenceiOS
//
//  Created by Dunya Kirkali on 27/03/2019.
//  Copyright © 2019 ABN AMRO. All rights reserved.
//

import UIKit

class CurrencyHelper {
    static let regularSize: CGFloat = 18
    static let superscriptSize: CGFloat = 13
    static let diff: CGFloat = 2
    static let decimalCount = 2

    static func format(amount: NSNumber) -> String? {
        let formatter = NumberFormatter()
        formatter.locale = Locale(identifier: "nl_NL")
        formatter.numberStyle = .currency
        return formatter.string(from: amount)
    }
    
    static func attributify(amount: String) -> NSMutableAttributedString {
        
        let font: UIFont? = UIFont(name: "Helvetica", size: regularSize)
        let fontSuper: UIFont? = UIFont(name: "Helvetica", size: superscriptSize)
        let attString: NSMutableAttributedString = NSMutableAttributedString(string: amount, attributes: [.font:font!])
        
        attString.setAttributes([.font:fontSuper!,.baselineOffset: (regularSize - superscriptSize) - diff], range: NSRange(location: (amount.count - decimalCount), length: decimalCount))
        
        return attString
    }
}
