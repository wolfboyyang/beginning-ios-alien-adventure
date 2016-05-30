//
//  ShuffleStrings.swift
//  Alien Adventure
//
//  Created by Jarrod Parkes on 9/30/15.
//  Copyright © 2015 Udacity. All rights reserved.
//

extension Hero {
    
    func shuffleStrings(s1 s1: String, s2: String, shuffle: String) -> Bool {
        if s1 == "" && s2 == "" && shuffle == "" {
            return true
        }
        if s1.characters.count + s2.characters.count == shuffle.characters.count {
            var s1Checked = false
            var s2Checked = false
            var s1Index = s1.startIndex
            var s2Index = s2.startIndex
            var char1 = s1[s1Index]
            var char2 = s2[s2Index]
            for char in shuffle.characters {
                if !s1Checked && char == char1 {
                    s1Index = s1Index.successor();
                    if s1Index == s1.endIndex {
                        s1Checked = true
                    }
                    else {
                        char1 = s1[s1Index]
                    }
                }
                else if !s2Checked && char == char2 {
                    s2Index = s2Index.successor();
                    if s2Index == s2.endIndex {
                        s2Checked = true
                    }
                    else {
                        char2 = s2[s2Index]
                    }
                }
            }
            if s1Checked && s2Checked {
                return true
            }
        }
        return false
    }
}
