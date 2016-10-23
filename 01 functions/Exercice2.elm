module Main exposing (..)

import Html
import String


upperLongStrings : Int -> String -> String
upperLongStrings maxLength text =
    if String.length text > maxLength then
        String.toUpper text
    else
        text


stringLeng : String -> String
stringLeng text =
    text ++ " - name length: " ++ toString (String.length text)


main : Html.Html msg
main =
    upperLongStrings 3 "Abraham Alcaina"
        |> stringLeng
        |> Html.text
