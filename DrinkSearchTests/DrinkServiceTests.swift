//
//  DrinkSearchTests.swift
//  DrinkSearchTests
//
//  Created by Grzegorz Berk on 03/07/2024.
//

import XCTest
@testable import DrinkSearch

class DrinkServiceTests: XCTestCase {

    var drinkService: DrinkService!

    override func setUp() {
        super.setUp()
        drinkService = DrinkService()
    }

    override func tearDown() {
        drinkService = nil
        super.tearDown()
    }

    func testFetchDrinks() {
        let expectation = self.expectation(description: "Fetch Drinks")

        drinkService.fetchDrinks(query: "Gin") { result in
            switch result {
            case .success(let drinks):
                XCTAssertFalse(drinks.isEmpty, "No drinks found")
            case .failure(let error):
                XCTFail("Error: \(error.localizedDescription)")
            }
            expectation.fulfill()
        }

        waitForExpectations(timeout: 5, handler: nil)
    }

    func testFetchDrinkDetails() {
        let expectation = self.expectation(description: "Fetch Drink Details")

        drinkService.fetchDrinkDetails(id: "11007") { result in
            switch result {
            case .success(let drink):
                XCTAssertNotNil(drink, "Drink not found")
                XCTAssertEqual(drink.idDrink, "11007")
            case .failure(let error):
                XCTFail("Error: \(error.localizedDescription)")
            }
            expectation.fulfill()
        }

        waitForExpectations(timeout: 5, handler: nil)
    }
}
