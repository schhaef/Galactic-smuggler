//
//  PurchaseWindow.swift
//  Galactic Smuggler
//
//  Created by Brian Kasper on 3/16/19.
//  Copyright © 2019 Brian P Kasper. All rights reserved.
//

import UIKit

class PurchaseWindow: UIView
{
    // view elements
    @IBOutlet var lessButton: UIButton!
    @IBOutlet var itemPicture: UIImageView!
    @IBOutlet var itemPrice: UILabel!
    @IBOutlet var moreButton: UIButton!
    @IBOutlet var itemCount: UILabel!
    @IBOutlet var itemName: UILabel!
    
    // other variables
    var item: Item?;
    
    init(frame: CGRect, item: Item)
    {
        self.item = item;
        super.init(frame: frame);
        loadUI(item: item);
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder);
    }
    
    
    
    // init function
    class func instanceFromNib() -> UIView {
        return UINib(nibName: "PurchaseWindow", bundle: nil).instantiate(withOwner: self, options: nil)[0] as! UIView
    }
    
    // load UI elements
    func loadUI(item: Item)
    {
        self.item = item;
        self.itemPicture.image = item.getImage();
        self.itemName.text = item.getName();
        self.lessButton.isHidden = true;
        self.updateUI()
    }
    
    // called when more button is clicked
    @IBAction func moreButtonAction(_ sender: Any)
    {
        buyItem();
    }
    
    // called when less button is clicked
    @IBAction func lessButtonAction(_ sender: Any)
    {
        sellItem();
    }
    
    func buyItem() {
        Model.inventory.add(item: self.item!)
        self.updateUI()
    }
    
    func sellItem() {
        Model.inventory.remove(item: self.item!)
        self.updateUI()
    }
    
    func updateUI()
    {
        let count = Model.inventory.count(item: self.item);
        self.itemCount.text = String(count);
        if (count == 0)
        {
            self.lessButton.isHidden = true;
        }
        else
        {
            self.lessButton.isHidden = false;
        }
        if let item = self.item
        {
            self.itemPrice.text = String(format: "%.2f", item.getPrice());
        }

    }
    
}
