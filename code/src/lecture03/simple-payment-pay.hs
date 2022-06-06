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
                (Role "Giver")
                (Role "Giver")
                (Token "" "")
                (Constant 100000000)
            )
            (Pay
                (Role "Giver")
                (Party (Role "Receiver"))
                (Token "" "")
                (AvailableMoney
                    (Role "Giver")
                    (Token "" "")
                )
                Close
            )]
        (TimeParam "Deadline")
        Close
