module Main exposing (main)

import Browser
import Element as E exposing (centerX, centerY, el, height, row, text)
import Element.Background
import Element.Border
import Element.Events as Events
import Element.Input as EI
import Html exposing (Html)


type alias Model =
    { toggleMenu : Bool
    , search : String
    }


init : Model
init =
    Model False ""


main =
    Browser.sandbox
        { init = init
        , update = update
        , view = view
        }


type Msg
    = ShowMenu
    | HideMenu
    | SearchChanged String


update : Msg -> Model -> Model
update msg model =
    case msg of
        ShowMenu ->
            { model | toggleMenu = True }

        HideMenu ->
            { model | toggleMenu = False }

        SearchChanged value ->
            { model | search = value }


view model =
    E.layout [] <|
        nav model


navHeight =
    E.height <| E.px 80


navPadding =
    E.paddingXY 10 0


nav model =
    row
        [ navHeight
        , E.width E.fill
        , navPadding
        , Element.Background.color (E.rgb 0 1 0.5)
        , Element.Border.solid
        , Element.Border.widthEach { bottom = 1, left = 0, right = 0, top = 0 }
        ]
        [ el [ E.width (E.fillPortion 1) ] logo
        , el [ E.width (E.fillPortion 3) ] <| searchBar model
        , el [ E.width (E.fillPortion 1) ] <| menu model.toggleMenu
        ]


logo =
    el [] <|
        E.image
            [ navHeight ]
            { src = "https://placekitten.com/200/300"
            , description = "Logo"
            }


menu showSubMenu =
    let
        subMenu =
            if showSubMenu then
                [ E.below
                    (E.column []
                        [ E.text "123"
                        , E.text "345"
                        , E.text "6578"
                        ]
                    )
                ]

            else
                []
    in
    row
        ([ E.alignRight
         , E.spacing 20
         ]
            ++ subMenu
        )
        [ el
            [ Events.onMouseEnter ShowMenu
            , Events.onMouseLeave HideMenu
            ]
          <|
            text "Menu"
        , el [] <| text "Another menu"
        ]


searchBar model =
    el [ E.width (E.px 300), centerX ] <|
        EI.text []
            { label = EI.labelHidden "search bar"
            , text = model.search
            , onChange = SearchChanged

            -- , placeholder = Nothing
            , placeholder = Just (EI.placeholder [] <| text "Search ")
            }
