//
//  InventoryViewController.swift
//  Galactic Smuggler
//
//  Created by Brian Kasper on 3/17/19.
//  Copyright © 2019 Brian P Kasper. All rights reserved.
//

import UIKit

class InventoryViewController: UITableViewController
{
    var inventory = Model.inventory;
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1;
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.inventory.count();
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        
        let item = self.inventory.getItems()[indexPath.row];
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "InventoryCell", for: indexPath) as! InventoryCell
        cell.name.text = item.0
        cell.count.text = String(item.1)
        
        return cell;
    }
}
