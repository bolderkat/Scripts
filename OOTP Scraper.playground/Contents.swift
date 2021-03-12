import Foundation
var htmlString = ""
let localURL = Bundle.main.path(forResource: "SampleHTML", ofType: "html")
let contentData = FileManager.default.contents(atPath: localURL!)
htmlString = String(data: contentData!, encoding: .ascii)!


//let url = URL(string: "http://2020ele.com/game/lgreports/real_time_sim/")
//
//do {
//    htmlString = try String(contentsOf: url!, encoding: .ascii)
//} catch let error {
//    print("Error: \(error)")
//}


var games = htmlString.components(separatedBy: #"<table width="474px" cellspacing="4" cellpadding="0" style="border:1px solid #F1FFFF; background-color:#626E64; margin-bottom:8px;">"#)
games.removeFirst()


let finishedGames = games.filter {$0.contains("FINAL") }
finishedGames.count







struct FinishedGame: Equatable {
    let team1: String
    let team1Runs: Int
    let team1Hits: Int
    let team1Errors: Int
    let team2: String
    let team2Runs: Int
    let team2Hits: Int
    let team2Errors: Int
}


enum Team: String {
    case arizona, atlanta, baltimore, boston, chicagoCubs, chicagoWhiteSox, cincinnati, cleveland, colorado, detroit, houston, kansasCity, losAngelesAngels, losAngelesDodgers, miami, milwaukee, minnesota, newYorkMets, newYorkYankees, oakland, philadelphia, pittsburgh, sanDiego, sanFrancisco, seattle, stLouis, tampaBay, texas, toronto, washington
}
