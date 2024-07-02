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
    @IBOutlet weak var instructionsTextView: UITextView!

    var drink: Drink?

    override func viewDidLoad() {
        super.viewDidLoad()
        if let drink = drink {
            configureView(with: drink)
        } else {
            showErrorAlert(message: "No drink details available")
        }
    }

    private func configureView(with drink: Drink) {
        drinkNameLabel.text = drink.strDrink
        instructionsTextView.text = drink.strInstructions ?? "No instructions available"
        if let urlString = drink.strDrinkThumb, let url = URL(string: urlString) {
            drinkImageView.loadImage(from: url)
        }
    }

    private func showErrorAlert(message: String) {
        let alert = UIAlertController(title: "Error", message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default))
        present(alert, animated: true)
    }
}

