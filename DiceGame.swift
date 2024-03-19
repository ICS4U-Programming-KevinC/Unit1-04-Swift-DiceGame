//
//  DiceGame.swift
//
//  Created by Kevin Csiffary
//  Created on 2024-03-18
//  Version 1.0
//  Copyright (c) 2024 Kevin Csiffary. All rights reserved.
//
//  Change me.

import Foundation

enum InputError: Error {
    case nonNumber
}

// This is the main method.
func main() {
    let quit = false
    var guessCounter = 0

    var randNum = 0

    

    // Tell the user what the program does.
    print("This program is a guessing game, guess until you get the right answer!")
    
    repeat {
        // Increments guess counter
        guessCounter += 1

        // Calculate random number.
        randNum = Int.random(in:1..<7)
        
        // Setup try catch
        do {
            // Get user input.
            print("\nGuess a number between 1 and 6")
            guard let guessString = readLine() else {
                throw InputError.nonNumber
            }


            // Cast the input to an integer.
            guard let guessInt = Int(guessString) else {
                throw InputError.nonNumber
            }
            
            // Checks if the guess is in the range
            if (1 <= guessInt && guessInt <= 6) {
                if randNum == guessInt {
                    print("Congratulations! You guessed correctly. :)")
                    print("It took you \(guessCounter) trie(s) to get it right!")
                    guessCounter = 0
                } else {
                    print("Nope, that's not right! :(")
                }
            } else {
                print("NO guess a number between 1 and 6!")
            }
            
            print("\nWould you like to try again?")
            print("Enter q to quit")
            guard let userQuit = readLine() else {
                throw InputError.nonNumber
            }
            
            if userQuit == "q" {
                break
            }
            
        } catch {
            print("Please enter a proper number!")
            guessCounter -= 1
            continue
        }
    } while !quit
}

// Call the main function
DiceGame.main()
