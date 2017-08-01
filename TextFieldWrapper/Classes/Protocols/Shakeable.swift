//
//  Shakeable.swift
//  TextFieldWrapper
//
//  Created by Shuvo on 7/29/17.
//  Copyright © 2017 Shuvo. All rights reserved.
//

import UIKit

public protocol Shakeable {}


public extension Shakeable where Self:UIView {
    
    
    public func shake(borderColor color: UIColor = .clear, borderWidth width: CGFloat = 2, completion: @escaping (() -> ())) {
        
        CATransaction.begin()
        CATransaction.setCompletionBlock { [weak self] in
            self?.layer.borderColor = UIColor.clear.cgColor
            self?.layer.borderWidth = 0
            self?.layer.cornerRadius = 0
            self?.layer.isOpaque = false
            completion()
        }
        shake(borderColor: color, borderWidth: width)
        CATransaction.commit()
    }
    
    public func shake(borderColor color: UIColor = .clear, borderWidth width: CGFloat = 2) {
        
        let animation = CABasicAnimation(keyPath: "position")
        animation.duration      = 0.05
        animation.repeatCount   = 5
        animation.autoreverses  = true
        animation.fromValue     = NSValue(cgPoint: CGPoint(x: self.center.x - 5.0, y: self.center.y))
        animation.toValue       = NSValue(cgPoint: CGPoint(x: self.center.x + 5.0, y: self.center.y))
        
        layer.borderColor = color.cgColor
        layer.borderWidth = width
        layer.cornerRadius = 4.0
        //layer.shouldRasterize = true
        layer.isOpaque = true
        layer.add(animation, forKey: "position")
        
    }
    
}



