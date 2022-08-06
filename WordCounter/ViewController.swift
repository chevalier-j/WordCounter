//
//  ViewController.swift
//  WordCounter
//
//  Created by GibertJ on 6/08/22.
//

import UIKit

class ViewController: UITableViewController {

    var wordData = WordData()

    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return wordData.allWords.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)

        let word = wordData.allWords[indexPath.row]
        cell.textLabel!.text = word
        return cell
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
}

