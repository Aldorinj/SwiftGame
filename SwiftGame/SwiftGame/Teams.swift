//
//  Teams.swift
//  SwiftGame
//
//  Created by Matthieu CAMUS on 19/01/2019.
//  Copyright © 2019 Matthieu CAMUS. All rights reserved.
//

import Foundation

/* Creation of the Team struct and its properties */
struct Team {
    var number: Int
    var personages: [CharacterC]
    var playerName: String
    var isOver: Bool {
        var numberOfDeadPersonages = 0
        for perso in personages where perso.isdead {
            numberOfDeadPersonages += 1
        }
        return numberOfDeadPersonages == personages.count
    }
    
/* Initialization des propriétés de la structure "Team" */
    init(number: Int, personages: [CharacterC], playerName: String) {
        self.number = number
        self.personages = personages
        self.playerName = playerName
    }

/* Fonction which allows us to choose a character */
    private func chooseAPersonage() -> CharacterC {
        var personageChoised: CharacterC!
        var validAnswer = true
        repeat {
            var numberOfPossiblesChoices = 0
            var indexOfPossiblesChoices = [Int]()
            for numb in 0...2 where !personages[numb].isdead {
                print("\(numberOfPossiblesChoices + 1). " + personages[numb].makeDescription())
                numberOfPossiblesChoices += 1
                indexOfPossiblesChoices.append(numb)
            }
            if let choice = readLine() {
                switch choice {
                case "1":
                    personageChoised = personages[indexOfPossiblesChoices[0]]
                    validAnswer = true
                case "2" where numberOfPossiblesChoices > 1:
                    personageChoised = personages[indexOfPossiblesChoices[1]]
                    validAnswer = true
                case "3" where numberOfPossiblesChoices > 2:
                    personageChoised = personages[indexOfPossiblesChoices[2]]
                    validAnswer = true
                default:
                    print("You do not have that much character")
                    validAnswer = false
                }
            }
        } while validAnswer
        
        return personageChoised!
    }

/* Fonction which allow us to choose the character we want to use this turn */
    func performAnActionOn(_ otherTeam: Team ) {
        print("\(playerName), choose the personage who will perform an action :\n")
        let fighter1 = chooseAPersonage()
        
/* Fonction which change a character weapon if a random one has appeared */
        let newWeaponFound = hasBoxAppeared()
        if newWeaponFound != nil {
            fighter1.changeWeapon(with: newWeaponFound!)
        }
        
         fighter1.usingWeapon = fighter1.weapon
        
/* Battle */
        if fighter1.character == .mage {
            print("Choose the character you want to heal")
            let fighter2 = chooseAPersonage()
            fighter2.isHealedFor(fighter1.usingWeapon!.damages)
            print("""
                Your healing spell was a success \(fighter2.name) now has \(fighter2.healthPoints) Health points !
                """)
        }
        else if fighter1.character == .berserker {
            print("choose the character you want to attack")
            let fighter2 = otherTeam.chooseAPersonage()
            fighter2.isDamageFor(fighter1.usingWeapon!.damages)
            fighter1.isDamageFor(fighter1.collateralDamage)
            
            print("""
                \(fighter1.name) is attacking \(fighter2.name)
                """)
            
            if fighter2.isdead {
                print("""
                    Oh...  unfortunately, \(fighter2.name) is now wandering within the realm of the dead
                    """)
            } else {
                print("""
                    As the battle ends \(fighter2.name)  now have \(fighter2.healthPoints) Health Points
                    and \(fighter1.name) now have \(fighter1.healthPoints) Health Points
                    """)
            }
        } else {
            print("Choose the character you want to attack")
            let fighter2 = otherTeam.chooseAPersonage()
            fighter2.isDamageFor(fighter1.usingWeapon!.damages)
            print("""
                \(fighter1.name) is attacking \(fighter2.name)
                """)
            
            if fighter2.isdead {
                print("""
                    Oh...  unfortunately, \(fighter2.name) is now wandering within the realm of the dead
                    """)
            } else {
                print("""
                    As the battle ends \(fighter2.name)  now have \(fighter2.healthPoints) Health Points
                    """)
            }
        
        }
    }
    
/* Fonction which define if a random chest has appeared or not */
    private func hasBoxAppeared() -> Weapon? {
        var weaponInBox: Weapon? = nil
        if arc4random_uniform(10) > 5 {
        let randomIndex = Int(arc4random_uniform(UInt32(WeaponL.list.count)))
            weaponInBox = WeaponL.list[randomIndex]
            print("""
                Good job ! You found a brand new \(weaponInBox!.kind) !
                Will you equip it ?
                """)
        }
        return weaponInBox
    }
    
}
