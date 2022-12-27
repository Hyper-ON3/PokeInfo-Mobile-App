//
//  DetailViewController.swift
//  PokeInfo
//
//  Created by Aleksey Kotsevych on 26/12/2022.
//

import UIKit

class DetailViewController: UIViewController {
    
    @IBOutlet weak var pokemonImage: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var categoryLabel: UILabel!
    @IBOutlet weak var abilitiesLabel: UILabel!
    @IBOutlet weak var weaknessesLabel: UILabel!
    @IBOutlet weak var typeLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    var data: Info!
    var selectedImage: UIImage!
    
    override func viewDidLoad() {
        super.viewDidLoad()
      
        pokemonImage.image = selectedImage
        updateUI(with: data)
    }
    
    private func updateUI(with model: Info) {
        nameLabel.text = model.name
        categoryLabel.text = "Category: " + model.category
        abilitiesLabel.text = "Abilities: " + model.abilities.map({ $0 }).joined(separator: ", ")
        weaknessesLabel.text = "Weaknesses: " + model.weaknesses.map({ $0 }).joined(separator: ", ")
        typeLabel.text = "Type: " + model.type.map({ $0 }).joined(separator: ", ")
        descriptionLabel.text = "Description: " + model.datumDescription

    }
    
}
