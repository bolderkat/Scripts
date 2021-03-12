import Foundation

public struct FinishedGame: Equatable {
    let team1: String
    let team1Runs: Int
    let team1Hits: Int
    let team1Errors: Int
    let team2: String
    let team2Runs: Int
    let team2Hits: Int
    let team2Errors: Int
}
