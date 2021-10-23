//
//  TableViewController.swift
//  Rick and Morty Guide
//
//  Created by Jimenez on 10/1/21.
//

import UIKit

class EpisodeTableViewController: UITableViewController {
    var episodes = [Episode]()
//    @IBOutlet weak var episodeLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        let urlString = "https://rickandmortyapi.com/api/episode"
        
        let url = URL(string: urlString)
        
        guard url != nil else {
            return
        }
        
        let session = URLSession.shared
        
        let dataTask = session.dataTask(with: url!) { data, response, error in
            if error == nil && data != nil {
                
                //parse
                let decoder = JSONDecoder()
                
                do {
                    let characters = try decoder.decode(Characters.self, from: data!)
                    print(characters)
                    print("")
                }
                catch {
                    print("Error in JSON parsing")
                }
                
            }
            
        }
        dataTask.resume()
        
    }
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return episodes.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "episodeCell", for: indexPath) as? EpisodeTableViewCell {

            let episode = episodes[indexPath.row]
            
            //MARK: CALL THIS
            cell.episodeLabel.text = characters
            return cell
        }
        return UITableViewCell()
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "episodeSegue", sender: indexPath)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        switch segue.identifier{
        case "episodeSegue":
            guard var destination = segue.destination as? CharactersTableViewController else {
                fatalError("fatal error something wrong in the storyboard")
            }
            guard let indexPath = sender as? IndexPath else {
                fatalError("sender expecting index path")
            }
            let episode = episodes[indexPath.row]
            destination.currentEpisode = episode
        default:
            break
        }
    }
}
