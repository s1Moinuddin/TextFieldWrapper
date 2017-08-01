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
    
    @IBOutlet weak var countLabel: UILabel!
    @IBOutlet weak var customTxtFld: SMTextField!
    @IBOutlet weak var phoneNumTxtFld: SMHoshiTextField!
    @IBOutlet weak var phoneNumLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
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
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }

    @IBAction func shakeBtnAction(_ sender: UIButton) {
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
    
    @IBAction func dummyAction(_ sender: UIButton) {
        self.view.endEditing(true)
        phoneNumLabel.text = phoneNumTxtFld.isValid ? phoneNumLabel.text : "Not Valid"
    }
    
    @IBAction func goNextAction(_ sender: UIButton) {
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
