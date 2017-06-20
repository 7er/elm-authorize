module Views exposing (..)

import Html exposing (Html, div, text, program, button, ul, li, a, input)
import Html.Attributes exposing (href)
import Html.Events exposing (onClick, onInput)
import Models exposing (Party, Model, maybeFilteredParties)
import Msgs exposing (..)


partyToLi : Party -> Html Msg
partyToLi party =
    li []
        [ a [ href party.href ]
            [ text party.name
            ]
        ]


partyList : Model -> Html Msg
partyList model =
    ul [] (List.map partyToLi <| maybeFilteredParties model)


view : Model -> Html Msg
view model =
    div []
        [ input [ onInput UpdateSearch ] []
        , partyList model
        ]
