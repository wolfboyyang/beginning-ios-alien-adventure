//
//  MostCommonCharacter.swift
//  Alien Adventure
//
//  Created by Jarrod Parkes on 10/4/15.
//  Copyright © 2015 Udacity. All rights reserved.
//

extension Hero {
    
    func mostCommonCharacter(inventory: [UDItem]) -> Character? {
        
        var characterCountDict = [Character: Int]()
        for item in inventory {
            for character in item.name.characters {
                if let characterCount = characterCountDict[character] {
                    characterCountDict.updateValue(characterCount+1, forKey: character)
                }
                else {
                    characterCountDict[character] = 1
                }
            }
        }
        
        var mostCommonCharaterCount = -1
        var mostCommonCharacter: Character? = nil
        for entry in characterCountDict {
            if entry.1 > mostCommonCharaterCount {
                mostCommonCharaterCount = entry.1
                mostCommonCharacter = entry.0
            }
        }
        
        return mostCommonCharacter
    }
}
