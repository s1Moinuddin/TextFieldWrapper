//
//  TestOneViewController.swift
//  UltimateTextFieldExample
//
//  Created by Shuvo on 7/28/17.
//  Copyright © 2017 Shuvo. All rights reserved.
//

import UIKit
import TextFieldWrapper

class SimpleViewController: UIViewController {
    
    //MARK:- Private Outlets
    @IBOutlet weak private var countLabel: UILabel!
    @IBOutlet weak private var customTxtFld: SMTextField!
    @IBOutlet weak private var phoneNumTxtFld: SMHoshiTextField!
    @IBOutlet weak private var phoneNumLabel: UILabel!
    @IBOutlet weak private var shakeBttn: UIButton!
    @IBOutlet weak private var nextBttn: UIButton!
    @IBOutlet weak private var dummyBttn: UIButton!
    
    //MARK:- Private Constant
    private let cornerRadius:CGFloat = 4
    private let borderWidth:CGFloat = 2
    private let borderColor:CGColor = UIColor.black.cgColor
    
    //MARK:- View Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupButtons()
        
        customTxtFld.characterChangedEvent = { [weak self] (str, num) in
            self?.countLabel.text = "NameFld No. of characters = \(num)/15"
        }
        
        customTxtFld.zoomScale = 1.4
        customTxtFld.addBlurToView = self.view
        customTxtFld.maxCharacter = 15
        customTxtFld.placeholderFont = UIFont.systemFont(ofSize: 13.0, weight: UIFontWeightLight)
        
        phoneNumTxtFld.zoomScale = 1.8
        phoneNumTxtFld.maxCharacter = 12
        phoneNumTxtFld.shouldTrim = false
        phoneNumTxtFld.addBlurToView = self.view
        phoneNumTxtFld.characterChangedEvent = { [weak self] (str, num) in
            self?.phoneNumLabel.text = "\(num) / 12"
            print("phoneNumTxtFld: \(str)--Num: \(num)")
        }
        
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    //MARK:- Private Methods
    private func setupButtons() {
        shakeBttn.layer.cornerRadius = cornerRadius
        shakeBttn.layer.borderWidth = borderWidth
        shakeBttn.layer.borderColor = borderColor
        
        nextBttn.layer.cornerRadius = cornerRadius
        nextBttn.layer.borderWidth = borderWidth
        nextBttn.layer.borderColor = borderColor
        
        dummyBttn.layer.cornerRadius = cornerRadius
        dummyBttn.layer.borderWidth = borderWidth
        dummyBttn.layer.borderColor = borderColor
    }
    
    
    //MARK:- Button Action
    @IBAction private func shakeBtnAction(_ sender: UIButton) {
        if sender.isSelected {
            
            phoneNumTxtFld.shake()
            
            customTxtFld.placeholderColor = .red
            customTxtFld.shake(completion: { [weak self] in
                self?.customTxtFld.placeholderColor = .blue
            })
        } else {
            
            
            phoneNumTxtFld.shake(borderColor: .red, borderWidth: 2.0)
            
            customTxtFld.placeholderColor = .green
            customTxtFld.shake(borderColor: .red, borderWidth: 4, completion: { 
                [weak self] in
                self?.customTxtFld.placeholderColor = .brown
            })
        }
        sender.isSelected = !sender.isSelected
        print("is Text withing limit = \(customTxtFld.isValid)")
    }
    
    @IBAction private func dummyAction(_ sender: UIButton) {
        self.view.endEditing(true)
        phoneNumLabel.text = phoneNumTxtFld.isValid ? phoneNumLabel.text : "Not Valid"
    }
    
    @IBAction private func goNextAction(_ sender: UIButton) {
        self.view.endEditing(true)
        
        let storyBoard = UIStoryboard(name: "Main", bundle: Bundle.main)
        let vc = storyBoard.instantiateViewController(withIdentifier: "ListViewController")
        navigationController?.pushViewController(vc, animated: true)
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
