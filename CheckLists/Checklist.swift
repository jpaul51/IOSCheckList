//
//  CheckList.swift
//  CheckLists
//
//  Created by iem on 02/03/2017.
//  Copyright © 2017 iem. All rights reserved.
//

import UIKit

class Checklist: NSObject, NSCoding {
    var name = ""
  
    var items = [ChecklistItem]()
    
    
    
    
    init(name:String)
    {
        self.name = name;
    }
    
    init(name:String, items:[ChecklistItem])
    {
        self.name=name
        self.items=items
    }
    
    
    required convenience init(coder decoder: NSCoder) {
        let name = decoder.decodeObject(forKey:  "Name");
        let items = decoder.decodeObject(forKey: "Items");
        self.init(name:name as! String,items:items as! [ChecklistItem])
    }
    
    func encode(with aCoder: NSCoder) {
        aCoder.encode(name, forKey: "Name")
        aCoder.encode(items, forKey: "Items")
       
    }
}
