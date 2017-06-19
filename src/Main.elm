module Main exposing (..)

import Html exposing (Html, div, text, program, button, ul, li, a)
import Html.Attributes exposing (href)


--import Html.Events exposing (onClick)

import Http
import Json.Decode as Decode
import Models exposing (Model, Party, initialModel)


main : Program Never Model Msg
main =
    Html.program { init = init, update = update, view = view, subscriptions = always Sub.none }


type Msg
    = PartiesResponse (Result Http.Error (List Party))


decodeParties : Decode.Decoder (List Party)
decodeParties =
    Decode.list partyDecoder


partyDecoder : Decode.Decoder Party
partyDecoder =
    Decode.map2 Party (Decode.field "name" Decode.string) (Decode.field "href" Decode.string)


getParties : Cmd Msg
getParties =
    let
        url =
            "http://localhost:4000/parties"

        request =
            Http.get url decodeParties
    in
        Http.send PartiesResponse request


init : ( Model, Cmd Msg )
init =
    ( initialModel, getParties )


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        PartiesResponse (Ok parties) ->
            Debug.log "oppdaterer model" ( { model | parties = parties }, Cmd.none )

        PartiesResponse (Err error) ->
            Debug.log (toString error) ( model, Cmd.none )


partyToLi : Party -> Html Msg
partyToLi party =
    li []
        [ a [ href party.href ]
            [ text party.name
            ]
        ]


partyList : List Party -> Html Msg
partyList parties =
    ul [] (List.map partyToLi parties)


view : Model -> Html Msg
view model =
    div []
        [ partyList model.parties

        --, button [ onClick 5 ] [ text "Change" ]
        ]
