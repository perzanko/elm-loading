module Loading.Sonar exposing (view)

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
            , before
                [ property "content" "' '"
                , position absolute
                , borderRadius (pct 50)
                , width (px <| config.size / 3)
                , height (px <| config.size / 3)
                , property "top" <| "calc(50% - " ++ (String.fromFloat <| config.size / 6) ++ "px)"
                , property "left" <| "calc(50% - " ++ (String.fromFloat <| config.size / 6) ++ "px)"
                , backgroundColor <| hex config.color
                , property "animation-duration" <| String.fromFloat (3 / config.speed) ++ "s"
                , property "animation-timing-funtion" "linear"
                , property "animation-iteration-count" "infinite"
                , animationName <|
                    keyframes
                        [ ( 0, [ Css.Animations.opacity (num 1) ] )
                        , ( 15
                          , [ Css.Animations.opacity (num 1)
                            , Css.Animations.property "transform" "scale(0.5)"
                            ]
                          )
                        , ( 60
                          , [ Css.Animations.property "transform" "scale(4)"
                            , Css.Animations.opacity (num 0)
                            ]
                          )
                        , ( 90
                          , [ Css.Animations.opacity (num 0)
                            , Css.Animations.property "transform" "scale(3)"
                            ]
                          )
                        , ( 95
                          , [ Css.Animations.opacity (num 1)
                            ]
                          )
                        , ( 100
                          , [ Css.Animations.opacity (num 1)
                            , Css.Animations.property "transform" "scale(1)"
                            ]
                          )
                        ]
                ]
            , after
                [ property "content" "' '"
                , position absolute
                , borderRadius (pct 50)
                , width (px <| config.size / 3)
                , height (px <| config.size / 3)
                , property "top" <| "calc(50% - " ++ (String.fromFloat <| config.size / 6) ++ "px)"
                , property "left" <| "calc(50% - " ++ (String.fromFloat <| config.size / 6) ++ "px)"
                , border3 (px 1) solid <| hex config.color
                , opacity (num 0)
                , property "animation-duration" <| String.fromFloat (3 / config.speed) ++ "s"
                , property "animation-timing-funtion" "linear"
                , property "animation-iteration-count" "infinite"
                , animationName <|
                    keyframes
                        [ ( 0
                          , [ Css.Animations.opacity (num 0)
                            , Css.Animations.property "transform" "scale(1)"
                            ]
                          )
                        , ( 30
                          , [ Css.Animations.opacity (num 0)
                            , Css.Animations.property "transform" "scale(1)"
                            ]
                          )
                        , ( 60
                          , [ Css.Animations.opacity (num 0.3)
                            ]
                          )
                        , ( 90
                          , [ Css.Animations.property "transform" "scale(3)"
                            ]
                          )
                        , ( 100
                          , [ Css.Animations.opacity (num 0)
                            ]
                          )
                        ]
                ]
            ]
    in
    div
        [ css outerStyle, class config.className ]
        []
