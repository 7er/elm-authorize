module Msgs exposing (..)

import Http
import Models exposing (Party)


type Msg
    = PartiesResponse (Result Http.Error (List Party))
    | UpdateSearch String
    | Search
