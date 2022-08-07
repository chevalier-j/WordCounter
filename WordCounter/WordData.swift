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
    
    // as private, only WordData can write filteredWords, increasing safety by forcing the use of applyUserFilter and applyFilter methods
    private(set) var filteredWords = [String]()

    
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
    
    
    // method that determines if input from user is an int or a string
    func applyUserFilter(_ input: String) {
        if let userNumber = Int(input) {
            // if input parsed as int, creates an array out of words with a count >= that user input
            applyFilter { self.wordCounts.count(for: $0) >= userNumber }
        } else {
            // when input is not int, creates array of words that contain the user input text as a substring
            applyFilter { $0.range(of: input, options: .caseInsensitive) != nil }
        }
    
    } //  applyUserFilter
    
    // method that takes accepts a func as paramenter. Func must be single string parameter and returns true/false depending if it should be added to filteredWords array or not
    func applyFilter(_ filter: (String) -> Bool) {
        filteredWords = allWords.filter(filter)
    }
}
