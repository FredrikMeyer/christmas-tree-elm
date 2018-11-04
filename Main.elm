module Main exposing (main)

import Html exposing (text)
import Svg exposing (..)
import Svg.Attributes exposing (..)
import Tuple exposing (first, second)


main : Html.Html msg
main =
    svg
        [ width "400"
        , height "400"
        , viewBox "0 0 400 400"
        ]
        [ Svg.defs []
            [ Svg.linearGradient [ id "mygrad", x1 "0", x2 "0", y1 "0", y2 "1" ]
                [ Svg.stop [ offset "0%", stopColor "green" ] []
                , Svg.stop [ offset "100%" ] []
                ]
            , Svg.linearGradient [ id "base" ]
                [ Svg.stop [ offset "0%", stopColor "brown" ] []
                , Svg.stop [ offset "100%" ] []
                ]
            , Svg.radialGradient [ id "star" ]
                [ Svg.stop [ offset "0%", stopColor "yellow" ] []
                , Svg.stop [ offset "100%", stopColor "orange" ] []
                ]
            ]

        -- BASE
        , Svg.polygon
            [ points <|
                polyPoints
                    [ ( 180, 350 )
                    , ( 220, 350 )
                    , ( 220, 400 )
                    , ( 180, 400 )
                    ]
            , fill "url(#base)"
            , stroke "black"
            ]
            []

        -- GREANERY
        , Svg.polygon
            [ points <|
                polyPoints
                    [ ( 100, 370 )
                    , ( 300, 370 )
                    , ( 250, 300 )
                    , ( 150, 300 )
                    ]
            , fill "url(#mygrad)"
            , stroke "black"
            ]
            []
        , Svg.polygon
            [ points <|
                polyPoints
                    [ ( 120, 330 )
                    , ( 280, 330 )
                    , ( 230, 250 )
                    , ( 170, 250 )
                    ]
            , fill "url(#mygrad)"
            , stroke "black"
            ]
            []
        , Svg.polygon
            [ points <|
                polyPoints
                    [ ( 140, 280 )
                    , ( 260, 280 )
                    , ( 200, 200 )
                    ]
            , fill "url(#mygrad)"
            , stroke "black"
            ]
            []

        -- STAR
        , Svg.polygon
            [ points <|
                polyPoints
                    [ ( 200, 220 ) --bottom
                    , ( 210, 190 )
                    , ( 230, 180 ) -- right
                    , ( 210, 170 )
                    , ( 200, 150 ) -- top
                    , ( 190, 170 )
                    , ( 170, 180 ) -- left
                    , ( 190, 190 )
                    ]
            , fill "url(#star)"
            , stroke "black"
            ]
            []
        ]


pointToString : ( Float, Float ) -> String
pointToString p =
    let
        x =
            String.fromFloat <| first p

        y =
            String.fromFloat <| second p
    in
    x ++ "," ++ y


polyPoints : List ( Float, Float ) -> String
polyPoints l =
    List.map pointToString l |> String.join " "
