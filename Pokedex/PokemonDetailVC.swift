//
//  PokemonDetailVC.swift
//  Pokedex
//
//  Created by Cody Condon on 2016-09-19.
//  Copyright © 2016 Cody Condon. All rights reserved.
//

import UIKit

class PokemonDetailVC: UIViewController {
    @IBOutlet weak var nameLbl: UILabel!
    
    var pokemon: Pokemon! 

    override func viewDidLoad() {
        super.viewDidLoad()
        nameLbl.text = pokemon.name
      
    }

  

}
