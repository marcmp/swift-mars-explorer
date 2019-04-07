//
//
//  Position.swift
//  MarsExplorer
//
//  Created by Marc M P on 04/04/2019.
//  Copyright © 2019 Marc M P. All rights reserved.
//

import Foundation

struct Position {
    var posX: Int
    var posY: Int
    var orientation: Character

    func log() {
        print("\(posX) \(posY) \(orientation)")
    }
}
