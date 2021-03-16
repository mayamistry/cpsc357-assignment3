//
//  StorageHandler.swift
//  Assignment3
//
//  Created by Maya Mistry on 3/15/21.
//

import Foundation



class StorageHandler  {
    
    //will need a more complex version of this file so lets do a dictionary
    //MAYBE CREATE A PASSWORD MANAGER OBJECT!!!
    //jk do a dictionary because that would probably be easier with the JSON file
    
    //this will store the data in the default key
    //change the string array to be a dictionary with the password name and actual password
    static func setStorage(input: Dictionary <String, String>) {
        //defaultStorage.set(input, forKey: self.defaultKey)
        writeFile(dict: input)
    }
    
    static func getStorage() -> Dictionary <String, String> {
        //this function willl return an empty dictionary or a full dictionary from file
        var passwordDict = Dictionary <String, String>()
        passwordDict = readFile()
        return passwordDict
    }
    
    static func readFile() -> Dictionary <String, String> {
        var passwordDict = Dictionary <String, String>()
        do {
            let fileURL = try FileManager.default
                .url(for: .applicationSupportDirectory, in: .userDomainMask, appropriateFor: nil, create: false)
                .appendingPathComponent("userPasswords.json")
            let data = try Data(contentsOf: fileURL)
            passwordDict = try JSONSerialization.jsonObject(with: data) as! Dictionary<String, String>
        } catch {
            print(error)
        }
        return passwordDict
    }
    
    
    static func writeFile(dict: Dictionary<String, String>) -> Void {
        do {
            let fileURL = try FileManager.default
                .url(for: .applicationSupportDirectory, in: .userDomainMask, appropriateFor: nil, create: true)
                .appendingPathComponent("mybadpasswords.json")
            try JSONSerialization.data(withJSONObject: dict)
                .write(to: fileURL)
        } catch {
            print(error)
        }
    }
    
    
    static func reverseInput(stringToReverse input: String) -> String {
        //built in function with the String class
        return String(input.reversed())
        //getting casted from array of characters back to string
    }

    //Function used within the scramble function
    static func translateScramble(l: Character, trans: Int) -> Character {
        if let ascii = l.asciiValue {
            var outputInt = ascii
            if (ascii >= 97 && ascii <= 122) {
               outputInt = (((ascii - 97) + UInt8(trans)) % 26) + 97
            } else if (ascii >= 65 && ascii <= 90) {
                outputInt = (((ascii - 65) + UInt8(trans)) % 26) + 65
            }
            //65 -> 65 the char value ->  A
            return Character(UnicodeScalar(outputInt))
        }
        print(l)
        return Character("")
    }

    //Function used within the descramble function
    static func translateDescramble(l: Character, trans: Int) -> Character {
        if let ascii = l.asciiValue {
            var outputInt = ascii
            if (ascii >= 97 && ascii <= 122) {
                let temp = ascii - UInt8(trans)
                if (temp < 97) {
                    outputInt = outputInt + 26
                } else if (temp > 122) {
                    outputInt = outputInt - 26
                }
                outputInt = (((outputInt - 97) - UInt8(trans)) % 26) + 97
            } else if (ascii >= 65 && ascii <= 90) {
                let temp = ascii - UInt8(trans)
                if (temp < 65) {
                    outputInt = outputInt + 26
                } else if (temp > 90) {
                    outputInt = outputInt - 26
                }
                outputInt = (((outputInt - 65) - UInt8(trans)) % 26) + 65
            }
            //65 -> 65 the char value ->  A
            return Character(UnicodeScalar(outputInt))
            
        }
        return Character("")
    }

    //Encryption function
    static func scramblePassword(password: String) -> String {
        var scrambled = ""
        let shift = password.count
        
        for letter in password {
            scrambled += String(translateScramble(l: letter, trans: shift))
        }
        return scrambled
    }

    //Decryption function *** NEEDS TO BE FIGURED OUT !!!!!!!
    static func descramblePassword(password: String) -> String {
        var unscrambled = ""
        let shift = password.count
        for letter in password {
            unscrambled += String(translateDescramble(l: letter, trans: shift))
        }
        return unscrambled
    }
    
    //get master password here to compare in master view
    static func getMasterPass(input: Dictionary <String, String>) -> String {
        //if dictionary is empty, then user needs to create a master pass
        let masterPass = ""
        
        return masterPass
    }
    
//    func addSinglePassword (key1: String, dict: Dictionary<String, String>) -> Dictionary <String, String> {
//        var dict1 = dict
//        let password = Ask.AskQuestion(questionText: "Enter a password that you want to add for this key: ", acceptableReplies: [String]()) //any response is fine
//        let passphrase = Ask.AskQuestion(questionText: "Enter your passphrase: ", acceptableReplies: [String]()) //any response is fine
//        let together = password + passphrase
//        let reverse = reverseInput(stringToReverse: together)
//        let scrambled = scramblePassword(password: reverse)
//        dict1[key1] = scrambled
//        print("Password added successfully!")
//        return dict1
//    }
}
