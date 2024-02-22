//
//  ViewController.swift
//  iOS-Assignment2
//
//  Created by user239796 on 2/21/24.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBOutlet weak var qtyLabel: UILabel!
    
    @IBAction func onDigitClick(_ sender: Any) {
        var clickedDigit = sender as! UIButton
        qtyLabel.text = clickedDigit.titleLabel!.text
    }
    
}

