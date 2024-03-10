//
//  ViewController.swift
//  iOS-Assignment2
//
//  Created by user239796 on 2/21/24.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var p1 = Product(name: "Paper", price: 5.5, quantity: 50, id:1)
    var p2 = Product(name: "Scissors", price: 13.5, quantity: 15, id:2)
    var p3 = Product(name: "Sticky Notes", price: 14.5, quantity: 35, id:3)
    //var allProducts = [Product]()
    var allHistory = [History]()
    
    var allProducts = (UIApplication.shared.delegate as? AppDelegate)!.globalProducts
    
    
    @IBOutlet weak var productTable: UITableView!
    
    var quantity = 0
    var computedTotal = Double(0)
    
    var selectedProduct = Product()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        //allProducts.append(p1)
        //allProducts.append(p2)
        //allProducts.append(p3)
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        allProducts = (UIApplication.shared.delegate as? AppDelegate)!.globalProducts
        productTable.reloadData()
        
    }
    @IBOutlet weak var qtyLabel: UILabel!
    @IBOutlet weak var productLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    
    // (UIApplication.shared.delegate as? AppDelegate)?.globalProducts.append(self.newcontact)
    
    @IBOutlet weak var productTableMain: UITableView!
    
    
    @IBAction func onDigitClick(_ sender: Any) {
        let buttonDigit = sender as! UIButton
        let clickedDigit = buttonDigit.titleLabel!.text!
        
        var quantityString = "\(String(quantity))\(clickedDigit)"
        quantity = Int(quantityString)!
        qtyLabel.text = "Qty: \(quantity)"
        // qtyLabel.text = "\(quantity)"
        
        updateTotal()
        
    }
    
    @IBAction func onClearClick(_ sender: UIButton) {
        clearSelection()
    }
    
    
    @IBAction func onBuyClick(_ sender: UIButton) {
        if selectedProduct.id != 0 && selectedProduct.quantity >= quantity {
            let idx = selectedProduct.id - 1
            //allProducts[idx].quantity = selectedProduct.quantity - quantity
            (UIApplication.shared.delegate as? AppDelegate)?.globalProducts[idx].quantity = selectedProduct.quantity - quantity
            
            let new_history = History(name: selectedProduct.name, quantity: quantity, total: computedTotal)
            allHistory.append(new_history)
            
            let alert = UIAlertController(title: "You have purchased \(quantity) \(selectedProduct.name)(s)", message: "", preferredStyle: .alert)
                
            alert.addAction(UIAlertAction(title: "OK", style: .cancel))
                present(alert, animated: true)
        } else {
            
            let alert = UIAlertController(title: "There is an issue with the quantity or product to purchase. Please make sure both are selected and valid", message: "", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .cancel))
            present(alert, animated: true)
        }
        productTableMain.reloadData()
        
        clearSelection()
    }
    
    func clearSelection() {
        quantity = 0
        computedTotal = 0
        selectedProduct = Product()
        qtyLabel.text = "Qty: 0"
        productLabel.text = "Item: None"
        totalLabel.text = "Total: 0"
    }
    
    func updateTotal() {
        if quantity != 0 && selectedProduct.price != 0 {
            computedTotal = Double(quantity) * selectedProduct.price
            totalLabel.text = "Total: \(computedTotal)"
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return allProducts.count
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "managerPanel"{
            let MP = segue.destination as? managerViewController
            MP?.allHistoryMP = allHistory
        }
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as? productTableViewCell
        
        cell?.productName?.text = allProducts[indexPath.row].name
        cell?.productPrice?.text = "$\(allProducts[indexPath.row].price)"
        cell?.productQty?.text = String(allProducts[indexPath.row].quantity)
        
        return cell!
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedProduct = allProducts[indexPath.row]
        productLabel.text = "Item: \(selectedProduct.name)"

        updateTotal()
    }
    
}

