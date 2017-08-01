//
//  ValidateableText.swift
//  TextFieldWrapper
//
//  Created by Shuvo on 7/28/17.
//  Copyright © 2017 Shuvo. All rights reserved.
//

import Foundation


public protocol ValidateableText: class {}

public extension ValidateableText {
    
    /***
     *** Returns false if String characters cross the limit
     *** Otherwise returns true
     */
    public func validateCharacterLimit(_ limit: Int, string: String?) -> Bool {
        guard let text = string, limit != 0 else {return true}
        if text.characters.count <= limit {
            return true
        } else {
            return false
        }
    }
}
