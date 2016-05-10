//
//  Pokemon.swift
//  Pokedex
//
//  Created by Gabriel Coronel on 8/5/16.
//  Copyright © 2016 Gabriel Coronel. All rights reserved.
//

import Foundation

struct Pokemon {
  private let _name: String!
  private let _pokedexId: Int!
  
  var name: String {
    return _name
  }
  
  var pokedexId: Int {
    return _pokedexId
  }
  
  init(name: String, pokedexId: Int) {
    self._name = name
    self._pokedexId = pokedexId
  }
}