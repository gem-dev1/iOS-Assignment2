//
//  restockViewController.swift
//  iOS-Assignment2
//
//  Created by user239796 on 3/9/24.
//

import UIKit

class restockViewController: UIViewController,UITableViewDelegate, UITableViewDataSource {
    
    
    var selectedProduct = Product()
    var allProducts = (UIApplication.shared.delegate as? AppDelegate)!.globalProducts
    
    
    @IBOutlet weak var restockTableView: UITableView!
    @IBOutlet weak var qtyInput: UITextField!
    
    
    override func viewWillAppear(_ animated: Bool) {
        allProducts = (UIApplication.shared.delegate as? AppDelegate)!.globalProducts
        restockTableView.reloadData()
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return allProducts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {      
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "restockCell", for: indexPath)
            
        cell.textLabel?.text = allProducts[indexPath.row].name
        cell.detailTextLabel?.text = String(allProducts[indexPath.row].quantity)
            
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedProduct = allProducts[indexPath.row]
    }
    
    func clearSelection() {
        selectedProduct = Product()
        qtyInput.text = ""
    }
    
    @IBAction func onRestockClick(_ sender: UIButton) {
        
        
        // Combine the current text with the replacement string
        //let newText = qtyInput.text
        var qty = 0
        if let intString = convertToInt(optionalString: qtyInput.text){
            let idx = selectedProduct.id - 1
            qty = Int(intString)
            if selectedProduct.id != 0 && qty != 0 {
                (UIApplication.shared.delegate as? AppDelegate)?.globalProducts[idx].quantity = qty
            } else {
                
                let alert = UIAlertController(title: "Please make sure you selected a product and the quantity input is valid", message: "", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "OK", style: .cancel))
                present(alert, animated: true)
            }
            
        } else {
            // post alert
            
            let alert = UIAlertController(title: "Please make sure you enter a valid quantity first", message: "", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .cancel))
            present(alert, animated: true)        }

        restockTableView.reloadData()
            
        clearSelection()
        
        
    }
    
    func convertToInt(optionalString: String?) -> Int? {
        // Attempt to unwrap the optional string
        guard let string = optionalString else {
            return nil
        }
        
        // Attempt to convert the unwrapped string to an integer
        do {
            let intValue = try Int(string)
            return intValue
        } catch {
            print("Error: Unable to convert string to integer")
            return nil
        }
    }
    
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
