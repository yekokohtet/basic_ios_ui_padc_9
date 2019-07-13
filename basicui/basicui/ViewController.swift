//
//  ViewController.swift
//  basicui
//
//  Created by Ye Ko Ko Htet on 13/07/2019.
//  Copyright © 2019 Ye Ko Ko Htet. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var tfName: UITextField!
    @IBOutlet weak var lblShowName: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        tfName.delegate = self
    }

    @IBAction func btnShowName(_ sender: Any) {
        lblShowName.text = tfName.text
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        tfName.resignFirstResponder()
        return true
    }
}

