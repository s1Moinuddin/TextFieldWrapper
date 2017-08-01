//
//  SMTextField+Delegate.swift
//  TextFieldWrapper
//
//  Created by Shuvo on 8/1/17.
//  Copyright © 2017 Shuvo. All rights reserved.
//

import UIKit

extension SMTextField: UITextFieldDelegate {
    
    //MARK:- UITextField Delegate
    public func textFieldDidBeginEditing(_ textField: UITextField) {
        previousBackgroundColor = textField.backgroundColor
        if shouldZoom {
            if let mainView = addBlurToView {
                addBlurEffectToView(mainView)
            }
            zoomIn(duration: animationDuration, scale: zoomScale)
        } else {
            animateViewsForTextEntry()
        }
        
        didBeginEditing?(true)
    }
    
    public func textFieldDidEndEditing(_ textField: UITextField) {
        textField.backgroundColor = previousBackgroundColor
        if shouldZoom {
            if let mainView = addBlurToView {
                removeBlurEffectFromView(mainView)
            }
            zoomOut(duration: animationDuration)
        } else {
            animateViewsForTextDisplay()
        }
        
        didEndEditing?(true)
    }
    
    //MARK:- Private Methods
    private func addBlurEffectToView(_ mainView: UIView) {
        let blurEffect = UIBlurEffect(style: .light)
        let blurEffectView = UIVisualEffectView(effect: blurEffect)
        blurEffectView.frame = mainView.bounds
        blurEffectView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        blurEffectView.alpha = blurAlpha
        
        mainView.addSubview(blurEffectView)
        
        if mainView.subviews.contains(self) {
            mainView.bringSubview(toFront: self)
        } else {
            mainView.bringSubview(toFront: self.superview!)
        }
    }
    
    private func removeBlurEffectFromView(_ mainView: UIView) {
        for view in mainView.subviews {
            if view is UIVisualEffectView {
                view.removeFromSuperview()
            }
        }
    }
}
