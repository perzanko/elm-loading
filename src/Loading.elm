module Loading exposing
    ( Config
    , LoaderType(..)
    , LoadingState(..)
    , Model
    , defaultConfig
    , init
    , show
    )

-- imports

import Html exposing (Html, div, text)
import Html.Attributes exposing (class)
import Html.Styled exposing (toUnstyled)
import Loading.Bars as Bars
import Loading.BouncingBalls as BouncingBalls
import Loading.Circle as Circle
import Loading.DoubleBounce as DoubleBounce
import Loading.Spinner as Spinner


type alias Model =
    { config : Config
    , loadingState : LoadingState
    }


type alias Config =
    { size : Float
    , color : String
    , className : String
    , speed : Float
    }


type LoadingState
    = On
    | Off


type LoaderType
    = DoubleBounce
    | Spinner
    | BouncingBalls
    | Bars
    | Circle


defaultConfig : Config
defaultConfig =
    { size = 30
    , color = "#92cd54"
    , className = ""
    , speed = 1
    }


init : Config -> LoadingState -> Model
init config loadingState =
    { config = config
    , loadingState = loadingState
    }


show : LoaderType -> Model -> Html a
show loaderType model =
    let
        loader =
            case loaderType of
                DoubleBounce ->
                    toUnstyled <| DoubleBounce.view model.config

                Spinner ->
                    toUnstyled <| Spinner.view model.config

                BouncingBalls ->
                    toUnstyled <| BouncingBalls.view model.config

                Bars ->
                    toUnstyled <| Bars.view model.config

                Circle ->
                    toUnstyled <| Circle.view model.config
    in
    case model.loadingState of
        On ->
            div [ class "loading" ] [ loader ]

        Off ->
            text " "
