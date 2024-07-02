//
//  ShowDetailsViewController.swift
//  DrinkSearch
//
//  Created by Grzegorz Berk on 03/07/2024.
//

import UIKit

class ShowDetailsViewController: UIViewController {

    @IBOutlet weak var drinkImageView: UIImageView!
    @IBOutlet weak var drinkNameLabel: UILabel!
    @IBOutlet weak var instructionsTextView: UITextView!  // Zmieniono na UITextView

    var drink: Drink?

    override func viewDidLoad() {
        super.viewDidLoad()
        if let drink = drink {
            configureView(with: drink)
        }
    }

    private func configureView(with drink: Drink) {
        drinkNameLabel.text = drink.strDrink
        instructionsTextView.text = drink.strInstructions  // Ustawianie instrukcji
        if let urlString = drink.strDrinkThumb, let url = URL(string: urlString) {
            drinkImageView.loadImage(from: url)
        }
    }
}

