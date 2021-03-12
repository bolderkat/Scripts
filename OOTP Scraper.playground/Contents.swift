import Foundation
let url = URL(string: "http://2020ele.com/game/lgreports/real_time_sim/")
var htmlString = ""

do {
    htmlString = try String(contentsOf: url!, encoding: .ascii)
} catch let error {
    print("Error: \(error)")
}
let games = htmlString.components(separatedBy: #"<table width="474px" cellspacing="4" cellpadding="0" style="border:1px solid #F1FFFF; background-color:#626E64; margin-bottom:8px;">"#)

let finishedGames = games.filter {$0.contains("FINAL") }
finishedGames.count
