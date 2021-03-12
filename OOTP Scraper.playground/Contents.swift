import Foundation

var htmlString = ""
//let localURL = Bundle.main.path(forResource: "SampleHTML", ofType: "html")
//let contentData = FileManager.default.contents(atPath: localURL!)
//htmlString = String(data: contentData!, encoding: .ascii)!


let url = URL(string: "http://2020ele.com/game/lgreports/real_time_sim/")

do {
    htmlString = try String(contentsOf: url!, encoding: .ascii)
} catch let error {
    print("Error: \(error)")
}


var games = htmlString.components(separatedBy: #"<table width="474px" cellspacing="4" cellpadding="0" style="border:1px solid #F1FFFF; background-color:#626E64; margin-bottom:8px;">"#)
games.removeFirst()


let finishedGames = games.filter {$0.contains("FINAL") }

for game in finishedGames {
    var results: [TeamResult] = []
    var teamResultString = game.components(separatedBy: #"<img src="../images/team_logos/"#)
    teamResultString.removeFirst()
    for resultString in teamResultString {
        if let teamIndex = resultString.index(of: "_16") {
            let subString = resultString[..<teamIndex]
            let teamString = String(subString)
            
            // R, H, and E values lie between these HTML tags
            let resultStartIndexes = resultString.endIndices(of: #"<span style="color:#F6EF7D;">"#)
            let resultEndIndexes = resultString.indices(of: "</span></td>")
            
           
            
            if let team = Team(rawValue: teamString),
               let runs = Int(resultString[resultStartIndexes[0]...resultEndIndexes[0]].dropLast()),
               let hits = Int(resultString[resultStartIndexes[1]...resultEndIndexes[1]].dropLast()),
               let errors = Int(resultString[resultStartIndexes[2]...resultEndIndexes[2]].dropLast()) {
                let result = TeamResult(team: team, runs: runs, hits: hits, errors: errors)
                results.append(result)
            }
        }
    }
    let game = FinishedGame(awayResult: results[0], homeResult: results[1])
    print("\(game.winner.name) beat the \(game.loser.name), \(game.awayResult.runs)-\(game.homeResult.runs)\n")
}








