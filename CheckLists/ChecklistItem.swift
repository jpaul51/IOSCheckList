//
//  ChecklistItem.swift
//  CheckLists
//
//  Created by iem on 02/02/2017.
//  Copyright © 2017 iem. All rights reserved.
//

import UIKit

class ChecklistItem : NSObject, NSCoding {

    
    var text = String();
    var checked = Bool();
    
    
    
    override init(){
        
    }
    
      init(text:String,_ checked:Bool=false) {
        //self.init(text: "", checked: false)
       
        //super.init()
        self.checked=checked;
        self.text=text;
    }
    

    func toogleChecked()
    {
        self.checked = !self.checked;
        
    }
  
    
    // MARK: NSCoding
    
    required convenience init?(coder decoder: NSCoder) {
        guard let text = decoder.decodeObject(forKey: "text") as? String,
            let checked = decoder.decodeBool(forKey: "checked") as?	 Bool
            else { return nil }
        
        self.init(
            text: text,
            checked
        )
    }
    
    func encode(with coder: NSCoder) {
        coder.encode(self.text, forKey: "text")
        coder.encode(self.checked, forKey: "checked")
    }
    
     static  func == (lhs: ChecklistItem, rhs: ChecklistItem) -> Bool {
      return (lhs.text == rhs.text)
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
