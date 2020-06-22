//
//  Inventory.swift
//  Galactic Smuggler
//
//  Created by Brian Kasper on 3/16/19.
//  Copyright © 2019 Brian P Kasper. All rights reserved.
//

import UIKit

class Inventory
{
    private var money: Double;
    private var items = [String : Int]();
    
    var delegate: InventoryDelegate?
    
    init(money: Double, items: [String : Int])
    {
        self.money = money;
        self.items = items;
        self.updateCash();
    }
    
    func getMoney() -> Double
    {
        return money;
    }
    
    func add(item: Item)
    {
        
        // if you got enough cash in da bank
        if (self.money >= item.getPrice())
        {
            // if item is already in inventory
            if let count = self.items[item.getName()]
            {
                self.items[item.getName()] = count + 1;
            }
            else
            {
                self.items[item.getName()] = 1;
            }
            
            self.money -= item.getPrice();
            self.updateCash()
        }
        else
        {
            // TODO Alert ya got no cash
        }
        
        
        
    }
    
    func remove(item: Item)
    {
        if let count = self.items[item.getName()]
        {
            if (count > 0)
            {
                self.items[item.getName()] = count - 1;
                self.money += item.getPrice();
            }
        }
        self.updateCash();
    }
    
    func removeAll(item: Item)
    {
        self.money += (item.getPrice() * Double(self.count(item: item)));
        self.items.removeValue(forKey: item.getName());
        self.updateCash();
    }
    
    func count(item: Item?) -> Int
    {
        if let item = item
        {
            return self.items[item.getName()] ?? 0;
        }
        else
        {
            return 0;
        }
        
    }
    
    func getItems() -> [(String, Int)]
    {
        var stuff: [(String, Int)] = []
        for item in self.items
        {
            stuff.append(item)
        }
        return stuff;
    }
    
    func count() -> Int
    {
        return self.items.count;
    }
    
    private func updateCash()
    {
        self.delegate?.updateCash()
    }
    
}

protocol InventoryDelegate {
    func updateCash();
}
