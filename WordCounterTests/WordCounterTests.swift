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
        let wordData = WordData()
        XCTAssertEqual(wordData.allWords.count, 0, "allWords must be 0")
    }
    
    
    
    
    
    
    
    
    
    
    
    
//    override func setUpWithError() throws {
//        // Put setup code here. This method is called before the invocation of each test method in the class.
//    }
//
//    override func tearDownWithError() throws {
//        // Put teardown code here. This method is called after the invocation of each test method in the class.
//    }



}
