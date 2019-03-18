//
//  main.swift
//  SwiftGame
//
//  Created by Matthieu CAMUS on 15/12/2018.
//  Copyright © 2018 Matthieu CAMUS. All rights reserved.
//

import Foundation

/* Creation of the game */
var game: Game

/* Fonction which allows to create teams */
func createNewTeam(number: Int) -> Team {
    var playerNameChoised = ""
    repeat {
        print("Choose the name of the team n°\(number)")
        if let choice = readLine() {
            playerNameChoised = choice
        }
    } while playerNameChoised.isEmpty
    let team = Team(number: number, personages: [CharacterC](), playerName: playerNameChoised)
    return team
}

/* Fonction which allows us to create characters  */
func createNewPersonage(number: Int, inGame: Game) -> CharacterC {
    print("What's the name of your n°\(number) character ?")
    let choosedName = inGame.chooseAName()
    var newPersonageCreated: CharacterC!
    
/* Here we choose the classe of the character we want to create */
    var validAnswer = true
    repeat {
        print("""
            What class do you want it to be ?
            1. \(Fighter.description)
            2. \(Mage.description)
            3. \(Colossus.description)
            4. \(Dwarf.description)
            5. \(Berserker.description)
           """)
        
        if let choice = readLine() {
            switch choice {
            case "1":
                newPersonageCreated = Fighter(name: choosedName, inGame: inGame)
                validAnswer = true
            case "2":
                newPersonageCreated = Mage(name: choosedName, inGame: inGame)
                validAnswer = true
            case "3":
                newPersonageCreated = Colossus(name: choosedName, inGame: inGame)
                validAnswer = true
            case "4":
                newPersonageCreated = Dwarf(name: choosedName, inGame: inGame)
                validAnswer = true
            case "5":
                newPersonageCreated = Berserker(name: choosedName, inGame: inGame)
                validAnswer = true
            default:
                print("There's no hidden class")
                validAnswer = false
            }
        }
    } while !validAnswer
    return newPersonageCreated
}

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

/* Loop which allows the game to run until it has ended*/
while !game.isOver {
    
    if game.numberOfTurn % 2 != 0 {
        game.team1.performAnActionOn(game.team2)
    } else {
        game.team2.performAnActionOn(game.team1)
    }
    game.endTurn()
}
/* Final speach when the game has ended */
print("""
    And after quite a nice battle the game is now over and of course
    the winner is \(game.winner!.playerName) he won within \(game.numberOfTurn) turns..
    Such a shame for his opponent
    """)
