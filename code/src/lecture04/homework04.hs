{-# LANGUAGE OverloadedStrings #-}

import Language.Marlowe.Extended

main :: IO ()
main = printJSON $ contract "Bank" "Client" 5 50 (TimeParam "Bank Deadline") (TimeParam "Deposits Deadline")

contract :: Party -> Party -> Int -> Int -> Timeout -> Timeout -> Contract
contract bank client count amount bankDeadline clientDeadline = Close
