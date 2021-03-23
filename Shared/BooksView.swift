//
//  ContentView.swift
//  Shared
//
//  Created by Brahim BOULGOU on 23/03/2021.
//

import SwiftUI

struct BooksView: View {
    @ObservedObject var viewModel = BooksViewModel()
    
    
    var body: some View {
        NavigationView {
            List(viewModel.books, id: \.self) {
                BookCell(book: $0)
            }
            .navigationBarTitle(Text("Books"))
            .toolbar {
                
                ToolbarItem(placement: .primaryAction) {
                    
                    NavigationLink(destination: BasketView(books: $viewModel.books)) {
                        Text("Basket")
                            .frame(minWidth: 0, maxWidth: 300)
                            .padding()
                            .foregroundColor(.black)
                            .cornerRadius(40)
                            .font(.title)
                        
                    }
                }
            }.onAppear {
                self.viewModel.getBooks()
            }
        }
    }
}
