module Models exposing (..)


type alias Party =
    { name : String
    , href : String
    }


type alias Model =
    { parties : List Party
    , filter : Maybe String
    }


initialModel : Model
initialModel =
    { --parties = [ { name = "Foo", href = "http://www.python.org" }, { name = "Bar", href = "http://www.ruby-lang.org" } ]
      parties = []
    , filter = Nothing
    }
