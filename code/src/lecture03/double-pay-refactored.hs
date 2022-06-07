{-# LANGUAGE OverloadedStrings #-}

import Language.Marlowe.Extended

main :: IO ()
main = printJSON $ contract "Giver1" "Giver2" "Receiver" (ConstantParam "Deposit") (TimeParam "Deadline")

contract :: Party -> Party -> Party -> Value -> Timeout -> Contract
contract giver1 giver2 receiver amount deadline = When
    [deposits giver1 giver2, deposits giver2 giver1]
    deadline
    Close
  where
    pay :: Contract
    pay = Pay
            giver1
            (Party receiver)
            ada
            amount
            (Pay
                giver2
                (Party receiver)
                ada
                amount
                Close
            )

    deposit :: Party -> Action
    deposit p = Deposit p p ada amount

    deposits :: Party -> Party -> Case
    deposits p1 p2 = Case
        (deposit p1)
        (When
            [Case (deposit p2) pay]
            deadline
            Close
        )
