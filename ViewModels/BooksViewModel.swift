//
//  BooksViewModel.swift
//  HenriPotierBooks (iOS)
//
//  Created by Brahim BOULGOU on 23/03/2021.
//

import Combine
import SwiftUI


class BooksViewModel : ObservableObject{
    
    private let url = "https://henri-potier.techx.fr/books"
  
    private var task: AnyCancellable?
    @Published var books: [Book] = []
  
    func getBooks() {
        task = URLSession.shared.dataTaskPublisher(for: URL(string: url)!)
            .map { $0.data }
            .decode(type: [Book].self, decoder: JSONDecoder())
            .replaceError(with: [])
            .eraseToAnyPublisher()
            .receive(on: RunLoop.main)
            .assign(to: \BooksViewModel.books, on: self)
 
  
    }
    
}
