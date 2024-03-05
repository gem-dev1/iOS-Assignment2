//
//  Products.swift
//  iOS-Assignment2
//
//  Created by user239796 on 2/22/24.
//

import Foundation

class Product {
    
    var name: String
    var price: Double
    var quantity: Int
    var id: Int
    
    init(name: String, price: Double, quantity: Int, id: Int) {
        self.name = name
        self.price = price
        self.quantity = quantity
        self.id = id
    }
    
    init() {
        self.name = "None"
        self.price = 0
        self.quantity = 0
        self.id = 0
    }
}
