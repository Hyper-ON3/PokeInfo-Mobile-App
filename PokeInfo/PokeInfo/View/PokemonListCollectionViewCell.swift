//
//  PokemonListCollectionViewCell.swift
//  PokeInfo
//
//  Created by Aleksey Kotsevych on 26/12/2022.
//

import UIKit

class PokemonListCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var pokemonImage: UIImageView!
    @IBOutlet weak var pokemonName: UILabel!
    @IBOutlet weak var pokemonType: UILabel!
    @IBOutlet weak var cellView: UIView!
    
    func configureCell() {
        cellView.layer.cornerRadius = 15
    }
    
    func updateCell(with model: Info) {
        fetchImage(model.image)
        pokemonName.text = model.name
        pokemonType.text = model.type.map({ $0 }).joined(separator: " ")
    }
    
    private func fetchImage(_ url: String) {
        guard let imageUlr = URL(string: url) else { return }
        
        DispatchQueue.global().async {
            if let imageData = try? Data(contentsOf: imageUlr) {
                DispatchQueue.main.async {
                    if let image = UIImage(data: imageData) {
                        self.pokemonImage.image = image
                    }
                }
            }
        }
    }
}
