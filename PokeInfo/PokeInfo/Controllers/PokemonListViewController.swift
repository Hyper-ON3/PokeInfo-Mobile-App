//
//  ViewController.swift
//  PokeInfo
//
//  Created by Aleksey Kotsevych on 26/12/2022.
//

import UIKit
import FirebaseDatabase
import FirebaseDatabaseSwift
import Alamofire

class PokemonListViewController: UIViewController {
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    private var infoArray: [Info] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.delegate = self
        collectionView.dataSource = self
        
        fetchPokeInfo()
        
    }
    
    func fetchPokeInfo() {
        let ref = Database.database().reference()
        ref.child("data").observe(.value) { snapshot in
            guard let value = snapshot.value else { return }
            
            do {
                let info = try Database.Decoder().decode([Info].self, from: value)
                self.infoArray = info
                self.collectionView.reloadData()
            } catch {
                print(error.localizedDescription)
            }
        }
    }
    
}

extension PokemonListViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return infoArray.count
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PokemonListCell",
                                                            for: indexPath) as? PokemonListCollectionViewCell else { return UICollectionViewCell() }
        
        let model = infoArray[indexPath.row]
        
        cell.updateCell(with: model)
        cell.configureCell()
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let item = infoArray[indexPath.row]
        let selectedCell = collectionView.cellForItem(at: indexPath) as? PokemonListCollectionViewCell
        
        guard let vc = storyboard?.instantiateViewController(withIdentifier: "DetailViewController") as? DetailViewController else { return }
        
        vc.data = item
        vc.selectedImage = selectedCell?.pokemonImage.image
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
}
