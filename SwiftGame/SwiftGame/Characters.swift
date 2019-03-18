//
//  Character.swift
//  SwiftGame
//
//  Created by Matthieu CAMUS on 19/12/2018.
//  Copyright © 2018 Matthieu CAMUS. All rights reserved.
//

import Foundation

/* Creation of CharacterC Class and it's properties */
class CharacterC {

    var name: String
    var character: Character
    enum Character {
        case fighter, mage, colossus, dwarf, berserker
    }
    var healthPoints = 0
    var weapon: Weapon
    var collateralDamage : Int
    var usingWeapon: Weapon?
    var inGame: Game
    var isdead: Bool {
        return healthPoints <= 0
    }
    
/* creation of healer, damage dealer and berserker kind */
    var charKind: Sort {
        if character == .mage {
            return Sort.healer
        } else if character == .berserker {
            return Sort.berserker
        } else {
        return Sort.damageDealer
    }
    }
    enum Sort {
        case damageDealer, healer, berserker
    }
    
    /* Initialization of properties */
    init(name: String, kind: Character, weapon: Weapon, inGame: Game) {
        self.name = name
        self.character = kind
        self.weapon = weapon
        self.inGame = inGame
        self.collateralDamage = 7
        
    }
    convenience init(name: String, inGame: Game) {
        self.init(name: name, kind: .fighter, weapon: WeaponL.sword, inGame: inGame)
    }
    
    /* Fonction which allows to damage a character */
    func isDamageFor(_ points: Int) {
        healthPoints -= points
    }
    
    /* Fonction which allows to heal a character */
    func isHealedFor(_ points: Int) {
        healthPoints += points
    }
    
    /* Fonction which describe a character before a battle */
    func makeDescription() -> String {
        return "\(name): This character is a \(character) which has \(healthPoints) health points left,"
            + " he wield a \(weapon.kind) which will deal \(weapon.damages) damages "
    }
    
   /* Fonction which allows a character to change his weapon if a random one has appeared */
    func changeWeapon(with newWeapon: Weapon) {
        switch charKind {
        case .damageDealer where newWeapon.action == .heal:
            print("Sorry, but a \(character) can't wield a healing weapon")
        case .healer where newWeapon.action == .attack:
            print("Sorry, but a \(character) can't have an offensive weapon")
        default:
            print("""
                \(name) is wielding a \(weapon.kind) which deals \(weapon.damages) damages.
                Do you want to change it with \(newWeapon.kind) which has \(newWeapon.damages) damages ?
                (y / n)
                """)
            var validAnswer = false
            repeat {
                if let choice = readLine() {
                    switch choice {
                    case "y":
                        weapon = newWeapon
                        print("Fine ! \(name) now wield a \(weapon.kind)")
                        validAnswer = true
                    case "n":
                        print("ok")
                        validAnswer = true
                    default:
                        print("I guess a yes or no isn't that complicated")
                    }
                }
            } while validAnswer == false
        }
    }
}



