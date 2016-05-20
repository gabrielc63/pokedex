//
//  ViewController.swift
//  Pokedex
//
//  Created by Gabriel Coronel on 8/5/16.
//  Copyright © 2016 Gabriel Coronel. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
  
  @IBOutlet weak var collection: UICollectionView!
  
  var pokemonList = [Pokemon]()
  var musicPlayer: AVAudioPlayer!

  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a nib.
    collection.delegate = self
    collection.dataSource = self
    parseCSV()
    initAudio()
  }
  
  func parseCSV() {
    let path = NSBundle.mainBundle().pathForResource("pokemon", ofType: "csv")!
    do {
      let csv  = try CSVParser(contentsOfURL: path)
      let rows = csv.rows
      
      for row in rows {
        let pokemonId = Int(row["id"]!)!
        let name = row["identifier"]!
        let pokemon = Pokemon(name: name, pokedexId: pokemonId)
        pokemonList.append(pokemon)
      }
    } catch let err as NSError {
      print(err.debugDescription)
    }
  }
  
  func initAudio() {
    let path = NSBundle.mainBundle().pathForResource("sound", ofType: "mp3")!
    do {
      musicPlayer = try AVAudioPlayer(contentsOfURL: NSURL(string: path)!)
      musicPlayer.prepareToPlay()
      musicPlayer.numberOfLoops = -1
      musicPlayer.play()
    } catch let err as NSError {
      print(err.debugDescription)
    }
  }

  func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
    
    if let cell = collectionView.dequeueReusableCellWithReuseIdentifier("PokemonCell", forIndexPath: indexPath) as? PokemonCell {
      
      let pokemon = pokemonList[indexPath.row]
      cell.configureCell(pokemon)
      return cell
    } else {
        return UICollectionViewCell()
    }
  }

  func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
    
  }
  
  func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return 718
  }
  
  func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
    return 1
  }
  
  func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
    return CGSizeMake(105, 105)
  }
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }
  
  @IBAction func startMusic(sender: UIButton!) {
    if musicPlayer.playing {
      musicPlayer.stop()
      sender.alpha = 0.2
    } else {
      musicPlayer.play()
      sender.alpha = 1.0
    }
  }
  


}

