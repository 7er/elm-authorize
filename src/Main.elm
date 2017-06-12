module Main exposing (..)

import Html exposing (Html, div, text, program, button)
import Html.Events exposing (onClick)

main : Program Never Model Msg
main = Html.program { init = init, update = update, view = view, subscriptions = subscriptions }

type alias Model = String

type alias Msg = Int

init : (Model, Cmd Msg)
init = ("flesk", Cmd.none)

update : Msg -> Model -> (Model, Cmd Msg)       
update msg model =
    ("Blask", Cmd.none)


subscriptions : Model -> Sub Msg
subscriptions model =
    Sub.none

view : Model -> Html Msg
view model =
    div [] [ text model,
            button [onClick 5] [text "Change"] ]
