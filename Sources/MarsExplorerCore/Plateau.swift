//
//  Plateau.swift
//  MarsExplorer
//
//  Created by Marc M P on 04/04/2019.
//  Copyright © 2019 Marc M P. All rights reserved.
//

import Foundation

struct Size {
    var width: Int
    var height: Int
}

class Plateau {
    var size: Size

    init(size: Size) {
        self.size = size
    }
}
