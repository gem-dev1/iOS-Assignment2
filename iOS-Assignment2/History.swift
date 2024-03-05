//
//  History.swift
//  iOS-Assignment2
//
//  Created by user239796 on 3/4/24.
//

import Foundation

class History {
    
    var name: String
    var datetime: String
    var quantity: Int
    var total: Double
    
    init(name: String, quantity: Int, total: Double) {
        let currentDate = Date()
        let dateFormatter = DateFormatter()

        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        let dateString = dateFormatter.string(from: currentDate)
        
        self.name = name
        self.datetime = dateString
        self.quantity = quantity
        self.total = total
    }
}
