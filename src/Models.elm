module Models exposing (..)


type alias Party =
    { name : String
    , href : String
    }


type alias Model =
    { parties : List Party
    , filter : Maybe String
    }


maybeFilteredParties : Model -> List Party
maybeFilteredParties model =
    case model.filter of
        Just filterString ->
            List.filter (\x -> String.contains filterString x.name) model.parties

        Nothing ->
            model.parties


initialModel : Model
initialModel =
    { --parties = [ { name = "Foo", href = "http://www.python.org" }, { name = "Bar", href = "http://www.ruby-lang.org" } ]
      parties = []
    , filter = Nothing
    }
