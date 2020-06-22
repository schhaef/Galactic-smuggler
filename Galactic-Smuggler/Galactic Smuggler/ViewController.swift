//
//  ViewController.swift
//  Galactic Smuggler
//
//  Created by Brian Kasper on 3/16/19.
//  Copyright © 2019 Brian P Kasper. All rights reserved.
//

import UIKit

class ViewController: UIViewController, InventoryDelegate {
    
    @IBOutlet var cash: UILabel!
    @IBOutlet var items: UIStackView!
    @IBOutlet var planetName: UILabel!
    @IBOutlet weak var nextDay: UIButton!
    
    // other vars
    var inventory: Inventory = Model.inventory;
    var money: Double = Model.inventory.getMoney();
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initGame();
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated);
        self.updateItems();
    }
    
    func initGame()
    {
        self.inventory.delegate = self;
        self.updateCash();
        
        Model.current_planet = Model.Earth;
        self.loadPlanet(planet: Model.current_planet);
        
    }
    
    func updateCash()
    {
        self.cash.text = String(format: "%.2f", Model.inventory.getMoney());
    }
    
    func changePlanet(planet: Planet)
    {
        removeAllItems()
        loadPlanet(planet: planet)
    }
    
    func removeAllItems()
    {
        for view in self.items.subviews
        {
            view.removeFromSuperview();
        }
    }
    
    func loadPlanet(planet: Planet)
    {
        self.planetName.text = planet.getName();
        self.loadStackForPlanet(planet: planet);
    }
    
    func loadStackForPlanet(planet: Planet)
    {
        for item in planet.getItems()
        {
            self.addItemToStackView(item: item);
        }
    }
    
    func addItemToStackView(item: Item)
    {
        let itemView: PurchaseWindow = PurchaseWindow.instanceFromNib() as! PurchaseWindow;
        itemView.loadUI(item: item);
        
        self.items.addArrangedSubview(itemView);
        self.view.addSubview(self.items);
    }
    
    @IBAction func unwindHome(source: UIStoryboardSegue)
    {
        if let source = source.source as? PlanetLaunchView
        {
            
            self.changePlanet(planet: source.currentPlanet)
        }
    }
    
    @IBAction func NextDayrun(_ sender: Any) {
        Model.passDay()
        self.updateItems()
    }
    
    func updateItems()
    {
        for view in self.items.subviews
        {
            if let view = view as? PurchaseWindow
            {
                view.updateUI();
                
            }
        }
    }
    
}

