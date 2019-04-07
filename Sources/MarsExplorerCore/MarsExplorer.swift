//
//  MarsExplorer.swift
//  MarsExplorerCore
//
//  Created by Marc M P on 06/04/2019.
//  Copyright © 2019 Marc M P. All rights reserved.
//

import Foundation

class MarsExplorer {

    let inputData: String

    init (inputData: String) {
        self.inputData = inputData
    }

    func run() {
        var plateau = Plateau(size: Size(width: 0, height: 0))
        var roverSquad: [Rover] = []
        let parser = Parser(data: inputData)

        parser.parse(plateau: &plateau, roverSquad: &roverSquad)

        runRovers(rovers: roverSquad, plateau: plateau)
        printRoversPosition(rovers: roverSquad)
    }

    private func runRovers(rovers: [Rover], plateau: Plateau) {
        for rover in rovers {
            rover.performInstructions()
        }
    }

    private func printRoversPosition(rovers: [Rover]) {
        for rover in rovers {
            rover.position.log()
        }
    }
}
