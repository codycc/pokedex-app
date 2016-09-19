//
//  ViewController.swift
//  Pokedex
//
//  Created by Cody Condon on 2016-09-19.
//  Copyright © 2016 Cody Condon. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    @IBOutlet weak var collection: UICollectionView!
    var pokemon = [Pokemon]()
    var musicPlayer: AVAudioPlayer!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        collection.dataSource = self
        collection.delegate = self
        parsePokemonCSV()
        initAudio()
    }
    
    func initAudio() {
        let path = Bundle.main.path(forResource: "music", ofType: "mp3")
        do {
            musicPlayer = try AVAudioPlayer(contentsOf: URL(string: path!)!)
            musicPlayer.prepareToPlay()
            musicPlayer.numberOfLoops = -1
            musicPlayer.play()
            
        } catch let err as NSError {
            print(err.debugDescription)
        }
    }
    
    func parsePokemonCSV() {
        //create path to the pokemon.csv file
        let path = Bundle.main.path(forResource: "pokemon", ofType: "csv")!
        // use the parser to pull out the rows
        do {
            let csv = try CSV(contentsOfURL: path)
            let rows = csv.rows
            print(rows)
            // go through each row to pull out pokeId and name
            for row in rows {
                let pokeId = Int(row["id"]!)!
                let name = row["identifier"]!
                // create an instance of each pokemone and assign in to poke
                let poke = Pokemon(name: name, pokedexId: pokeId)
                // add each instance of Pokemon to the pokemon array
                pokemon.append(poke)
            }
            
        } catch let err as NSError {
            print(err.debugDescription)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        //grab the pokecell and assign to cell
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PokeCell", for: indexPath) as? PokeCell {
            // pick the indexPath.item out of the pokemon array
            let poke = pokemon[indexPath.item]
            //the configureCell function will assign the dynamic information to the UILabel and UIImage
            cell.configureCell(poke)
            
            return cell
        }else {
            return UICollectionViewCell()
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return pokemon.count 
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 105, height: 105)
    }
    
    
    @IBAction func musicBtnPressed(_ sender: AnyObject) {
        
    }


}

