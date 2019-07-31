//
//  Mage.swift
//  SwiftGame
//
//  Created by Matthieu CAMUS on 17/01/2019.
//  Copyright © 2019 Matthieu CAMUS. All rights reserved.
//

import Foundation

/* Creation of the Mage */
class Mage: CharacterC {
    override init(name: String, kind: Character, weapon: Weapon, inGame: Game) {
        super.init(name: name, kind: .mage, weapon: WeaponL.magic, inGame: inGame)
        healthPoints = 50

    }
    static let description = "A being able to control fire to borh heal himself and his mates or to incinerate you"
}
