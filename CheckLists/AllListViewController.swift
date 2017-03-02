//
//  AllListViewController.swift
//  CheckLists
//
//  Created by iem on 02/03/2017.
//  Copyright © 2017 iem. All rights reserved.
//

import UIKit

class AllListViewController: UITableViewController {

    
    var currentRowIndex=0;
    var checkLists = [Checklist]();
    
    override func viewDidLoad() {
        super.viewDidLoad()

        checkLists.append(Checklist(name: "liste 1"))
        checkLists.append(Checklist(name: "liste 2"))
        checkLists.append(Checklist(name: "liste 3"))
        
        
        tableView.reloadRows(at:[IndexPath(row:currentRowIndex,section:0)], with: UITableViewRowAnimation.fade)
        currentRowIndex+=1;
        
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ShowChecklist" {
        
            let controller = segue.destination as! ChecklistViewController
       let checklist = checkLists[(tableView.indexPath(for: sender as! UITableViewCell)?.row)!]
        controller.list = checklist
       
        } else if segue.identifier == "AddChecklist" {
            let navigationController = segue.destination as! UINavigationController
            let controller = navigationController.topViewController as! ChecklistViewController
            //controller.delegate = self
            //controller.checklistToEdit = nil
        }
    }

       func configureTextFor(cell: UITableViewCell, withItem item: Checklist)
    {
        if let theLabel = self.view.viewWithTag(50) as? UILabel {
            theLabel.text = item.name
        }
        //cell.textLabel?.text = item.text;
    }

    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return checkLists.count;
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        let cell = tableView.dequeueReusableCell(withIdentifier: "checkLists", for: indexPath) as UITableViewCell
        //cell.viewWithTag(0)
       // cell.viewWithTag(1)
        
        //configureCheckmarkFor(cell:cell,withItem:checkLists[indexPath.row]);
        configureTextFor(cell:cell,withItem:checkLists[indexPath.row]);
        
        return cell;
    }

    /*
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        // Configure the cell...

        return cell
    }
    */

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
