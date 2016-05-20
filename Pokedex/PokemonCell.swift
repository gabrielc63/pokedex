//
//  PokemonCell.swift
//  Pokedex
//
//  Created by Gabriel Coronel on 8/5/16.
//  Copyright © 2016 Gabriel Coronel. All rights reserved.
//

import UIKit

class PokemonCell: UICollectionViewCell {
  @IBOutlet weak var thumbImage: UIImageView!
  @IBOutlet weak var nameLabel: UILabel!
  
  var pokemon: Pokemon!
  
  required init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
    self.layer.cornerRadius = 5.0
  }
  
  func configureCell(pokemon: Pokemon) {
    self.pokemon = pokemon
    
    nameLabel.text = self.pokemon.name.capitalizedString
    thumbImage.image = UIImage(named: "\(self.pokemon.pokedexId)")
  }
}
