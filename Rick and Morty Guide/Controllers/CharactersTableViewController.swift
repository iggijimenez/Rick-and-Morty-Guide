//
//  CharactersTableViewController.swift
//  Rick and Morty Guide
//
//  Created by Jimenez on 10/5/21.
//

import UIKit

class CharactersTableViewController: UITableViewController {
  var characters = [Character]()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    let urlString = "https://rickandmortyapi.com/api/episode"
    
    if let url = URL(string: urlString) {
      if let data = try? Data(contentsOf: url) {
        parse(json: data)
      }
    }
  }
  
  func parse(json: Data) {
    let decoder = JSONDecoder()
    
    if let jsonEpisodes = try? decoder.decode(Characters.self, from: json) {
      characters = jsonEpisodes.results
      tableView.reloadData()
    }
  }
  
  override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    // #warning Incomplete implementation, return the number of rows
//    characters.count
    return characters.count
  }
  
  override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "characterCell", for: indexPath)
    
    
    //MARK: FIX THIS
    let character = characters[indexPath.row]
    print(character)
    
    let string = character.characters.joined(separator: "")
    
    cell.textLabel?.text = string
    return cell
  }
  
}
