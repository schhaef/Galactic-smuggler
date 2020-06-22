//
//  Planet.swift
//  Galactic Smuggler
//
//  Created by Austin on 3/16/19.
//  Copyright © 2019 Brian P Kasper. All rights reserved.
//

import UIKit

class Planet
{
    private var name: String;
    private var image: UIImage;
    private var items: [Item];
    
    init(name: String, image: UIImage, items: [Item])
    {
        self.name = name;
        self.image = image;
        self.items = items;
    }
    
    func getName() -> String {
        return self.name;
    }
    
    func getImage() -> UIImage {
        return self.image;
    }
    
    func getItems() -> [Item] {
        return self.items;
    }
}
