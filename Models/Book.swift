//
//  Book.swift
//  HenriPotierBooks (iOS)
//
//  Created by Brahim BOULGOU on 23/03/2021.
//

struct Book : Decodable, Hashable {
    let isbn : String
    let title : String
    let price : Float
    let cover : String
}

