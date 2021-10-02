//
//  EpisodesTableViewController.swift
//  Rick and Morty Guide
//
//  Created by Jimenez on 10/1/21.
//

import UIKit

class EpisodesTableViewController: UITableViewController {
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    getEpisode()
  }
  
  func getEpisode() {
    //https://rickandmortyapi.com/api/episode
    
    if let url = URL(string: "https://rickandmortyapi.com/api/episode") {
      var request = URLRequest(url: url)
      request.httpMethod = "GET"
      URLSession.shared.dataTask(with: request) {(data, response, error) in
        if error != nil {
          print("There was an error")
        } else if data != nil {
          print(String(data: data!, encoding: .utf8))
        }
      }.resume()
    }
  }
  
  override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    // #warning Incomplete implementation, return the number of rows
    return 10
  }
  
  override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "episodeCell", for: indexPath)
    
    // Configure the cell...
    cell.textLabel?.text = "Hello"
    return cell
  }
  
  override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    performSegue(withIdentifier: "episode", sender: nil)
  }
}
