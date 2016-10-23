module Main exposing (..)

import Html
import String
import List


countWords : String -> Int
countWords =
    String.words >> List.length


main : Html.Html msg
main =
    countWords "hola ke ase, mercadona o k ase"
        |> toString
        |> Html.text
