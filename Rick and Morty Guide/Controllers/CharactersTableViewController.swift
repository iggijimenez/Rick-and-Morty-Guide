//
//  CharactersTableViewController.swift
//  Rick and Morty Guide
//
//  Created by Jimenez on 10/5/21.
//

import UIKit

class CharactersTableViewController: UITableViewController {
  
  override func viewDidLoad() {
    super.viewDidLoad()
  }
  
  override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    // #warning Incomplete implementation, return the number of rows
    return 10
  }
  
  override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "characterCell", for: indexPath)
    
    // Configure the cell...
    
    cell.textLabel?.text = "Hello"
    return cell
  }
  
}
