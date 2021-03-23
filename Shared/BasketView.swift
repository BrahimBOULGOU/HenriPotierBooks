//
//  BasketView.swift
//  HenriPotierBooks (iOS)
//
//  Created by Brahim BOULGOU on 23/03/2021.
//

import SwiftUI

struct BasketView: View {
    @Binding var books: [Book]
    @ObservedObject var viewModel = OfferViewModel()
    
    var body: some View {
        NavigationView {
            VStack {
                List(books, id: \.self) {
                    BookCell(book: $0)
                }
                
                HStack {
                    Text("TotalPrice")
                    Text(String(books.map{$0.price}.reduce(0.0, +)))
                }
                HStack {
                    Text("Best Offer")
                   // Text(String(BestOfferCalc.getBestOffer(offers: viewModel.offers , basket: books, totalAmount: books.map{$0.price}.reduce(0.0, +))))
                }
            }
           
            .navigationBarTitle(Text("Books"))
            }
                .onAppear {
                  self.viewModel.getOffers()
            }
        }
    
}
