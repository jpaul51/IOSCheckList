//
//  ViewController.swift
//  CheckLists
//
//  Created by iem on 02/02/2017.
//  Copyright © 2017 iem. All rights reserved.
//

import UIKit

protocol ChecklistViewControllerDelegate: class {
    func listDetailViewControllerDidCancel(controller: ChecklistViewController)
    
    func listDetailViewController(controller: ChecklistViewController, didFinishAddingChecklist checklist: Checklist)
    
    func listDetailViewController(controller: ChecklistViewController, didFinishEditingChecklist checklist: Checklist)
}

class ChecklistViewController: UITableViewController {

    var checklistItems=[ChecklistItem]()
    var list : Checklist!
    var currentRowIndex=0;
    var delegate :ChecklistViewControllerDelegate?
    
    @IBOutlet weak var navBar: UINavigationItem!
    
        override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
            
            navBar.title = list.name
            checklistItems=[ChecklistItem]();
            print("LOAD");
            loadChecklists();
            if(checklistItems.count>0){
                print("content: " + checklistItems[0].text);
            }
            else
            {
                print("EMPTY");
            }
            
        /*for index in 0...4 {
            if(index%2==0)
            {
                checklistItems.append( ChecklistItem(text: "hello"+String(index)));

            }
            else {
                checklistItems.append(ChecklistItem(text: "hello"+String(index),true));
                
            }
            currentRowIndex+=1;

        } */
       
    }
  
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "AddItem" || segue.identifier == "EditItem",
         let navigationController = segue.destination as? UINavigationController,
         let addItemViewController = navigationController.topViewController as? ItemDetailViewController
        {
             addItemViewController.delegate = self
            
            if segue.identifier == "EditItem"
            {
                addItemViewController.itemToEdit = checklistItems[(tableView.indexPath(for: sender as! UITableViewCell)?.row)!]
            }
            saveChecklistItems()
        }
        
      
        
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        tableView.beginUpdates()
        tableView.deleteRows(at: [indexPath], with: UITableViewRowAnimation.top)
        checklistItems.remove(at: indexPath.row)
        currentRowIndex-=1;
        tableView.endUpdates()
    }
    

    
    @IBAction
    func addDummyTodo(){
        
        checklistItems[currentRowIndex] = ChecklistItem(text:"dummy");
        tableView.reloadRows(at:[IndexPath(row:currentRowIndex,section:0)], with: UITableViewRowAnimation.fade)
        currentRowIndex+=1;
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return checklistItems.count;
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        let cell = tableView.dequeueReusableCell(withIdentifier: "ChecklistItem", for: indexPath) as UITableViewCell
        //cell.viewWithTag(0)
        cell.viewWithTag(1)
        
        configureCheckmarkFor(cell:cell,withItem:checklistItems[indexPath.row]);
        configureTextFor(cell:cell,withItem:checklistItems[indexPath.row]);
       
        return cell;
    }
    func configureCheckmarkFor(cell: UITableViewCell, withItem item: ChecklistItem)
    {
        if(item.checked)
        {
            //cell.accessoryType = .checkmark;
            if let theLabel = self.view.viewWithTag(21) as? UILabel {
                theLabel.isHidden = false;
            }
        }
        else{
            //cell.accessoryType = .none;
            if let theLabel = self.view.viewWithTag(21) as? UILabel {
                theLabel.isHidden = true;
            }
        }
    }
    func configureTextFor(cell: UITableViewCell, withItem item: ChecklistItem)
    {
        if let theLabel = self.view.viewWithTag(20) as? UILabel {
            theLabel.text = item.text
        }
        //cell.textLabel?.text = item.text;
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        checklistItems[indexPath.row].toogleChecked()
        tableView.reloadRows(at:[indexPath], with: UITableViewRowAnimation.top)
        
       
        saveChecklistItems()
    }
    
  
    
    func documentsDirectory() -> String {
        let paths = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true) as! [String]
        return paths[0]
    }
    
    func dataFilePath() -> String {
        return documentsDirectory().appending("Checklists.plist")
    }
    
    func saveChecklistItems() {
        let data = NSMutableData()
        let archiver = NSKeyedArchiver(forWritingWith: data)
        archiver.encode(checklistItems, forKey: "Checklists")
        archiver.finishEncoding()
        print("PATH: ")
        print(dataFilePath())
        data.write(toFile: dataFilePath(), atomically: true)
    }
    
    func loadChecklists() {
        let path = dataFilePath()
        if FileManager.default.fileExists(atPath: path) {
            if let data = NSData(contentsOfFile: path) {
                let unarchiver = NSKeyedUnarchiver(forReadingWith: data as Data)
                checklistItems = unarchiver.decodeObject(forKey: "Checklists") as! [ChecklistItem]
                unarchiver.finishDecoding()
               // sortChecklists()
            }
        }
    }
}





extension ChecklistViewController: ItemDetailViewControllerDelegate
{
    func addItemViewControllerDidCancel(controller: ItemDetailViewController)
    {
        print("CANCEL");
    }
    func addItemViewController(controller: ItemDetailViewController, didFinishAddingItem item: ChecklistItem)
    {
        print("----------------------We are here----------------------");
        
       
        
        //tableView.beginUpdates()
        
        //let indexPaths = (0..<checklistItems.count).map { IndexPath(row: $0, section: 0) }
        self.checklistItems.append(item)
        tableView.insertRows(at: [IndexPath(row:currentRowIndex, section:0)], with: UITableViewRowAnimation.top)
        
        //tableView.endUpdates()
        currentRowIndex+=1;
       saveChecklistItems()
        self.dismiss(animated: true, completion: nil)

            }
    func addItemViewController(controller: ItemDetailViewController, didFinishEditingItem item: ChecklistItem)
    {
        print("----------------------EDIT place----------------------")
        let index = checklistItems.index(where:{ $0 === item })!
         checklistItems[index] = item
        tableView.reloadRows(at:[IndexPath(row:index, section:0)], with: UITableViewRowAnimation.top)
        saveChecklistItems()
        self.dismiss(animated: true, completion: nil)

    }
    
   
}













