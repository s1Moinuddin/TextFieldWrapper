//
//  String+UltimateText.swift
//  TextFieldWrapper
//
//  Created by Shuvo on 7/28/17.
//  Copyright © 2017 Shuvo. All rights reserved.
//

import Foundation

extension String {
    
    //------------------------------------------------------
    // MARK: Common Utils
    //------------------------------------------------------
    
    public var length: Int {
        return characters.count
    }
    
    public func trim()->String {
        return self.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
    }
    
    public var fullRange: Range<String.Index> {
        return startIndex..<endIndex
    }
    
    public func index(from: Int) -> Index {
        return self.index(startIndex, offsetBy: from)
    }
    
    public func substring(from: Int) -> String {
        let fromIndex = index(from: from)
        return substring(from: fromIndex)
    }
    
    /**
     Returns subtring to x length starting from 1
     - Parameter to: length to n (Starting from 1)
     */
    public func substring(to: Int) -> String {
        let toIndex = index(from: to)
        return substring(to: toIndex)
    }
    
    public func substring(with r: Range<Int>) -> String {
        let startIndex = index(from: r.lowerBound)
        let endIndex = index(from: r.upperBound)
        return substring(with: startIndex..<endIndex)
    }
    
    /**
     true if self contains characters.
     */
    public var isNotEmpty: Bool {
        return !isEmpty
    }
}
