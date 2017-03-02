//
//  ListDetailViewController.swift
//  CheckLists
//
//  Created by iem on 02/03/2017.
//  Copyright © 2017 iem. All rights reserved.
//

import UIKit
protocol ItemListViewControllerDelegate : class {
    func addItemViewControllerDidCancel(controller: ItemDetailViewController)
    func addItemViewController(controller: ItemDetailViewController, didFinishAddingItem item: ChecklistItem)
    func addItemViewController(controller: ItemDetailViewController, didFinishEditingItem item: ChecklistItem)
}


class ListDetailViewController: UIViewController {

    var delegate : ItemListViewControllerDelegate?;
    var itemToEdit: Checklist?
    var isEditingItem: Bool?;

    
    override func viewDidLoad() {
        super.viewDidLoad()
        if itemToEdit == nil
        {
            isEditingItem=false;
        }
        else
        {
            isEditingItem=true;
        }

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
