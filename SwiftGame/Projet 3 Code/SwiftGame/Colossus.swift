//
//  Colossus.swift
//  SwiftGame
//
//  Created by Matthieu CAMUS on 17/01/2019.
//  Copyright © 2019 Matthieu CAMUS. All rights reserved.
//

import Foundation

/* Creation of the Colossus */
class Colossus: CharacterC {
    override init(name: String, kind: Character, weapon: Weapon, inGame: Game) {
        super.init(name: name, kind: .colossus, weapon: WeaponL.fistweapon, inGame: inGame)
        healthPoints = 200
    }
    static let description = "He is quite resilient but he does not deal much"
}
