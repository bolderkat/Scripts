import Foundation

public struct FinishedGame: Equatable {
    let team1: Team
    let team1Runs: Int
    let team1Hits: Int
    let team1Errors: Int
    let team2: Team
    let team2Runs: Int
    let team2Hits: Int
    let team2Errors: Int
}

public enum Team: String {
    case arizona = "arizona_diamondbacks"
    case atlanta = "atlanta_braves"
    case baltimore = "baltimore_orioles"
    case boston = "boston_red_sox"
    case chicagoCubs = "chicago_cubs"
    case chicagoWhiteSox = "chicago_white_sox"
    case cincinnati = "cincinnati_reds"
    case cleveland = "cleveland_indians"
    case colorado = "colorado_rockies"
    case detroit = "detroit_tigers"
    case houston = "houston_astros"
    case kansasCity = "kansas_city_royals"
    case losAngelesAngels = "los_angeles_angels"
    case losAngelesDodgers = "los_angeles_dodgers"
    case miami = "miami_gold_sox"
    case milwaukee = "milwaukee_brewers"
    case minnesota = "minnesota_twins"
    case newYorkMets = "new_york_mets"
    case newYorkYankees = "new_york_yankees"
    case oakland = "oakland_athletics"
    case philadelphia = "philadelphia_phillies"
    case pittsburgh = "pittsburgh_pirates"
    case sanDiego = "san_diego_padres"
    case sanFrancisco = "san_francisco_giants"
    case seattle = "seattle_mariners"
    case stLouis = "st_louis_cardinals"
    case tampaBay = "tampa_bay_rays"
    case texas = "texas_rangers"
    case toronto = "toronto_blue_jays"
    case washington = "washington_nationals"
}

