//
//  WordData.swift
//  WordCounter
//
//  Created by GibertJ on 6/08/22.
//

import Foundation

class WordData {
    var allWords = [String]()
    
    // splits a string by any number of characters. Splits on . ? ! " etc.
    init() {
        if let path = Bundle.main.path(forResource: "plays", ofType: "txt") {
            if let plays = try? String(contentsOfFile: path) {
                // might be better off using CharacterSet(charactersIn:) ??? more customisable
                allWords = plays.components(separatedBy: CharacterSet.alphanumerics.inverted)

                // .filter takes a closure as parameter
//                allWords = allWords.filter({ (testString: String) -> Bool in
//                    if testString != "" {
//                        return true
//                    } else {
//                        return false
//                    }
//                })
                
                // "high order function" with shorthand parameter names simplifying above process:
                allWords = allWords.filter { $0 != ""}
                
                
            }
        }
    }
}
