//
//  Dwarf.swift
//  SwiftGame
//
//  Created by Matthieu CAMUS on 17/01/2019.
//  Copyright © 2019 Matthieu CAMUS. All rights reserved.
//

import Foundation

/* Creation of the Dwarf */
    class Dwarf: CharacterC {
    override init(name: String, kind: Character, weapon: Weapon, inGame: Game) {
        super.init(name: name, kind: .dwarf, weapon: WeaponL.dualwieldingAxe, inGame: inGame)
        healthPoints = 150
    }
    static let description = "A fierce adversary who will crush you with his axes if you're not aware"
}
