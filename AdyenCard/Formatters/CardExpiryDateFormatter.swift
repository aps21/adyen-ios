//
// Copyright (c) 2019 Adyen B.V.
//
// This file is open source and available under the MIT license. See the LICENSE file for more info.
//

import Foundation

/// Formats a card's expiration date for display.
/// The input is expected to be sanitized as "MMYY", which will result in "MM / YY".
public final class CardExpiryDateFormatter: NumericFormatter {
    
    /// :nodoc:
    public override func formattedValue(for value: String) -> String {
        let separator = " / "
        
        let sanitizedString = sanitizedValue(for: value).truncate(to: maxLength)
        
        var formattedDate = sanitizedString
        var month = 0
        
        switch sanitizedString.count {
        case 0: break
        case 1:
            month = Int(sanitizedString)!
            if month > 1 {
                formattedDate = "0" + sanitizedString
            }
        case 2:
            month = Int(sanitizedString)!
            formattedDate = sanitizedString
        case 3:
            month = Int(sanitizedString[0...1])!
            formattedDate = sanitizedString[0...1] + separator + sanitizedString[2]
        case 4:
            month = Int(sanitizedString[0...1])!
            formattedDate = sanitizedString[0...1] + separator + sanitizedString[2...3]
        default:
            break
        }
        
        let isMonthValid = (month >= 1 && month <= 12) || sanitizedString.count < 2
        if !isMonthValid {
            formattedDate = ""
        }
        
        return formattedDate
    }
    
    // MARK: - Private
    
    private let maxLength = 4
}
