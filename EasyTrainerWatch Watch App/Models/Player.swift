//
//  Players.swift
//  EasyTrainerWatch Watch App
//
//  Created by MacBook Pro on 15/03/2024.
//

import Foundation

struct Player : Codable {
    
    var name : String
    var game : [Game]
    var goodMoves : Int
    var badMoves : Int
}
