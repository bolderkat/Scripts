import Foundation

public struct TeamResult: Equatable {
    public let team: Team
    public let runs: Int
    public let hits: Int
    public let errors: Int
    
    public init(team: Team, runs: Int, hits: Int, errors: Int) {
        self.team = team
        self.runs = runs
        self.hits = hits
        self.errors = errors
    }
}

public struct FinishedGame: Equatable {
    public let awayResult: TeamResult
    public let homeResult: TeamResult
    public var winner: Team {
        awayResult.runs > homeResult.runs ? awayResult.team : homeResult.team
    }
    public var loser: Team {
        awayResult.runs < homeResult.runs ? awayResult.team : homeResult.team
    }
    
    public init(awayResult: TeamResult, homeResult: TeamResult) {
        self.awayResult = awayResult
        self.homeResult = homeResult
    }
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
    
    public var name: String {
        self.rawValue.capitalized.replacingOccurrences(of: "_", with: " ")
    }
}

