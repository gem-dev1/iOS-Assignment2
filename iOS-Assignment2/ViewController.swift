//
//  ViewController.swift
//  iOS-Assignment2
//
//  Created by user239796 on 2/21/24.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var p1 = Product(name: "Paper", price: 12.5, quantity: 10)
    var p2 = Product(name: "Scissors", price: 13.5, quantity: 11)
    var p3 = Product(name: "Sticky Notes", price: 14.5, quantity: 12)
    var allProducts = [Product]()
    
    var quantity = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        allProducts.append(p1)
        allProducts.append(p2)
        allProducts.append(p3	)
    }

    @IBOutlet weak var qtyLabel: UILabel!
    
    @IBAction func onDigitClick(_ sender: Any) {
        var buttonDigit = sender as! UIButton
        var clickedDigit = buttonDigit.titleLabel!.text!
        
        var quantityString = "\(String(quantity))\(clickedDigit)"
        quantity = Int(quantityString)!
        qtyLabel.text = "Qty: \(quantity)"
        // qtyLabel.text = "\(quantity)"
        
    }
    
    @IBAction func onClearClick(_ sender: UIButton) {
        quantity = 0
        qtyLabel.text = "Qty: 0"
    }
    
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return allProducts.count
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: "cell")
        
        cell?.textLabel?.text = allProducts[indexPath.row].name
        cell?.detailTextLabel?.text = String(allProducts[indexPath.row].price)
        
        return cell!
    }
    
}

