module Loading.BouncingBalls exposing (view)

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
            , height (px config.size)
            , position relative
            , margin2 (px 0) auto
            , property "display" "flex"
            , justifyContent spaceBetween
            , alignItems center
            ]

        childStyle =
            [ display block
            , width (px <| config.size / 3.5)
            , height (px <| config.size / 3.5)
            , borderRadius (pct 100)
            , backgroundColor <| hex config.color
            , property "animation-duration" (withSpeed 0.6 ++ "s")
            , property "animation-delay" <| withSpeed 0.1 ++ "s"
            , property "animation-timing-function" "linear"
            , property "animation-iteration-count" "infinite"
            , animationName <|
                keyframes
                    [ ( 0
                      , [ Css.Animations.property "transform" "translate3d(0,0,0) translateZ(0) translate(0,0)"
                        ]
                      )
                    , ( 50
                      , [ Css.Animations.property "transform" <| "translate3d(0,0,0) translateZ(0) translate(0," ++ String.fromFloat (config.size / 3.5) ++ "px)"
                        ]
                      )
                    , ( 100
                      , [ Css.Animations.property "transform" "translate3d(0,0,0) translateZ(0) translate(0,0)"
                        ]
                      )
                    ]
            ]
    in
    div
        [ css outerStyle, class config.className ]
        [ div [ css <| childStyle ++ [ property "animation-delay" <| withSpeed 0.1 ++ "s" ] ] []
        , div [ css <| childStyle ++ [ property "animation-delay" <| withSpeed 0.2 ++ "s" ] ] []
        , div [ css <| childStyle ++ [ property "animation-delay" <| withSpeed 0.3 ++ "s" ] ] []
        ]
