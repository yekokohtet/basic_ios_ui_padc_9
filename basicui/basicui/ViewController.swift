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
    @IBOutlet weak var tfDateOfBirth: UITextField!
    
    private var datePicker: UIDatePicker?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        tfName.delegate = self
        
        datePicker = UIDatePicker()
        datePicker?.datePickerMode = .date
        datePicker?.addTarget(self, action: #selector(self.selectDate(datePicker:)), for: .valueChanged)
        
//        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(self.viewTapped(gesture:)))
//        view.addGestureRecognizer(tapGesture)
        
        let toolBar = UIToolbar().ToolbarPiker(mySelect: #selector(dismissPicker))
        
        tfDateOfBirth.inputAccessoryView = toolBar
        
        tfDateOfBirth.inputView = datePicker
    }
    
    @objc func dismissPicker() {
        view.endEditing(true)
    }
    
    @objc func viewTapped(gesture: UITapGestureRecognizer) {
        view.endEditing(true)
    }
    
    @objc func selectDate(datePicker: UIDatePicker) {
        let formatter = DateFormatter()
        formatter.dateFormat = "dd/MM/yyyy"
        tfDateOfBirth.text = formatter.string(from: datePicker.date)
        //        view.endEditing(true)
    }
    
    @IBAction func btnShowName(_ sender: Any) {
        lblShowName.text = tfName.text
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        tfName.resignFirstResponder()
        return true
    }
}

extension UIToolbar {
    
    func ToolbarPiker(mySelect : Selector) -> UIToolbar {
        
        let toolBar = UIToolbar()
        
        toolBar.barStyle = UIBarStyle.default
        toolBar.isTranslucent = true
        toolBar.tintColor = UIColor.black
        toolBar.sizeToFit()
        
        let doneButton = UIBarButtonItem(title: "Done", style: UIBarButtonItem.Style.plain, target: self, action: mySelect)
        let spaceButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.flexibleSpace, target: nil, action: nil)
        
        toolBar.setItems([ spaceButton, doneButton], animated: false)
        toolBar.isUserInteractionEnabled = true
        
        return toolBar
    }
    
}
