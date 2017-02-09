//
//  AddItemTableViewController.swift
//  CheckLists
//
//  Created by iem on 02/02/2017.
//  Copyright © 2017 iem. All rights reserved.
//
//J'en suis à la 29...

import UIKit
protocol AddItemViewControllerDelegate : class {
    func addItemViewControllerDidCancel(controller: AddItemTableViewController)
    func addItemViewController(controller: AddItemTableViewController, didFinishAddingItem item: ChecklistItem)
    
}
class AddItemTableViewController: UITableViewController {
var deleguate : AddItemViewControllerDelegate?;
    override func viewDidLoad() {
        super.viewDidLoad()
        
      
    }
    
 
    
    
    
    @IBOutlet weak var btnDone: UIBarButtonItem!
    
    @IBOutlet weak var txtData: UITextField!
    
    @IBAction func cancel(_ sender: AnyObject) {
        //self.dismiss(animated: true, completion: nil)
       self.dismiss(animated: true, completion: nil)
    }
  
    @IBAction func done(_ sender: AnyObject) {
        print(txtData.text);
        //self.dismiss(animated: true, completion: nil)
        
        deleguate?.addItemViewController(controller: self, didFinishAddingItem: ChecklistItem(text: txtData.text!))
        
        
    }
     func textField(textField: UITextField, shouldChangeCharactersInRange range: NSRange,
                   replacementString string: String) -> Bool {
        
        let beforeText: NSString = (textField.text as NSString?)!
        let afterText: NSString = beforeText.replacingCharacters(in: range, with: string) as NSString
        
        if afterText.length > 0 {
            btnDone.isEnabled = true
        } else {
            btnDone.isEnabled = false
        }
        
        return true
    }
    
    override func viewWillAppear(_ animated: Bool) {
        txtData.becomeFirstResponder()
    }
    
   
    
}

