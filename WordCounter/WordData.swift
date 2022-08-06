//
//  WordData.swift
//  WordCounter
//
//  Created by GibertJ on 6/08/22.
//

import Foundation

class WordData {
    var allWords = [String]()
    // specialised Set that keeps track of how many times an item tried to be added or removed, so it gets rid of duplicates and counts frequency
    var wordCounts = NSCountedSet()
    
    var filteredWords = [String]()

    
    // method that splits a string by any number of characters. Splits on . ? ! " etc.
    init() {
        if let path = Bundle.main.path(forResource: "plays", ofType: "txt") {
            if let words = try? String(contentsOfFile: path) {
                // might be better off using CharacterSet(charactersIn:) ??? more customisable
                allWords = words.components(separatedBy: CharacterSet.alphanumerics.inverted)

                // .filter takes a closure as parameter
//                allWords = allWords.filter({ (testString: String) -> Bool in
//                    if testString != "" {
//                        return true
//                    } else {
//                        return false
//                    }
//                })
                
                // "high order function" with shorthand parameter names simplifying above process:
//                allWords = allWords.filter { $0 != ""}
                
                
//                for word in allWords {
//                    wordCounts[word, default: 0] += 1
//                }
//                // new array from dictionary keys. Removes all duplicate words
//                allWords = Array(wordCounts.keys)

                // creates counted set from all the words: counts and removes duplicates
                //wordCounts = NSCountedSet(array: allWords)
                // update allWords array with de-duplicated results from counted set
                //allWords = wordCounts.allObjects as! [String]
                
                // sorting the array:
                // reformating code above with shorthand. Using a closure to compare first word $0 with second $1. Return true if $0 should sorted before $1, depending on count
                wordCounts = NSCountedSet(array: allWords)
                let sorted = wordCounts.allObjects.sorted { wordCounts.count(for: $0) > wordCounts.count(for: $1) }
                allWords = sorted as! [String]
            }
        }
    }// end init
    
    func applyUserFilter(_ input: String) {
        // find out if string contains integer:
        if let userNumber = Int(input) {
            // create array of words with count >= to the user input, and used when user text input is parsed as int
            filteredWords = allWords.filter { self.wordCounts.count(for: $0) >= userNumber }
        } else {
            // create array of words that contain the user text as substring, to be used when input is not int
            filteredWords = allWords.filter { $0.range(of: input, options: .caseInsensitive) != nil }
        }
        
    }
}
