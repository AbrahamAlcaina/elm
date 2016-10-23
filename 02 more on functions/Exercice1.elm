module Main exposing (..)

import Html
import String


(~=) : String -> String -> Bool
(~=) one two =
    let
        firstLetterOne =
            String.slice 0 1 one

        firstLetterTwo =
            String.slice 0 1 two
    in
        firstLetterOne /= firstLetterTwo


divCompare : String -> String -> Html.Html msg
divCompare one two =
    one
        ~= two
        |> toString
        |> Html.text


main : Html.Html msg
main =
    Html.div []
        [ divCompare "hola" "bola"
        , divCompare "hola" "hola"
          -- exercice 2
        , (~=) "hola" "jola" |> toString |> Html.text
        ]
