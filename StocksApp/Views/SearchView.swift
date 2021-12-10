//
//  SearchView.swift
//  StocksApp
//
//  Created by Jose Manuel Malagón Alba on 10/12/21.
//

import SwiftUI

struct SearchView: View {
    
    @Binding var searchString: String
    
    var body: some View {
        
        HStack {
            Spacer()
            Image(systemName: "magnifyingglass")
            
            TextField("Search", text:
                self.$searchString)
                .foregroundColor(.primary)
                .padding(10)
            
            Spacer()
        }.foregroundColor(.secondary)
        
            .background(Color(
                .secondarySystemBackground))
            .cornerRadius(10)
            .padding(10)
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView(searchString: .constant(""))
    }
}
