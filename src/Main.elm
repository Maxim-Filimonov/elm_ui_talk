module Main exposing (main)

import Element exposing (..)
import Html exposing (Html)


main =
    Element.layout [] <|
        el [ centerX, centerY ] (text "Hello World")
