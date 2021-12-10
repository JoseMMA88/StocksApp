//
//  StockListViewModel.swift
//  StocksApp
//
//  Created by Jose Manuel Malagón Alba on 10/12/21.
//

import Foundation

class StockListViewModel: ObservableObject {
    
    @Published var searchString: String = ""
    @Published var stocks: [StockViewModel] = [StockViewModel]()
    
    func load() {
        fetchStocks()
    }
    
    private func fetchStocks() {
        
        WebService().getStocks { stocks in
            if let stocks = stocks {
                DispatchQueue.main.async {
                    self.stocks = stocks.map(StockViewModel.init)
                }
            }
        }
        
    }
    
}
