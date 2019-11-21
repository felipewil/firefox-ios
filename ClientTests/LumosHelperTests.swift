//
//  LumosHelperTests.swift
//  ClientTests
//
//  Created by Guiche Virtual on 21/11/19.
//  Copyright © 2019 Mozilla. All rights reserved.
//

import XCTest
@testable import Client

class LumosHelperTests: XCTestCase {

    func testURLForSidebarDefault() {
        // Given
        let someURL = "https://www.someurl.com"
        
        // When
        let lumosURL = LumosHelper.lumosURL(fromSourceURL: someURL, forSidebar: .default)
        
        // Then
        XCTAssertEqual(lumosURL, "https://www.trylumos.com/sidebar/?mode=consumer&src=https://www.someurl.com")
    }
    
    func testURLForSidebarSmall() {
        // Given
        let someURL = "https://www.someurl.com"
        
        // When
        let lumosURL = LumosHelper.lumosURL(fromSourceURL: someURL, forSidebar: .small)
        
        // Then
        XCTAssertEqual(lumosURL, "https://www.trylumos.com/sidebarsmall/?mode=consumer&src=https://www.someurl.com")
    }

}
