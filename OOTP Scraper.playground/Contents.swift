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
        print(result)
        if let index = result.index(of: "_16") {
            let subString = result[..<index]
            let teamString = String(subString)
            let team = Team(rawValue: teamString)!
            print(team)
        }
    }
    
}








