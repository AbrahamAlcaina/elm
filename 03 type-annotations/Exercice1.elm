module Main exposing (..)

import Html exposing (text)
import List exposing (map)


type alias Fee =
    { name : String
    , qty : Int
    , freeQty : Int
    }


type alias Cart =
    List Fee


cart : Cart
cart =
    [ { name = "Lemon", qty = 1, freeQty = 0 }
    , { name = "Apple", qty = 5, freeQty = 0 }
    , { name = "Pear", qty = 10, freeQty = 0 }
    ]


freeQty : Int -> Int -> Fee -> Fee
freeQty quantity free fee =
    if (fee.qty == quantity) then
        { fee | freeQty = free }
    else
        fee


calcutateFree : Fee -> Fee
calcutateFree =
    freeQty 5 1 >> freeQty 10 3


calculateCart : Cart -> Cart
calculateCart cart =
    map calcutateFree cart


main : Html.Html msg
main =
    calculateCart cart |> toString |> text
