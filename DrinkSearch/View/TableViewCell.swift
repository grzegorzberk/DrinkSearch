//
//  TableViewCell.swift
//  DrinkSearch
//
//  Created by Grzegorz Berk on 03/07/2024.
//

import UIKit

class TableViewCell: UITableViewCell {

    let drinkImageView = UIImageView()
    let drinkNameLabel = UILabel()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUI()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupUI()
    }

    private func setupUI() {
        drinkImageView.translatesAutoresizingMaskIntoConstraints = false
        drinkNameLabel.translatesAutoresizingMaskIntoConstraints = false

        contentView.addSubview(drinkImageView)
        contentView.addSubview(drinkNameLabel)

        NSLayoutConstraint.activate([
            drinkImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            drinkImageView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            drinkImageView.widthAnchor.constraint(equalToConstant: 50),
            drinkImageView.heightAnchor.constraint(equalToConstant: 50),

            drinkNameLabel.leadingAnchor.constraint(equalTo: drinkImageView.trailingAnchor, constant: 10),
            drinkNameLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            drinkNameLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10)
        ])
    }

    func configure(with drink: Drink) {
        drinkNameLabel.text = drink.strDrink
        if let urlString = drink.strDrinkThumb, let url = URL(string: urlString) {
            drinkImageView.loadImage(from: url)
        }
    }
}
