module Loading.DoubleBounce exposing (view)

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
        outerStyle =
            [ width (px config.size)
            , height (px config.size)
            , position relative
            , margin2 (px 0) auto
            ]

        innerStyle =
            [ width (pct 100)
            , height (pct 100)
            , borderRadius (pct 50)
            , backgroundColor <| hex config.color
            , opacity (num 0.6)
            , position absolute
            , top (px 0)
            , left (px 0)
            , animationName <|
                keyframes
                    [ ( 0, [ Css.Animations.property "transform" "scale(0.0)" ] )
                    , ( 50, [ Css.Animations.property "transform" "scale(1.0)" ] )
                    , ( 100, [ Css.Animations.property "transform" "scale(0.0)" ] )
                    ]
            , property "animation-duration" (String.fromFloat (2 / config.speed) ++ "s")
            , property "animation-timing-function" "ease-in-out"
            , property "animation-iteration-count" "infinite"
            ]
    in
    div
        [ css outerStyle, class config.className ]
        [ div
            [ css innerStyle ]
            []
        , div
            [ css <|
                List.concat
                    [ innerStyle
                    , [ property "animation-delay" ("-" ++ String.fromFloat (1 / config.speed) ++ "s") ]
                    ]
            ]
            []
        ]
