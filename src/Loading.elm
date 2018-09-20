module Loading exposing
    ( Config
    , LoaderType(..)
    , LoadingState(..)
    , defaultConfig
    , render
    )

{-|


# Config

@docs Config


# Loader types

You can choose one of these loaders:

@docs LoaderType


# Loading states

The loaders will be rendered according on the LoadingState. If you pass `Loading.On` loader will be displayed, if `Loading.Off` loader will be hidden (will not be hidden by css, only node will be removed).

@docs LoadingState


# Default config

@docs defaultConfig


# Render loader

`Loading.render` takes 3 arguments: `LoaderType`, `Config`, `LoadingState`.

@docs render

-}

import Html exposing (Html, div, text)
import Html.Attributes exposing (class)
import Html.Styled exposing (toUnstyled)
import Loading.Bars as Bars
import Loading.BouncingBalls as BouncingBalls
import Loading.Circle as Circle
import Loading.DoubleBounce as DoubleBounce
import Loading.Sonar as Sonar
import Loading.Spinner as Spinner


type alias Model =
    { config : Config
    , loadingState : LoadingState
    }


{-| -}
type alias Config =
    { size : Float
    , color : String
    , className : String
    , speed : Float
    }


{-| -}
type LoadingState
    = On
    | Off


{-| -}
type LoaderType
    = DoubleBounce
    | Spinner
    | BouncingBalls
    | Bars
    | Circle
    | Sonar


{-| -}
defaultConfig : Config
defaultConfig =
    { size = 30
    , color = "#74b4c9"
    , className = ""
    , speed = 1
    }


{-|

    view : Model -> Html Msg
    view model =
        div []
            [ Loading.render
                DoubleBounce
                { defaultConfig | color = "#333" }
                Loading.On
            ]

-}
render : LoaderType -> Config -> LoadingState -> Html a
render loaderType config loadingState =
    let
        loader =
            case loaderType of
                DoubleBounce ->
                    toUnstyled <| DoubleBounce.view config

                Spinner ->
                    toUnstyled <| Spinner.view config

                BouncingBalls ->
                    toUnstyled <| BouncingBalls.view config

                Bars ->
                    toUnstyled <| Bars.view config

                Circle ->
                    toUnstyled <| Circle.view config

                Sonar ->
                    toUnstyled <| Sonar.view config
    in
    case loadingState of
        On ->
            div [ class "loading" ] [ loader ]

        Off ->
            text " "
