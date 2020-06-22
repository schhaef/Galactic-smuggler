//
//  GraphViewController.swift
//  Galactic Smuggler
//
//  Created by Brian Kasper on 3/17/19.
//  Copyright © 2019 Brian P Kasper. All rights reserved.
//

import UIKit

class GraphViewController: UITableViewController
{

    var planet: Planet = Model.current_planet;
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return self.planet.getItems().count;
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.planet.getItems()[section].PriceHistory.count;
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return self.planet.getItems()[section].getName();
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "GraphCell", for: indexPath) as! GraphCell
        
        let prices: [Double] = self.planet.getItems()[indexPath.section].PriceHistory.reversed();
        
        cell.time.text = String(indexPath.row) + " Days Ago";
        cell.price.text = "$" + String(format: "%.2f", prices[indexPath.row]);
        if (indexPath.row >= prices.count - 1)
        {
            cell.change.isHidden = true;
        }
        else
        {
            cell.change.isHidden = false;
            let change = prices[indexPath.row] - prices[indexPath.row + 1];
            
            if(change > 0)
            {
                cell.change.text = String(format: "+%.2f", change);
                cell.change.textColor = UIColor.green;
            }
            else
            {
                cell.change.text = String(format: "%.2f", change);
                cell.change.textColor = UIColor.red;
            }
        }
        
        
        return cell;
    }
    
}
