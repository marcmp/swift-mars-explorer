//
//  Rover.swift
//  MarsExplorer
//
//  Created by Marc M P on 04/04/2019.
//  Copyright © 2019 Marc M P. All rights reserved.
//

import Foundation

class Rover {
    var position: Position
    var plateau: Plateau
    var instructions: [Character]

    init(position: Position, plateau: Plateau, instructions: [Character]) {
        self.position = Position(posX: position.posX,
                                 posY: position.posY,
                                 orientation: position.orientation)
        self.plateau = plateau
        self.instructions = instructions
    }

    func performInstructions() {
        for instruction in self.instructions {
            switch instruction {
            case "L":
                turnLeft()
            case "R":
                turnRight()
            case "M":
                moveForward()
            default:
                break
            }
        }
    }

    private func turnLeft() {
        switch position.orientation {
        case "N":
            self.position.orientation = "W"
        case "S":
            self.position.orientation  = "E"
        case "E":
            self.position.orientation  = "N"
        case "W":
            self.position.orientation  = "S"
        default:
            break
        }
    }

    private func turnRight() {
        switch position.orientation {
        case "N":
            self.position.orientation = "E"
        case "S":
            self.position.orientation = "W"
        case "E":
            self.position.orientation = "S"
        case "W":
            self.position.orientation = "N"
        default:
            break
        }
    }

    private func moveForward() {
        if isMoveForwardPossible() == true {
            switch position.orientation {
            case "N":
                self.position.posY += 1
            case "S":
                self.position.posY -= 1
            case "E":
                self.position.posX += 1
            case "W":
                self.position.posX -= 1
            default:
                break
            }
        }
    }

    // checks if next move is out of bounds
    private func isMoveForwardPossible() -> Bool {
        var isPossible = false

        switch position.orientation {
        case "N":
            isPossible = (self.position.posY < plateau.size.height)
        case "S":
            isPossible = (self.position.posY > 0)
        case "E":
            isPossible = (self.position.posX < plateau.size.width)
        case "W":
            isPossible = (self.position.posX > 0)
        default:
            break
        }
        return isPossible
    }
}
