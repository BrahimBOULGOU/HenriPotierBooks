//
//  OfferViewModel.swift
//  HenriPotierBooks (iOS)
//
//  Created by Brahim BOULGOU on 23/03/2021.
//

import Combine
import SwiftUI

class OfferViewModel : ObservableObject{
    
    private let url = "https://henri-potier.techx.fr/books/c8fabf68-8374-48fe-a7ea-a00ccd07afff,a460afed-e5e7-4e39-a39d-c885c05db861/commercialOffers"
  
    private var task: AnyCancellable?
    @Published var offers: Offers?
  
    func getOffers() {
        task = URLSession.shared
            .dataTaskPublisher(for: URL(string: url)!)
            .tryMap() { element -> Data in
                guard let httpResponse = element.response as? HTTPURLResponse,
                    httpResponse.statusCode == 200 else {
                        throw URLError(.badServerResponse)
                    }
                return element.data
                }
            .decode(type: Offers.self, decoder: JSONDecoder())
            .sink(receiveCompletion: { print ("Received completion: \($0).") },
                  receiveValue: { user in print ("Received user: \(user).")})
        
            /*URLSession.shared.dataTaskPublisher(for: URL(string: url)!)
            .map { $0.data }
            .decode(type: Offers.self, decoder: JSONDecoder())
            .replaceError(with: Offers(offers: []))
            .eraseToAnyPublisher()
            .receive(on: RunLoop.main)
            .assign(to: \OfferViewModel.offers, on: self)*/
  
    }
}

