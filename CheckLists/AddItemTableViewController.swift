//
//  AddItemTableViewController.swift
//  CheckLists
//
//  Created by iem on 02/02/2017.
//  Copyright © 2017 iem. All rights reserved.
//
//J'en suis à la 53... IL FAUT FAIRE LES LIENDS DANS LE STORYBOARD


import UIKit
protocol ItemDetailViewControllerDelegate : class {
    func addItemViewControllerDidCancel(controller: ItemDetailViewController)
    func addItemViewController(controller: ItemDetailViewController, didFinishAddingItem item: ChecklistItem)
    func addItemViewController(controller: ItemDetailViewController, didFinishEditingItem item: ChecklistItem)
}


class ItemDetailViewController: UITableViewController {
    var delegate : ItemDetailViewControllerDelegate?;
    var itemToEdit: ChecklistItem?
    var isEditingItem: Bool?;
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        if itemToEdit == nil
        {
            isEditingItem=false;
        }
        else
        {
            isEditingItem=true;
        }
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
        
        if isEditingItem! == false {
            
        delegate?.addItemViewController(controller: self, didFinishAddingItem: ChecklistItem(text: txtData.text!))
        }
        else
        {
            itemToEdit?.text = txtData.text!
            delegate?.addItemViewController(controller: self, didFinishEditingItem: itemToEdit!)
        }
        
        
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

