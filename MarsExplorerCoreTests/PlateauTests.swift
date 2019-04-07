//
//  PlateauTests.swift
//  MarsExplorerCoreTests
//
//  Created by Marc Monguió Pellicer on 07/04/2019.
//  Copyright © 2019 Marc M P. All rights reserved.
//

import XCTest
@testable import MarsExplorerCore

class PlateauTests: XCTestCase {

    func testInitialization() {
        let plateau = Plateau(size: Size(width: 60, height: 60))

        XCTAssertNotNil(plateau)
        XCTAssertEqual(plateau.size.width, 60)
        XCTAssertEqual(plateau.size.height, 60)
    }
}
