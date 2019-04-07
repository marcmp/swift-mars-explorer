//
//  RoverTests.swift
//  UnitTestTests
//
//  Created by Marc Monguió Pellicer on 04/04/2019.
//  Copyright © 2019 Marc M P. All rights reserved.
//

import XCTest
@testable import MarsExplorerCore

class RoverTests: XCTestCase {

    var plateau: Plateau!
    var position: Position!
    var instructions: [Character]!

    override func setUp() {
        super.setUp()
        plateau = Plateau(size: Size(width: 5, height: 5))
        position = Position(posX: 3, posY: 3, orientation: "N")
        instructions = Array("M R M R M R M L M L M L M L M")
    }

    override func tearDown() {
        super.tearDown()
        plateau = nil
        position = nil
        instructions = nil
    }

    func testInitialization() {
        let rover = Rover(position: position, plateau: plateau, instructions: instructions)

        XCTAssertNotNil(rover)
        XCTAssertEqual(rover.position.posX, 3)
        XCTAssertEqual(rover.position.posY, 3)
        XCTAssertEqual(rover.plateau.size.width, 5)
        XCTAssertEqual(rover.plateau.size.height, 5)
        XCTAssertEqual(rover.instructions, instructions)
    }

    func testPerformInstructions() {
        let rover = Rover(position: position, plateau: plateau, instructions: instructions)
        rover.performInstructions()

        XCTAssertEqual(rover.position.posX, 3)
        XCTAssertEqual(rover.position.posY, 3)
        XCTAssertEqual(rover.position.orientation, "W")
    }

    func testMalformedInstructionsShouldBeIgnoredWhenPerforming() {
        instructions = Array("ZML%142MRM")
        let rover = Rover(position: position, plateau: plateau, instructions: instructions)
        rover.performInstructions()

        XCTAssertEqual(rover.position.posX, 2)
        XCTAssertEqual(rover.position.posY, 5)
        XCTAssertEqual(rover.position.orientation, "N")
    }

    func testNotAllowedMoveOutOfPlateau() {
        plateau = Plateau(size: Size(width: 2, height: 2))
        position = Position(posX: 0, posY: 0, orientation: "S")
        instructions = Array("M M R M M R M M M M R M M M M")
        let rover = Rover(position: position, plateau: plateau, instructions: instructions)
        rover.performInstructions()

        XCTAssertEqual(rover.position.posX, 2)
        XCTAssertEqual(rover.position.posY, 2)
        XCTAssertEqual(rover.position.orientation, "E")
    }

    func testShouldMoveIfAlreadyOutOfPlateau() {
        position = Position(posX: 6, posY: 6, orientation: "S")
        instructions = Array("M M R M")
        let rover = Rover(position: position, plateau: plateau, instructions: instructions)
        rover.performInstructions()

        XCTAssertEqual(rover.position.posX, 5)
        XCTAssertEqual(rover.position.posY, 4)
    }
}
