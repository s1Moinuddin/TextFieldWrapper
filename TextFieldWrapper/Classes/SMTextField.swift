//
//  SMTextField.swift
//  TextFieldWrapper
//
//  Created by Shuvo on 8/1/17.
//  Copyright © 2017 Shuvo. All rights reserved.
//

import UIKit

@IBDesignable
open class SMTextField: UITextField, ValidateableText, Shakeable, Zoomable {
    
    /// Limit the input character in textField.
    @IBInspectable public var maxCharacter: Int = 0
    
    /// Default value is .lightGray
    @IBInspectable public var placeholderColor: UIColor = .lightGray {
        didSet {
            self.attributedPlaceholder = getAttributedString(str: placeholder ?? "")
            didSetPlaceHolderColor()
        }
    }
    
    /// Default value is system Font of Size 14
    public var placeholderFont: UIFont = UIFont.systemFont(ofSize: 14.0) {
        didSet {
            self.attributedPlaceholder = getAttributedString(str: placeholder ?? "")
        }
    }
    
    /// Returns true if text lenght is within the limit of maximum character
    /// and vice versa.
    public var isValid: Bool {
        get {
            return validateCharacterLimit(maxCharacter, string: self.text)
        }
    }
    
    
    /// Trim the text if it cross the **maxCharacter** limit.
    /// Default value is true
    public var shouldTrim: Bool = true
    
    /// Default value 0.0, means Zoom In/Out animation is inactive.
    /// set **value > 1.0** to get **Zoom In** effect and
    /// set **value < 1.0** for **zoom Out** effect.
    /// **Negetive** value will cause textField to rotate 180 degree.
    /// This property will take effect when UITextFild did beging editing
    /// and then back to normal scale(identity) when UITextField did end editing.
    public var zoomScale: CGFloat = 0.0 {
        didSet {
            shouldZoom = zoomScale != 0
        }
    }
    
    /// set this value to ViewController's **view** when you set value for
    /// **zoomScale**. For better performance and to
    /// avoid blinking in animation with multiple textField[zoomScale is set]
    /// - Example: myTextField.addBlurToView = self.view
    /// - NB: will not have any effect if **zoomScale** is not set.
    public var addBlurToView: UIView?
    
    /// Default value 0.4  set value to **1** to get full blur effect
    public var blurAlpha: CGFloat = 0.4
    
    /// Duration for zoom In/Out animation. - Default value 0.3
    public var animationDuration: TimeInterval = 0.3
    
    
    //MARK:- Delegation Closure
    
    /// This closure notify the **implementing class**  whenver a change is made
    /// into the UITextField.
    /// - Example:
    ///     myTextField.characterChangedEvent = {(str, num) in
    ///         **//your implementation** }
    public var characterChangedEvent: ((String, Int) -> Void)?
    public var didEndEditing: ((Bool) -> Void)?
    public var didBeginEditing: ((Bool) -> Void)?
    
    //MARK:- Read Only Property
    private(set) var shouldZoom = false
    var previousBackgroundColor: UIColor?
    
    //MARK:- Initialization
    override public init(frame: CGRect) {
        super.init(frame: frame)
        commonSetup()
    }
    
    required public init?(coder decoder: NSCoder) {
        super.init(coder: decoder)
        commonSetup()
    }
    
    
    //MARK:- Private Methods
    private func commonSetup() {
        delegate = self
        self.addTarget(self, action: #selector(textFieldDidChange(_:)), for: .editingChanged)
    }
    
    private func getAttributedString(str:String) -> NSAttributedString {
        return NSAttributedString(string: str, attributes:
            [NSForegroundColorAttributeName: placeholderColor, NSFontAttributeName: placeholderFont])
    }
    
    @objc private func textFieldDidChange(_ textField: UITextField) {
        
        let textLength = textField.text?.length
        
        if let nLength = textLength, maxCharacter != 0, nLength > maxCharacter, shouldTrim {
            let newText = textField.text?.substring(to: maxCharacter)
            textField.text = newText
            textField.undoManager?.removeAllActions()
        }
        
        characterChangedEvent?(textField.text ?? "", textField.text?.length ?? 0)
    }
    
}

extension SMTextField {
    /**
     The type of animation a TextFieldEffect can perform.
     
     - TextEntry: animation that takes effect when the textfield has focus.
     - TextDisplay: animation that takes effect when the textfield loses focus.
     */
    public enum AnimationType: Int {
        case textEntry
        case textDisplay
    }
    
    /**
     Closure executed when an animation has been completed.
     */
    public typealias AnimationCompletionHandler = (_ type: AnimationType)->()
    
    
    /**
     Creates all the animations that are used to leave the textfield in the "entering text" state.
     */
    open func animateViewsForTextEntry() {
        // override in sub class if necessary
    }
    
    /**
     Creates all the animations that are used to leave the textfield in the "display input text" state.
     */
    open func animateViewsForTextDisplay() {
        // override in sub class if necessary
    }
    
    /**
     function executed when placeHolderColor is set.
     */
    open func didSetPlaceHolderColor() {
        // override in sub class if necessary
    }
    
}
