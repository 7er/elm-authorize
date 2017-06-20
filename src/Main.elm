module Main exposing (..)

import Http
import Json.Decode as Decode
import Html
import Msgs exposing (..)
import Models exposing (Model, Party, initialModel)
import Views


main : Program Never Model Msg
main =
    Html.program
        { init = init
        , update = update
        , view = Views.view
        , subscriptions = always Sub.none
        }


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

        Search ->
            Debug.log "implementer filter her" ( model, Cmd.none )

        UpdateSearch filterString ->
            let
                filter =
                    if (filterString |> String.trim |> String.length) == 0 then
                        Nothing
                    else
                        Just filterString
            in
                ( { model | filter = filter }, Cmd.none )
