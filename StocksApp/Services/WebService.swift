//
//  WebService.swift
//  StocksApp
//
//  Created by Jose Manuel Malagón Alba on 10/12/21.
//

import Foundation

class WebService {
    
    func getStocks(completion: @escaping (([Stock]?) -> Void)){
        
        guard let url = URL(string: "https://island-bramble.glitch.me/stocks") else {
            fatalError("URL is not correct")
        }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            
            guard let data = data, error == nil else {
                completion(nil)
                return
            }
            
            let stocks = try? JSONDecoder().decode([Stock].self, from: data)
            
            stocks == nil ? completion(nil) : completion(stocks)
            return
            
            
        }.resume()
        
    }
    
}
