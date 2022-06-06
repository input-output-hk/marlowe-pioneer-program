{-# LANGUAGE OverloadedStrings #-}

import Language.Marlowe.Extended

main :: IO ()
main = printJSON $ contract


{- Define a contract, Close is the simplest contract which just ends the contract straight away
-}

contract :: Contract
contract =
    Let
        "amount"
        (ConstantParam "Amount")
        (When
            [Case
                (Deposit
                    (Role "Giver")
                    (Role "Giver")
                    (Token "" "")
                    (UseValue "amount")
                )
                (When
                    [Case
                        (Choice
                            (ChoiceId
                                "Choice"
                                (Role "Chooser")
                            )
                            [Bound 1 2]
                        )
                        (If
                            (ValueEQ
                                (ChoiceValue
                                    (ChoiceId
                                        "Choice"
                                        (Role "Chooser")
                                    ))
                                (Constant 1)
                            )
                            (Pay
                                (Role "Giver")
                                (Account (Role "Receiver1"))
                                (Token "" "")
                                (UseValue "amount")
                                Close
                            )
                            (Pay
                                (Role "Giver")
                                (Account (Role "Receiver2"))
                                (Token "" "")
                                (UseValue "amount")
                                Close
                            )
                        )]
                    (TimeParam "ChoiceDeadline")
                    Close
                )]
            (TimeParam "DepositDeadline")
            Close
        )
