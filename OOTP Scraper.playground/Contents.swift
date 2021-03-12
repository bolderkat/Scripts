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
    var teamResults = game.components(separatedBy: #"<img src="../images/team_logos/"#)
    teamResults.removeFirst()
    for result in teamResults {
        if let teamIndex = result.index(of: "_16") {
            let subString = result[..<teamIndex]
            let teamString = String(subString)
            
            // R, H, and E values lie between these HTML tags
            let resultStartIndexes = result.endIndices(of: #"<span style="color:#F6EF7D;">"#)
            let resultEndIndexes = result.indices(of: "</span></td>")
            
            let runs = result[resultStartIndexes[0]...resultEndIndexes[0]].dropLast()
            let hits = result[resultStartIndexes[1]...resultEndIndexes[1]].dropLast()
            let errors = result[resultStartIndexes[2]...resultEndIndexes[2]].dropLast()
            if let team = Team(rawValue: teamString) {
                print("\(team) --- Runs: \(runs), hits: \(hits), Errors: \(errors)")
                
            }
        }
    }
    
}








