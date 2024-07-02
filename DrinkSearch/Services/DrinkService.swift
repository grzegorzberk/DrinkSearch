//
//  DrinkService.swift
//  DrinkSearch
//
//  Created by Grzegorz Berk on 03/07/2024.
//

import Foundation

struct DrinkService {

    func fetchDrinks(query: String, completion: @escaping (Result<[Drink], Error>) -> Void) {
        let urlString = "https://www.thecocktaildb.com/api/json/v1/1/filter.php?i=\(query)"
        guard let url = URL(string: urlString) else { return }

        URLSession.shared.dataTask(with: url) { (data, response, error) in
            if let error = error {
                completion(.failure(error))
                return
            }

            guard let data = data else { return }

            do {
                let drinkResponse = try JSONDecoder().decode(DrinkResponse.self, from: data)
                completion(.success(drinkResponse.drinks))
            } catch {
                completion(.failure(error))
            }
        }.resume()
    }

    func fetchDrinkDetails(id: String, completion: @escaping (Result<Drink, Error>) -> Void) {
        let urlString = "https://www.thecocktaildb.com/api/json/v1/1/lookup.php?i=\(id)"
        guard let url = URL(string: urlString) else { return }

        URLSession.shared.dataTask(with: url) { (data, response, error) in
            if let error = error {
                completion(.failure(error))
                return
            }

            guard let data = data else { return }

            do {
                let drinkResponse = try JSONDecoder().decode(DrinkDetailsResponse.self, from: data)
                if let drink = drinkResponse.drinks.first {
                    completion(.success(drink))
                } else {
                    completion(.failure(NSError(domain: "", code: 404, userInfo: [NSLocalizedDescriptionKey: "Drink not found"])))
                }
            } catch {
                completion(.failure(error))
            }
        }.resume()
    }
}

