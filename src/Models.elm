module Models exposing (..)

type alias PlayerId = String
    
type alias Player = {
        id : PlayerId,
        name : String,
        level : Int
            
    }

type alias Model = {
        players: List Player
    }

initialModel : Model
initialModel = {
    players = [ Player "1" "Sam" 1 ]
    }

    

