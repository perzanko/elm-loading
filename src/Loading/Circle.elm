module Loading.Circle exposing (view)

import Css exposing (..)
import Css.Animations exposing (custom, keyframes)
import Html
import Html.Styled exposing (Html, div)
import Html.Styled.Attributes exposing (class, css, href, src)


type alias Config =
    { size : Float
    , color : String
    , className : String
    , speed : Float
    }


view : Config -> Html msg
view config =
    let
        withSpeed x =
            String.fromFloat <| x / config.speed

        outerStyle =
            [ width (px config.size)
            , height (px (config.size * 0.95))
            , position relative
            , margin2 (px 0) auto
            ]

        childStyle =
            [ width (px <| config.size - 2 * (config.size * 0.17))
            , height (px <| config.size - 2 * (config.size * 0.17))
            , borderRadius (pct 50)
            , position absolute
            , top (px 0)
            , left (px 0)
            , property "animation-duration" <| withSpeed 1.33 ++ "s"
            , property "animation-timing-function" "cubic-bezier(.51,.92,.24,1.15)"
            , property "animation-iteration-count" "infinite"
            , animationName <|
                keyframes
                    [ ( 0
                      , [ Css.Animations.property "transform" "translate3d(0,0,0) rotate(0deg)"
                        ]
                      )
                    , ( 100
                      , [ Css.Animations.property "transform" "translate3d(0,0,0) rotate(720deg)"
                        ]
                      )
                    ]
            ]
    in
    div
        [ css outerStyle, class config.className ]
        [ div
            [ css <|
                List.concat
                    [ childStyle
                    , [ property "border" <| String.fromFloat (config.size * 0.17) ++ "px " ++ config.color ++ " solid"
                      , opacity (num 0.25)
                      ]
                    ]
            ]
            []
        , div
            [ css <|
                List.concat
                    [ childStyle
                    , [ property "border" <| String.fromFloat (config.size * 0.17) ++ "px transparent solid"
                      , property "border-top" <| String.fromFloat (config.size * 0.17) ++ "px " ++ config.color ++ " solid"
                      , opacity (num 0.8)
                      ]
                    ]
            ]
            []
        ]
