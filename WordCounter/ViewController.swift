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
        return wordData.filteredWords.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)

        let word = wordData.filteredWords[indexPath.row]
        cell.textLabel!.text = word
        // replaces "detail" text label in table for word count
        cell.detailTextLabel!.text = "\(wordData.wordCounts.count(for: word))"
        return cell
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // adds right bar button to nav bar, to trigger searchTapped
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .search, target: self, action: #selector(searchTapped))
    }
    
    // alert controller with a text field and Filter and Cancel buttons. Filter button sends user input to applyUserFilter and the table is reloaded
    @objc func searchTapped() {
        
        // if optional returns nil (no text fields), the nill coalesing operator ?? is activated and returns the string "0" instead.  Therefore userInput will always be a string and not String?, it will be something the user entered or "0"
        let ac = UIAlertController(title: "Filter…", message: nil, preferredStyle: .alert)
        ac.addTextField()

        ac.addAction(UIAlertAction(title: "Filter", style: .default) { [unowned self] _ in
            let userInput = ac.textFields?[0].text ?? "0"
            self.wordData.applyUserFilter(userInput)
            self.tableView.reloadData()
        })

        ac.addAction(UIAlertAction(title: "Cancel", style: .cancel))

        present(ac, animated: true)
    } //  searchTapped()
    
    
    
    
}

