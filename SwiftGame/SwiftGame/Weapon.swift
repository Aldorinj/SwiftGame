//
//  Weapon.swift
//  SwiftGame
//
//  Created by Matthieu CAMUS on 19/01/2019.
//  Copyright © 2019 Matthieu CAMUS. All rights reserved.
//

import Foundation

/* Creation of Weapon Class and it's properties */
class Weapon {
    var kind: String
    var damages: Int
    var action: ActionType
    enum ActionType {
        case attack, heal
    }

/* Initialization of weapon properties */
    init(kind: String, damages: Int, action: ActionType ) {
        self.kind = kind
        self.damages = damages
        self.action = action
    }
}

/* Creation of all different kind of Weapon */
struct WeaponL {
    static let fistweapon = Weapon(kind: "Fist Weapon", damages: 5, action: .attack)
    static let sword = Weapon(kind: "Sword", damages: 10, action: .attack)
    static let dualwieldingAxe = Weapon(kind: "Dual WIelding Axe", damages: 20, action: .attack)
    static let magic = Weapon(kind: "Magic", damages: 5, action: .heal)
    static let axe = Weapon(kind: "Axe", damages: 25, action: .attack)
    
/* Création of a stray which contain all weapons for the random chest */
    static let list = [WeaponL.fistweapon, WeaponL.sword, WeaponL.dualwieldingAxe, WeaponL.magic]
}
