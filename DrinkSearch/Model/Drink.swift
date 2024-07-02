//
//  Drink.swift
//  DrinkSearch
//
//  Created by Grzegorz Berk on 03/07/2024.
//

import Foundation

struct Drink: Decodable {
    let idDrink: String
    let strDrink: String
    let strDrinkThumb: String?
    let strInstructions: String?
}
