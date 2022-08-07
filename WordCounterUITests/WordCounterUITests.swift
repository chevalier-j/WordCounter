//
//  WordCounterUITests.swift
//  WordCounterUITests
//
//  Created by GibertJ on 6/08/22.
//

import XCTest

class WordCounterUITests: XCTestCase {

    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }



    func testLaunchPerformance() throws {
        if #available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 7.0, *) {
            // This measures how long it takes to launch your application.
            measure(metrics: [XCTApplicationLaunchMetric()]) {
                XCUIApplication().launch()
            }
        }
    }
    
    // UI tests must launch the application that they test
    func testInitialStateIsCorrect() {
        // XCUIApplication() grants access to the application's test harness, allowing to query its user interface and perform actions as if it was a user
        let app = XCUIApplication()
        app.launch()
        let table = XCUIApplication().tables
        XCTAssertEqual(table.cells.count, 7, "There should be 7 rows")
    }
    
    func testNavigationBarButtons() {
        // test search, filter and cancel buttons
        let app = XCUIApplication()
        app.launch()
        let searchButton = app.navigationBars["Word Counter"].buttons["Search"]
        searchButton.tap()
        
        let elementsQuery = app.alerts["Filter…"].scrollViews.otherElements
        elementsQuery.buttons["Filter"].tap()
        searchButton.tap()
        elementsQuery.buttons["Cancel"].tap()
        
    }
    
    // ui test recorder filter test is broken
//    func testUserFilteringByString() {
////        app.keys["t"].tap()
////        app.keys["e"].tap()
////        app.keys["s"].tap()
////        app.keys["t"].tap()
//
//        let app = XCUIApplication()
//        app.launch()
//        app.navigationBars["Word Counter"].buttons["Search"].tap()
//
//        let tKey = app/*@START_MENU_TOKEN@*/.keys["t"]/*[[".keyboards.keys[\"t\"]",".keys[\"t\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
//        tKey.tap()
//        tKey.tap()
//
//        let eKey = app/*@START_MENU_TOKEN@*/.keys["e"]/*[[".keyboards.keys[\"e\"]",".keys[\"e\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
//        eKey.tap()
//        eKey.tap()
//
//        let sKey = app/*@START_MENU_TOKEN@*/.keys["s"]/*[[".keyboards.keys[\"s\"]",".keys[\"s\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
//        sKey.tap()
//        sKey.tap()
//        tKey.tap()
//        tKey.tap()
//        app.alerts["Filter…"].scrollViews.otherElements.buttons["Filter"].tap()
//
//
//    }

    
//    func testExample() throws {
//        // UI tests must launch the application that they test.
//        let app = XCUIApplication()
//        app.launch()
//
//        // Use XCTAssert and related functions to verify your tests produce the correct results.
//    }
}
