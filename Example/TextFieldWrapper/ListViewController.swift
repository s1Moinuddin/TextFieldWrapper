//
//  ListViewController.swift
//  UltimateTextFieldExample
//
//  Created by Shuvo on 8/1/17.
//  Copyright © 2017 Shuvo. All rights reserved.
//

import UIKit
import TextFieldWrapper

class CustomCell: UITableViewCell {
    
    @IBOutlet weak var nameTxtFld: SMTextField!
    @IBOutlet weak var simpleLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        self.backgroundColor        = UIColor.cyan
        //contentView.backgroundColor = UIColor.white
        nameTxtFld.characterChangedEvent = { [weak self] (str, num) in
            self?.simpleLabel.text = "Num of Char = \(num)"
        }
        
    }
    
    @IBAction func shakeAction(_ sender: UIButton) {
        if sender.isSelected {
            nameTxtFld.shake(borderColor: .clear, borderWidth: 0)
        }else {
            nameTxtFld.shake(borderColor: .purple, borderWidth: 2)
        }
        sender.isSelected = !sender.isSelected
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
}

class ListViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    
    let REUSE_IDENTIFIER = "CellIdentifer"

    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.tableFooterView = UIView()
        tableView.dataSource = self
        tableView.delegate = self
        tableView.estimatedRowHeight = 120
        tableView.rowHeight = UITableViewAutomaticDimension
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: REUSE_IDENTIFIER, for: indexPath) as! CustomCell
        
        cell.simpleLabel.text = "Num of Char = 0"
        cell.nameTxtFld.zoomScale = 1.2
        cell.nameTxtFld.addBlurToView = self.view
        cell.nameTxtFld.blurAlpha = 0.1
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: false)
        self.view.endEditing(true)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

}
