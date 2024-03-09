//
//  historyViewController.swift
//  iOS-Assignment2
//
//  Created by user239796 on 3/4/24.
//

import UIKit

class historyViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var selectedProduct = History(name: "", quantity: 0, total: 0.0)
    var allHistoryView = [History]()
    
    
    @IBOutlet weak var historyTable: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Set the delegate and data source for the table view
        //tableView.delegate = self
        //tableView.dataSource = self
        // Do any additional setup after loading the view.
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return allHistoryView.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "historyCell")
        
        cell?.textLabel?.text = allHistoryView[indexPath.row].name
        cell?.detailTextLabel?.text = "\(allHistoryView[indexPath.row].quantity)"
        
        return cell!
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedProduct = allHistoryView[indexPath.row]
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "tohistItem"{
            let histItem = segue.destination as? histItemViewController
            
            let sh = allHistoryView[historyTable.indexPathForSelectedRow!.row]
            histItem?.name = sh.name
            histItem?.quantity = sh.quantity
            histItem?.timestamp = sh.datetime
            histItem?.total = sh.total
        }
        
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
