{-# LANGUAGE OverloadedStrings #-}

import Language.Marlowe.Extended

main :: IO ()
main = printJSON $ contract


{- Define a contract, Close is the simplest contract which just ends the contract straight away
-}

contract :: Contract
contract =
    When
        [Case
            (Deposit
                (Role "Receiver")
                (Role "Giver")
                (Token "" "")
                (Constant 100000000)
            )
            Close ]
        (TimeParam "Deadline")
        Close
