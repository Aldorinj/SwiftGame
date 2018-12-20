//
//  main.swift
//  SwiftGame
//
//  Created by Matthieu CAMUS on 18/12/2018.
//  Copyright © 2018 Matthieu CAMUS. All rights reserved.
//

import Foundation

var nameSet = Set<String>()

// Le joueur 1 choisit son nom
print("Indiquez le nom du joueur 1 :")

if let name = readLine(){
    print("Bienvenue \(name)")
}
// Le joueur 1 choisit ses personnages
func presentMenu() {
    print("Quels personnages veux-tu?"
        + "\n1. Combattant"
        + "\n2. Mage"
        + "\n3. Colosse"
        + "\n4. Nain")
    
    if let charChoice = readLine(){
        switch charChoice {
        case "1":
            print("Vous avez choiis le Combattant")
        case "2":
            print("Vous avez chosis le Mage")
        case "3":
            print("Vous avez choisis le Colosse")
        case "4":
            print("Vous avez choisis le Nain")
        default:
            print("Ce personnage n'exister pas")
        }
        
        // Ici le joueur 1 choisira le nom du personnage qu'il vient de créer
        print("Choisissez le nom du personnage :")
        
        
        if let charName = readLine(){
            if nameSet.contains("\(charName)") {
                print("Ce nom est déjà utilisé")
            }
            else {
                nameSet.insert("\(charName)")
                print("Vous avez crée \(charName)") }
        }}}
        
presentMenu()

       // Ici on demande au programme de lancer la fonction presentmenu() tant qu'il n'y a pas 3 élément dans le set nameSet
        while nameSet.count < 3 {
           presentMenu()
        }
       // Si nameSet contient 3 valeur alors cette phrase va s'afficher
        print("Votre équipe est complète")

    print("Indiquez le nom du joueur 2 :")

if let name2 = readLine(){
    print("Bienvenue \(name2)")
}

// Le joueur 2 choisit ses personnages

    presentMenu()

// Ici on demande au programme de lancer la fonction presentmenu() tant qu'il n'y a pas 3 élément dans le set nameSet
while nameSet.count < 6{
    presentMenu()
}
// Si nameSet contient 3 valeur alors cette phrase va s'afficher
print("Votre équipe est complète")

