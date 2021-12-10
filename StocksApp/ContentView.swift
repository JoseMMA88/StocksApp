//
//  ContentView.swift
//  StocksApp
//
//  Created by Jose Manuel Malagón Alba on 10/12/21.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject private var stockListViewModel = StockListViewModel()
    
    init() {
        UINavigationBar.appearance().backgroundColor = UIColor.black
        UINavigationBar.appearance().largeTitleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        UITableView.appearance().backgroundColor = UIColor.black
        UITableViewCell.appearance().backgroundColor = UIColor.black
        
        stockListViewModel.load()
    }
    
    var body: some View {
        
        let filteredStocks = self.stockListViewModel.searchString.isEmpty ? self.stockListViewModel.stocks : self.stockListViewModel.stocks.filter { $0.symbol.starts(with: self.stockListViewModel.searchString.uppercased()) }
        
        return NavigationView {
            
            ZStack(alignment: .leading) {
                
                Color.black
                
                Text("December 20 2021")
                    .font(.custom("Arial", size: 32))
                    .fontWeight(.bold)
                    .foregroundColor(.gray)
                    .padding(EdgeInsets(top: 0, leading: 20, bottom: 0, trailing: 0))
                    .offset(y: -340)
                
                SearchView(searchString: self.$stockListViewModel.searchString)
                    .offset(y: -290)
                
                StockListView(stocks: filteredStocks)
                    .offset(y: 100)
            }
            
            .navigationTitle("Stocks")
        }.edgesIgnoringSafeArea(Edge.Set(.bottom))
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            
    }
}
