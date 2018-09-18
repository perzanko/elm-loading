module Loading.Spinner exposing (view)

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
        childs =
            List.range 1 12

        outerStyle =
            [ width (px config.size)
            , height (px config.size)
            , position relative
            , margin2 (px 0) auto
            ]

        childStyle =
            [ width (pct 100)
            , height (pct 100)
            ]

        calcAnimationDelay x =
            if x == 1 then
                "0s"

            else
                String.fromFloat -((1.1 - (toFloat x / 10)) / config.speed) ++ "s"
    in
    div
        [ css outerStyle, class config.className ]
        [ div
            [ css [] ]
            (childs
                |> List.map
                    (\x ->
                        div
                            [ css
                                [ width (pct 100)
                                , height (pct 100)
                                , position absolute
                                , left (px 0)
                                , top (px 0)
                                , property "transform" ("rotate(" ++ String.fromInt (30 * x - 30) ++ "deg)")
                                , before
                                    [ property "animation-delay" (calcAnimationDelay x)
                                    , property "content" "' '"
                                    , display block
                                    , margin2 (px 0) auto
                                    , width (pct 15)
                                    , height (pct 15)
                                    , backgroundColor <| hex config.color
                                    , borderRadius (pct 100)
                                    , property "animation-duration" (String.fromFloat (1.2 / config.speed) ++ "s")
                                    , property "animation-iteration-count" "infinite"
                                    , property "animation-fill-mode" "both"
                                    , animationName <|
                                        keyframes
                                            [ ( 0, [ Css.Animations.property "transform" "scale(0.0)" ] )
                                            , ( 40, [ Css.Animations.property "transform" "scale(1.0)" ] )
                                            , ( 80, [ Css.Animations.property "transform" "scale(0.0)" ] )
                                            , ( 100, [ Css.Animations.property "transform" "scale(0.0)" ] )
                                            ]
                                    ]
                                ]
                            ]
                            []
                    )
            )
        ]
