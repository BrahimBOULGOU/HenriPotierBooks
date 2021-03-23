//
//  BestOfferCalc.swift
//  HenriPotierBooks (iOS)
//
//  Created by Brahim BOULGOU on 23/03/2021.
//
import SwiftUI

struct BestOfferCalc {
    
    func getBestOffer(offers: Offers, basket: [Book], totalAmount: Float) -> Float{
        var newPrice : [Float]?
        
        for i in 0 ... offers.offers.count - 1 {
            switch offers.offers[i].type {
            case "percentage":
                newPrice?.append(getNewPriceByPercentage(offer: offers.offers[i], basket: basket, totalAmount: totalAmount))
            case "minus":
                newPrice?.append(getNewPriceByMinus(offer: offers.offers[i], totalAmount: totalAmount))
            case "slice":
                newPrice?.append(getNewPriceBySlice(offer: offers.offers[i], totalAmount: totalAmount))
            default:
                newPrice?.append(0.0)
            }
        }
        
        return Float(newPrice?.count ?? 0) 
    }
    
    private func getNewPriceByPercentage(offer: Offer, basket:[Book], totalAmount: Float) -> Float{
        return totalAmount - Float((basket.count * offer.myValue))
    }
    
    private func getNewPriceByMinus(offer: Offer, totalAmount: Float) -> Float{
        return totalAmount - Float(offer.myValue)
    }
    
    private func getNewPriceBySlice(offer: Offer, totalAmount: Float) -> Float{
        return totalAmount - (round(totalAmount/Float(offer.sliceValue)) * Float(offer.myValue))
    }
}
