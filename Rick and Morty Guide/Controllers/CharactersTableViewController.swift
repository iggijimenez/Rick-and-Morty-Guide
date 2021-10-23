//
//  CharactersTableViewController.swift
//  Rick and Morty Guide
//
//  Created by Jimenez on 10/5/21.
//

import UIKit

class CharactersTableViewController: UITableViewController {
  
  var currentEpisode: Episode!
  var characters: [Character] = []
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    fetchCharacters(urls: currentEpisode.characters.compactMap({URL(string: $0)})) { fetchedCharacters in
      self.characters = fetchedCharacters
      self.tableView.reloadData()
    }
  }
  
  func fetchCharacters(urls: [URL], completion: @escaping ([Character]) -> Void) {
    let dispatchGroup = DispatchGroup()
    var result = Array<Character?>.init(repeating: nil, count: urls.count)
    
    for (index, url) in urls.enumerated() {
      let task = URLSession.shared.dataTask(with: url) { data, response, error in
        dispatchGroup.leave()
        
        guard let data = data else {
          return
        }
        
        let decoder = JSONDecoder()
        guard let character = try? decoder.decode(Character.self, from: data) else {
          return
        }
        
        result[index] = character
      }
      
      dispatchGroup.enter()
      task.resume()
    }
    
    dispatchGroup.notify(queue: .main) {
      let compactMapResult = result.compactMap { $0 }
      completion(compactMapResult)
    }
  }
  
  override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    // #warning Incomplete implementation, return the number of rows
    //    characters.count
    return characters.count
  }
  
  override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "characterCell", for: indexPath)
    
    let character = characters[indexPath.row]
    print(character)
    
    cell.textLabel?.text = character.name
    return cell
  }
  
  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    switch segue.identifier{
    case "nameSegue":
      guard var destination = segue.destination as? NameViewController else {
        fatalError("fatal error something wrong in the storyboard")
      }
      guard let indexPath = sender as? IndexPath else {
        fatalError("sender expecting index path")
      }
    default:
      break
    }
  }
  
}
