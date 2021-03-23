//
//  BookCell.swift
//  HenriPotierBooks (iOS)
//
//  Created by Brahim BOULGOU on 23/03/2021.
//

import SwiftUI

struct BookCell: View {
    private let book: Book
    @ObservedObject var imageLoader:ImageLoader
    @State var image:UIImage = UIImage()
    
    init(book: Book) {
        self.book = book
        imageLoader = ImageLoader(urlString:book.cover)
    }
    
    var body: some View {
        HStack {
            Image(uiImage: image)
                .resizable()
                .scaledToFit()
                .frame(width: 80, height: 80)
                .onReceive(imageLoader.didChange) { data in
                 self.image = UIImage(data: data) ?? UIImage()
                }
            VStack(alignment: .leading, spacing: 15) {
                Text(book.title)
                    .font(.system(size: 18))
                    .foregroundColor(Color.blue)
                Text("\(book.price)")
                    .font(.system(size: 14))
            }
        }
    }
}
