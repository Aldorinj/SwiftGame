//
//  Berserker.swift
//  SwiftGame
//
//  Created by Matthieu CAMUS on 15/02/2019.
//  Copyright © 2019 Matthieu CAMUS. All rights reserved.
//
import Foundation

/* Creation of the Berserker */
class Berserker: CharacterC {
    override init(name: String, kind: Character, weapon: Weapon, inGame: Game) {
        super.init(name: name, kind: .berserker, weapon: WeaponL.axe, inGame: inGame)
        healthPoints = 150
    }
    static let description = "The Berserker is a savage opponent dealing massive amount of damage but quite "
}
