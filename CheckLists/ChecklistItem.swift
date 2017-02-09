//
//  ChecklistItem.swift
//  CheckLists
//
//  Created by iem on 02/02/2017.
//  Copyright © 2017 iem. All rights reserved.
//

import UIKit

class ChecklistItem {

    
    var text = String();
    var checked = Bool();
    
    
    
    init(){
        
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
  
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
