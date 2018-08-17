//
//  NYTimesMostRecentTests.swift
//  NYTimesMostRecentTests
//
//  Created by Tony Chhabada on 17/08/18.
//  Copyright © 2018 Tony Chhabada. All rights reserved.
//

import XCTest
@testable import NYTimesMostRecent

class NYTimesMostRecentTests: XCTestCase {
    var viewModel:MostRecentViewModel!;
    override func setUp() {
        super.setUp()
         viewModel = MostRecentViewModel()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testNetworkCall() {
        let e = expectation(description: "Network Call")

        viewModel.fetchArticles(completionHandler: { result in
        
            XCTAssertNotNil(result)
            
            e.fulfill()

        })
        
    }
}
