//
//  MarvelComicUITests.swift
//  MarvelComicUITests
//
//  Created by Shukre Ahmed on 5/11/22.
//

import XCTest

class MarvelComicUITests: XCTestCase {

    func test_should_check_marvel_comic_is_displayed() {
        let app = XCUIApplication()
        app.launch()
        
        let addReadNowButton = app.buttons["read_now_button"]
        let markAsReadButton = app.buttons["mark_as_read_button"]
        let addToLibraryButton = app.buttons["add_to_library_button"]
        let readOfflineButton = app.buttons["read_offline_button"]
        let comicImage = app.images["comic_image"]
        let comicTitle = app.staticTexts["comic_title"]
        let comicDescription = app.staticTexts["comic_description"]
        
        XCTAssert(addReadNowButton.waitForExistence(timeout: 0.3))
        XCTAssert(markAsReadButton.waitForExistence(timeout: 0.3))
        XCTAssert(addToLibraryButton.waitForExistence(timeout: 0.3))
        XCTAssert(readOfflineButton.waitForExistence(timeout: 0.3))
        XCTAssert(comicImage.waitForExistence(timeout: 0.3))
        XCTAssert(comicTitle.waitForExistence(timeout: 0.3))
        XCTAssert(comicDescription.waitForExistence(timeout: 0.3))
    }
}
