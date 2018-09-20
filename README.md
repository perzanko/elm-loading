# elm-loading

`elm-loading` provides beautiful loaders animated in [elm-css](https://github.com/rtfeldman/elm-css) for your elm application. ✌


![Loaders example](https://raw.githubusercontent.com/perzanko/elm-loading/master/examples/examples.gif =600x)


## Install

```
  elm install perzanko/elm-loading
```


## How to use

`Loading.render` takes 3 arguments: `LoaderType`, `Config`, `LoadingState`.

The loaders will be rendered according on the LoadingState. If you pass `Loading.On` loader will be displayed, if `Loading.Off` loader will be hidden (will not be hidden by css, only node will be removed).

```elm
import Loading
  exposing
      ( LoaderType(..)
      , defaultConfig
      , render
      )

...

view : Model -> Html Msg
view model =
    div [ ]
        [ Loading.render
            DoubleBounce -- LoaderType
            { defaultConfig | color = "#333" } -- Config
            Loading.On -- LoadingState
        ]
```


## Available loaders

You can choose one of these loaders below.

```elm
type LoaderType
    = DoubleBounce
    | Spinner
    | BouncingBalls
    | Bars
    | Circle
    | Sonar
```


## Configure

Loaders could be easliy configured. Only you should do is to extend the `Loading.defaultConfig` when calling `Loading.render`
```elm
{ defaultConfig | color = "#333" }
```

Config model

```elm
type alias Config =
  { size : Float
  , color : String
  , className : String
  , speed : Float
  }
```

The default config:

```elm
defaultConfig : Config
defaultConfig =
    { size = 30
    , color = "#74b4c9"
    , className = ""
    , speed = 1
    }
```