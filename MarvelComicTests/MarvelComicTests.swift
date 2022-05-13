//
//  MarvelComicTests.swift
//  MarvelComicTests
//
//  Created by Shukre Ahmed on 5/11/22.
//

import XCTest

class MarvelComicTests: XCTestCase {
    
    func test_marvel_api_md5_hash() {
        let marvelComicService = MarvelComicService()
        let  ts = marvelComicService.generateTimeStamp()
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        let testDate = "2000-01-01 09:09:09"
        
        XCTAssertNotNil(dateFormatter.date(from: testDate))
    }

}
