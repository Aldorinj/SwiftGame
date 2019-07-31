//
//  Teams.swift
//  SwiftGame
//
//  Created by Matthieu CAMUS on 19/01/2019.
//  Copyright © 2019 Matthieu CAMUS. All rights reserved.
//

import Foundation

/* Creation of the Team struct and its properties */
class Team {
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
    
    func createTeams() {
        
        /* Creation of each team */
        print("Let's get started, create the two teams which will compete")
        game = Game(team1: createNewTeam(number: 1), team2: createNewTeam(number: 2))
        
        /* Creation of character of the team n°1 */
        print("\(game.team1.playerName), I'm pretty sure you can set up the best team let's figure it out")
        for personnageNumber in 1...3 {
            game.team1.personages.append(createNewPersonage(number: personnageNumber, inGame: game))
        }
        
        /* Creation of character of the team n°2 */
        print("\(game.team2.playerName), use your advantage wisely, you can counter him")
        for personnageNumber in 1...3 {
            game.team2.personages.append(createNewPersonage(number: personnageNumber, inGame: game))
        }
        
        print("Now that the teams are set up, you're only goal is to defeat the ennemy team, good luck")
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
                case "2":
                    personageChoised = personages[indexOfPossiblesChoices[1]]
                    validAnswer = true
                case "3":
                    personageChoised = personages[indexOfPossiblesChoices[2]]
                    validAnswer = true
                default:
                    print("You do not have that much character")
                    validAnswer = false
                }
            }
        } while !validAnswer
        
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
    


/* Fonction which allows to create teams */
func createNewTeam(number: Int) -> Team {
    var playerNameChoosed = ""
    repeat {
        print("Choose the name of the team n°\(number)")
        if let choice = readLine() {
            playerNameChoosed = choice
        }
    } while playerNameChoosed.isEmpty
    let team = Team(number: number, personages: [CharacterC](), playerName: playerNameChoosed)
    return team
}
}
