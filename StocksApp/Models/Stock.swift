//
//  Stock.swift
//  StocksApp
//
//  Created by Jose Manuel Malagón Alba on 10/12/21.
//

import Foundation

struct Stock: Decodable {
    
    let symbol: String
    let description: String
    let price: Double
    let change: String
    
}
