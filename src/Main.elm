module Main exposing (main)

import Element as E exposing (centerX, centerY, el, height, row, text)
import Element.Border
import Element.Input as EI exposing (labelHidden, placeholder)
import Html exposing (Html)


main =
    E.layout [] <|
        nav


navHeight =
    E.height <| E.px 80


navPadding =
    E.paddingXY 10 0


nav =
    row
        [ navHeight
        , E.width E.fill
        , navPadding
        , Element.Border.solid
        , Element.Border.widthEach { bottom = 1, left = 0, right = 0, top = 0 }
        ]
        [ logo
        , searchBar
        , menu
        ]


logo =
    el [ E.alignLeft ] <|
        E.image
            [ navHeight ]
            { src = "https://placekitten.com/200/300"
            , description = "Logo"
            }


menu =
    el
        [ E.below
            (E.column []
                [ E.text "123"
                , E.text "345"
                , E.text "6578"
                ]
            )
        ]
    <|
        text "Menu"


type Msg
    = SearchChanged String


searchBar =
    el [ centerX ] <|
        EI.text []
            { label = labelHidden "search bar"
            , text = ""
            , onChange = SearchChanged

            -- , placeholder = Nothing
            , placeholder = Just (EI.placeholder [] <| text "Search ")
            }
