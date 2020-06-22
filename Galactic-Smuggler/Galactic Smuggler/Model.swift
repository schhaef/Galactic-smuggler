//
//  Model.swift
//  Galactic Smuggler
//
//  Created by Austin on 3/16/19.
//  Copyright © 2019 Brian P Kasper. All rights reserved.
//

import UIKit

class Model{
    
    static let inventory = Inventory(money: 100, items: [:])
    
    //Pictures:
    
    static let Earthpic = UIImage(named: "EarthSmuggle.png") as! UIImage
    static let Marspic = UIImage(named: "MarsSmuggle.png") as! UIImage
    static let Moonpic = UIImage(named: "moon.png") as! UIImage
    static let Goldpic = UIImage(named: "GOld.png") as! UIImage
    static let Waterpic = UIImage(named: "waterdrum.png") as! UIImage
    static let Niobiumpic = UIImage(named: "Niodium.png") as! UIImage
    static let Heliumpic = UIImage(named: "Helium.png") as! UIImage
    static let Sunpic = UIImage(named: "sun.png") as! UIImage
    
    
    //Items:
    static var Gold1 : Item = Item(name: "Gold Ingot", starting_price: 30.0, image: Goldpic)
    static var Gold2 : Item = Item(name: "Gold Ingot", starting_price: 50.0, image: Goldpic)
    static var Gold3 : Item = Item(name: "Gold Ingot", starting_price: 40.0, image: Goldpic)

    static var Water1 : Item = Item(name: "Water Barrel", starting_price: 20.0, image: Waterpic)
    static var Water2 : Item = Item(name: "Water Barrel", starting_price: 60.0, image: Waterpic)
    static var Water3 : Item = Item(name: "Water Barrel", starting_price: 50.0, image: Waterpic)

    static var Niobium1 : Item = Item(name: "Niobium Ore", starting_price: 60.0, image: Niobiumpic)
    static var Niobium2 : Item = Item(name: "Niobium Ore", starting_price: 30.0, image: Niobiumpic)
    static var Niobium3 : Item = Item(name: "Niobium Ore", starting_price: 80.0, image: Niobiumpic)

    static var Helium1 : Item = Item(name: "Helium Gas", starting_price: 30.0, image: Heliumpic)
    static var Helium2 : Item = Item(name: "Helium Gas", starting_price: 60.0, image: Heliumpic)
    static var Helium3 : Item = Item(name: "Helium Gas", starting_price: 5.0, image: Heliumpic)
    
    static var Sun1 : Item = Item(name: "The Sun", starting_price: 10000, image: Sunpic)
    static var Sun2 : Item = Item(name: "The Sun", starting_price: 10000, image: Sunpic)
    static var Sun3 : Item = Item(name: "The Sun", starting_price: 10000, image: Sunpic)


    
    
    static let EarthItems: [Item] = [Gold1, Water1, Niobium1, Helium1, Sun1]
    static let MarsItems: [Item] = [Gold2, Water2, Niobium2, Helium2, Sun2]
    static let MoonItems: [Item] = [Gold3, Water3, Niobium3, Helium3, Sun3]
    
    static var current_planet: Planet! = Earth;
    
    
    static var Planets : [Planet] = [Earth, Mars, Moon]
    
    
    
    static var Earth = Planet(name: "Earth", image: Earthpic, items: EarthItems)
    static var Mars = Planet(name: "Mars", image: Marspic, items: MarsItems)
    static var Moon = Planet(name: "Moon", image: Moonpic, items: MoonItems)
    //Item Arrays:
    
    //Markets:
    static var EarthMarket : Market = Market(planet: Earth)
    
    static func passDay() {
        for planet in Model.Planets {
            for item in planet.getItems() {
                item.passDay()
            }
        }
    }
}
