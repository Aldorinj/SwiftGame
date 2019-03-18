//
//  Fighter.swift
//  SwiftGame
//
//  Created by Matthieu CAMUS on 17/01/2019.
//  Copyright © 2019 Matthieu CAMUS. All rights reserved.
//

import Foundation

/* Creation of the Fighter */
class Fighter: CharacterC {
    override init(name: String, kind: Character, weapon: Weapon, inGame: Game) {
        super.init(name: name, kind: .fighter, weapon: WeaponL.sword, inGame: inGame)
        healthPoints = 100
    }
    static let description = "A basic Warrior with crushing skull as only goal"
}
