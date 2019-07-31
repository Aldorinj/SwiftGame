//
//  Game.swift
//  SwiftGame
//
//  Created by Matthieu CAMUS on 07/01/2019.
//  Copyright © 2019 Matthieu CAMUS. All rights reserved.
//

import Foundation

/* Creation of the Game Class and its properties */

class Game {
    
    var team1: Team
    var team2: Team
    var numberOfTurn = 1
    var isOver: Bool {
        return team1.isOver || team2.isOver
    }
    var winner: Team? {
        return getWinner()
    }
    var listOfNames: [String] {
        return getListOfNames()
    }
    init(team1: Team, team2: Team) {
        self.team1 = team1
        self.team2 = team2
    }
    
   /* Fonction which define the winner of the game */
    private func getWinner() -> Team? {
        if team1.isOver {
            return team2
        } else if team2.isOver {
            return team1
        } else {
            return nil
        }
    }

    /* Fonction which create a list where all names are adds */
    private func getListOfNames() -> [String] {
        var list = [String]()
        for personage in team1.personages {
            list.append(personage.name)
        }
        for personage in team2.personages {
            list.append(personage.name)
        }
        list.append(team1.playerName)
        list.append(team2.playerName)
        return list
    }
    
/* Fonction which add a turn each turn */
    func endTurn() {
        numberOfTurn += 1
    }
    
    
/* Fonction which allows to name a character and which verify if that name is unique or not */
    func chooseAName() -> String {
        var validName = ""
        var validAnswer = false
        repeat {
            if let choice = readLine() {
                if listOfNames.contains(choice) {
                    print("Sorry but this name is already taken, use another !")
                    return chooseAName()
                } else {
                    validName = choice
                    validAnswer = true
                }
            }
        } while validAnswer == false
        return validName
    }
    }

/* Fonciton permettant l'apparition aléatoire du coffre contenant une nouvelle arme*/
 func hasBoxAppeared() -> Weapon? {
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


func gameOver() {
    
   /* Loop which allows the game to run until it has ended*/
  
   while !game.isOver {
        
        if game.numberOfTurn % 2 != 0 {
            game.team1.performAnActionOn(game.team2)
        } else {
            game.team2.performAnActionOn(game.team1)
        }
        game.endTurn()
    }
    
   if game.isOver {
    
    print("""
        And after quite a nice battle the game is now over and of course
        the winner is \(game.winner!.playerName) he won within \(game.numberOfTurn) turns..
        Such a shame for his opponent
        """)

    } }
