module Main exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)
import Html.App as App
import String


-- model


type alias Model =
    { calories : Int
    , input : String
    , error : Maybe String
    }


initModel : Model
initModel =
    { calories = 0, input = "", error = Nothing }



-- update


type Msg
    = AddCalories
    | Clear
    | Input String


update : Msg -> Model -> Model
update msg model =
    case msg of
        Input val ->
            case String.toInt val of
                Ok input ->
                    { model
                        | calories = input
                        , error = Nothing
                    }

                Err err ->
                    { model
                        | input = ""
                        , error = Just err
                    }

        AddCalories ->
            model

        Clear ->
            initModel



-- view


view : Model -> Html Msg
view model =
    div []
        [ h3 []
            [ text ("Total Calories: " ++ (toString model)) ]
        , button
            [ type' "button"
            , onClick AddCalories
            ]
            [ text "Add" ]
        , button
            [ type' "button"
            , onClick Clear
            ]
            [ text "Clear" ]
        ]


main : Program Never
main =
    App.beginnerProgram
        { model = initModel
        , update = update
        , view = view
        }
