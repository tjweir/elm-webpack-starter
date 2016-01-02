import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing ( onClick )

-- official 'Elm Architecture' package
-- https://github.com/evancz/start-app
import StartApp.Simple as StartApp

-- component import example
import Components.Hello exposing ( hello )


-- APP KICK OFF!
main : Signal Html
main =
  StartApp.start { model = model, view = view, update = update }


-- MODEL
model : number
model = 0

-- VIEW
-- Examples of:
-- 1)  an externally defined component ('hello', takes 'model' as arg)
-- 2a) styling through CSS classes (external stylesheet)
-- 2b) styling using inlne style attribute (two variants)
view : Signal.Address Action -> Int -> Html
view address model =
  div
    [ class "mt-palette-accent", style styles.wrapper ]
    [
      hello model,
      p [ style [( "color", "#FFF")] ] [ text ( "Elm Webpack Starter" ) ],
      button [ class "mt-button-sm", onClick address Increment ] [ text "FTW" ],
      button [ class "mt-button-sm", onClick address Decrement ] [ text "FTL" ]
    ]


-- UPDATE
type Action = Increment | Decrement

update : Action -> number -> number
update action model =
  case action of
    Increment -> model + 1
    Decrement -> model - 1


-- CSS STYLES
styles : { wrapper : List ( String, String ) }
styles =
  {
    wrapper =
      [
        ( "padding-top", "10px" ),
        ( "padding-bottom", "20px" ),
        ( "text-align", "center" )
      ]
  }
