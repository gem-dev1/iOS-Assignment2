//
//  managerViewController.swift
//  iOS-Assignment2
//
//  Created by user239796 on 3/4/24.
//

import UIKit

class managerViewController: UIViewController {
    
    var allHistoryMP = [History]()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "toHistory"{
            
            let HP = segue.destination as? historyViewController
            HP?.allHistoryView = allHistoryMP
        }
    }

    

}
