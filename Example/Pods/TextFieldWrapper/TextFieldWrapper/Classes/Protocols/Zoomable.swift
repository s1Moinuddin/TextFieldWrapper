//
//  Zoomable.swift
//  TextFieldWrapper
//
//  Created by Shuvo on 7/29/17.
//  Copyright © 2017 Shuvo. All rights reserved.
//

import UIKit

protocol Zoomable {}

extension Zoomable where Self:UIView {
    
    private func addPerspectiveTransformToParentSubviews() {
        let scale: CGFloat = 0.8
        var transform3D = CATransform3DIdentity
        transform3D.m34 = -1/500
        transform3D = CATransform3DScale(transform3D, scale, scale, 1)
        //let asdf = self.window?.rootViewController
        
        if let topController = window?.visibleViewController() {
            if let parentView = topController.view {
                parentView.subviews.forEach({ (mySubview) in
                    if (mySubview != self && !(mySubview is UIVisualEffectView) && !(mySubview is UITableView)) {
                        mySubview.setAnchorPoint(anchorPoint: CGPoint(x: 0.5, y: 0.5))
                        mySubview.layer.transform = transform3D
                    }
                })
            }
        }

    }
    
    private func removePerspectiveTransformFromParentSubviews() {
        
        if let topController = window?.visibleViewController() {
            if let parentView = topController.view {
                parentView.subviews.forEach({ (mySubview) in
                    if mySubview != self {
                        mySubview.layer.transform = CATransform3DIdentity
                    }
                })
            }
        }
    }
    
    func zoomIn(duration:TimeInterval, scale: CGFloat) {
        UIView.animate(withDuration: duration) { [weak self] in
            self?.backgroundColor = UIColor.white
            self?.layer.borderColor = UIColor.gray.cgColor
            self?.layer.borderWidth = 2.0
            self?.layer.cornerRadius = 4.0
            self?.layer.isOpaque = true
            self?.transform = CGAffineTransform(scaleX: scale, y: scale)
            self?.addPerspectiveTransformToParentSubviews()
        }
    }
    
    func zoomOut(duration:TimeInterval) {
        UIView.animate(withDuration: duration) { [weak self] in
            self?.layer.borderColor = UIColor.clear.cgColor
            self?.layer.borderWidth = 0
            self?.layer.cornerRadius = 0
            self?.layer.isOpaque = false
            self?.transform = .identity
            self?.removePerspectiveTransformFromParentSubviews()
        }
    }
}
