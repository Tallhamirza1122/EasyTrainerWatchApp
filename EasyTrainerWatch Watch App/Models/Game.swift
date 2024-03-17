import Foundation

struct Game: Codable {
    var userType: UserType?
    var gameName: String?
    var gameTypes: GameType?
    var set: [Set]?
}

enum GameType: String, Codable, CaseIterable{
    case single
    case double
}

enum UserType: String, Codable {
    case player
    case trainer
}

