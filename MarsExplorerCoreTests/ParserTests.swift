//
//  ParserTests.swift
//  MarsExplorerCoreTests
//
//  Created by Marc Monguió Pellicer on 07/04/2019.
//  Copyright © 2019 Marc M P. All rights reserved.
//

import XCTest
@testable import MarsExplorerCore

class ParserTests: XCTestCase {

    var data: String!

    override func setUp() {
        super.setUp()
        data = """
                5 6
                1 2 N
                L M L M L M L M M M M M M M M M M M M M M M M M M M M
                3 3 E
                M M R M M R M R R
                """
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        data = nil
    }

    func testInitialization() {
        let parser = Parser(data: data)

        XCTAssertNotNil(parser)
        XCTAssertEqual(parser.data, data)
    }

   func testParse() {
        let parser = Parser(data: data)
        var plateau = Plateau(size: Size(width: 0, height: 0))
        var roverSquad: [Rover] = []

        parser.parse(plateau: &plateau, roverSquad: &roverSquad)

        XCTAssertEqual(plateau.size.width, 5)
        XCTAssertEqual(plateau.size.height, 6)
        XCTAssertEqual(roverSquad.count, 2)
        XCTAssertEqual(roverSquad[0].position.posX, 1)
        XCTAssertEqual(roverSquad[0].position.posY, 2)
        XCTAssertEqual(roverSquad[0].position.orientation, "N")
        XCTAssertEqual(roverSquad[0].instructions, Array("L M L M L M L M M M M M M M M M M M M M M M M M M M M"))
        XCTAssertEqual(roverSquad[1].position.posX, 3)
        XCTAssertEqual(roverSquad[1].position.posY, 3)
        XCTAssertEqual(roverSquad[1].position.orientation, "E")
        XCTAssertEqual(roverSquad[1].instructions, Array("M M R M M R M R R"))
   }
}
