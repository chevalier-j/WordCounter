//
//  WordCounterTests.swift
//  WordCounterTests
//
//  Created by GibertJ on 6/08/22.
//

import XCTest
@testable import WordCounter

class WordCounterTests: XCTestCase {

    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    // tests:
    func testAllWordsLoaded() {
        // this test needs to be updated once functionality to select custom text files is added
        let wordData = WordData()
        XCTAssertEqual(wordData.allWords.count, 18440, "allWords was not 18440, instead was \(wordData.allWords.count)")
    }
    
    func testWordCountsAreCorrect() {
        let wordData = WordData()
        XCTAssertEqual(wordData.wordCounts.count(for: "sweet"), 340, "\"Sweet\" does not appear 340 times")
        XCTAssertEqual(wordData.wordCounts.count(for: "had"), 608, "\"Had\" does not appear 608 times")
        XCTAssertEqual(wordData.wordCounts.count(for: "a"), 6122, "\"A\" does not appear 6122 times")
    }
    
    // tests performance by loading a new WordData object to _ and split up by lines and count the words, 10 times.
    func testWordsLoadQuickly() {
        measure {
            _ = WordData()
        }
    }
    
    
    
    
    
    
    
    
    
    
//    override func setUpWithError() throws {
//        // Put setup code here. This method is called before the invocation of each test method in the class.
//    }
//
//    override func tearDownWithError() throws {
//        // Put teardown code here. This method is called after the invocation of each test method in the class.
//    }



}
