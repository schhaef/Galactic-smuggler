//
//  Item.swift
//  Galactic Smuggler
//
//  Created by Brian Kasper on 3/16/19.
//  Copyright © 2019 Brian P Kasper. All rights reserved.
//

import UIKit

class Item
{
    
    private var name: String;
    private var price: Double;
    private var image: UIImage;
    var PriceHistory : [Double];
    
    init(name: String, starting_price: Double, image: UIImage)
    {
        self.name = name;
        self.price = starting_price;
        self.image = image;
        PriceHistory = [price];
    }
    
    func getName() -> String
    {
        return self.name;
    }
    
    func setPrice(price: Double)
    {
        self.price = price;
    }
    
    func getPrice() -> Double
    {
        return price;
    }
    
    func getImage() -> UIImage
    {
        return image;
    }
    
    func passDay() {
        let Change = self.getRandom();
        var newPrice = PriceHistory[PriceHistory.count - 1] + Change;
        if newPrice < 0 {
            newPrice = newPrice - (1.2 * Change);
        } else if newPrice > 100 {
            newPrice = newPrice - (1.2 * Change);
        }
        PriceHistory.append(newPrice)
        setPrice(price: newPrice)
        
    }
    
    func getRandom() -> Double
    {
        return Double(Int(arc4random_uniform(11)) - 5) + drand48()
    }
}
