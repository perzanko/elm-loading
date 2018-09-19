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
            , height (px <| config.size * 0.95)
            , position relative
            , margin2 (px 0) auto
            ]

        childStyle =
            [ property "border" <| String.fromFloat (config.size * 0.17) ++ "px " ++ "rgba(" ++ config.color ++ ", 0.25) solid"
            , property "border-top" <| String.fromFloat (config.size * 0.17) ++ "px " ++ "rgba(" ++ config.color ++ ", 0.8) solid"
            , borderRadius (pct 50)
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
            [ css childStyle ]
            []
        ]
