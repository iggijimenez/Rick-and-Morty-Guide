//
//  TableViewController.swift
//  Rick and Morty Guide
//
//  Created by Jimenez on 10/1/21.
//

import UIKit

class EpisodeTableViewController: UITableViewController {
  var episodes = [Episode]()
  
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
    
    if let jsonEpisodes = try? decoder.decode(Episodes.self, from: json) {
      episodes = jsonEpisodes.results
      tableView.reloadData()
    }
  }
  
  override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    // #warning Incomplete implementation, return the number of rows
    return episodes.count
  }
  
  override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "episodeCell", for: indexPath)
    
    let episode = episodes[indexPath.row]
    
    cell.textLabel?.text = episode.name

    
    return cell
  }
}

//extension Data {
//    func parseData(removeString string: String) -> Data? {
//        let dataAsString = String(data: self, encoding: .utf8)
//        let parsedDataString = dataAsString?.replacingOccurrences(of: string, with: "")
//        guard let data = parsedDataString?.data(using: .utf8) else { return nil}
//        return data
//    }
//}
