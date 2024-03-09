//
//  histItemViewController.swift
//  iOS-Assignment2
//
//  Created by user239796 on 3/9/24.
//

import UIKit

class histItemViewController: UIViewController {
    var name = ""
    var timestamp = ""
    var total = 0.0
    var quantity = 0
    
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var qtyLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nameLabel.text = name
        totalLabel.text = "\(total)"
        qtyLabel.text = "\(quantity)"
        timeLabel.text = timestamp

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
