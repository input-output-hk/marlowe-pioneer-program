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
                (Role "Giver1")
                (Role "Giver1")
                (Token "" "")
                (ConstantParam "Deposit")
            )
            (When
                [Case
                    (Deposit
                        (Role "Giver2")
                        (Role "Giver2")
                        (Token "" "")
                        (ConstantParam "Deposit")
                    )
                    (Pay
                        (Role "Giver1")
                        (Party (Role "Receiver"))
                        (Token "" "")
                        (ConstantParam "Deposit")
                        (Pay
                            (Role "Giver2")
                            (Party (Role "Receiver"))
                            (Token "" "")
                            (ConstantParam "Deposit")
                            Close
                        )
                    )]
                (TimeParam "Deadline")
                Close
            ), Case
            (Deposit
                (Role "Giver2")
                (Role "Giver2")
                (Token "" "")
                (ConstantParam "Deposit")
            )
            (When
                [Case
                    (Deposit
                        (Role "Giver1")
                        (Role "Giver1")
                        (Token "" "")
                        (ConstantParam "Deposit")
                    )
                    (Pay
                        (Role "Giver1")
                        (Party (Role "Receiver"))
                        (Token "" "")
                        (ConstantParam "Deposit")
                        (Pay
                            (Role "Giver2")
                            (Party (Role "Receiver"))
                            (Token "" "")
                            (ConstantParam "Deposit")
                            Close
                        )
                    )]
                (TimeParam "Deadline")
                Close
            )]
        (TimeParam "Deadline")
        Close
