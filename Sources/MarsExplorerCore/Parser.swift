//
//  Parser.swift
//  MarsExplorer
//
//  Created by Marc M P on 01/04/2019.
//  Copyright © 2019 Marc M P. All rights reserved.
//

import Foundation

class Parser {
    var data: String

    init(data: String) {
        self.data = data
    }

    func parse(plateau: inout Plateau, roverSquad: inout [Rover] ) {

        let lines = data.split(separator: "\n")
        var linesIterator = lines.makeIterator()

        let line0 = linesIterator.next()!
        let size = parseSize(input: String(line0))

        plateau = Plateau(size: size)
        roverSquad = []

        while let line1 = linesIterator.next(), let line2 = linesIterator.next() {
            let position = parsePosition(input: String(line1))!
            let instructions = parseInstructions(input: String(line2))
            let rover = Rover(position: position, plateau: plateau, instructions: instructions)
            roverSquad.append(rover)
        }
    }

    private func parseSize(input: String) -> Size {
        var size = Size(width: 0, height: 0)
        var components = input.components(separatedBy: " ")
        if components.count == 2 {
            let width = Int(String(components[0]))
            let height = Int(String(components[1]))
            size = Size(width: width ?? 0, height: height ?? 0)
        }
        return size
    }

    private func parsePosition(input: String) -> Position? {
        var position = Position(posX: 0, posY: 0, orientation: "N")
        var components = input.components(separatedBy: " ")
        if components.count == 3 {
            let posX = Int(String(components[0]))
            let posY = Int(String(components[1]))
            let orientation = Character(components[2])
            position = Position(posX: posX ?? 0, posY: posY ?? 0, orientation: orientation)
        }
        return position
    }

    private func parseInstructions(input: String) -> [Character] {
        return Array(input)
    }
}
