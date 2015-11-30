//
//  Model.swift
//  hangman
//
//  Created by Kasper Peulen on 11/30/15.
//  Copyright © 2015 Kasper Peulen. All rights reserved.
//

import Foundation
import Darwin

class Gameplay {
    var lettersPicked :[String] = []
    
    var revealString: String = ""
    
    var wordToGuess: String = ""
    
    var misses: Int = 0
    
    static let shared = Gameplay()
    
    init() {
        wordToGuess = getRandomWord()
        revealString = calculateRevealString()
    }
    
    func getRandomWord() -> String {
        return "Swift"
    }
    
    func calculateRevealString() -> String {
        var s = ""
        for i in 0..<wordToGuess.length {
            if (lettersPicked.contains(wordToGuess[i])) {
                s += self.wordToGuess[i]
            } else {
                s += "_ "
            }
        }
        return s
    }
    
    func addLetter(letter: String) {
        lettersPicked.append(letter)
        revealString = calculateRevealString()
        if !wordToGuess.containsString(letter) {
            misses += 1
        }
    }
    
}

extension String {
    var length : Int {
        return self.characters.count
    }
    subscript (i: Int) -> Character {
        return self[self.startIndex.advancedBy(i)]
    }
    
    subscript (i: Int) -> String {
        return String(self[i] as Character)
    }
    
    subscript (r: Range<Int>) -> String {
        return substringWithRange(Range(start: startIndex.advancedBy(r.startIndex), end: startIndex.advancedBy(r.endIndex)))
    }
}