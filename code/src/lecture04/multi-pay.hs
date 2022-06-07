{-# LANGUAGE OverloadedStrings #-}

import Language.Marlowe.Extended

main :: IO ()
main = printJSON $ contract ["Giver1", "Giver2", "Giver3", "Giver4", "Giver5"] "Receiver" (ConstantParam "Deposit") (TimeParam "Deadline")

contract :: [Party] -> Party -> Value -> Timeout -> Contract
contract givers receiver amount deadline = go givers
  where
    go :: [Party] -> Contract
    go ps = case picks' of
        []    -> payments givers
        _ : _ -> When [Case (deposit q) $ go qs | (q, qs) <- picks'] deadline Close
      where
        picks' :: [(Party, [Party])]
        picks' = picks ps

    deposit :: Party -> Action
    deposit p = Deposit p p ada amount

    payments :: [Party] -> Contract
    payments [] = Close
    payments (q : qs) = Pay q (Party receiver) ada amount $ payments qs

picks :: [a] -> [(a, [a])]
picks [] = []
picks (x : xs) = (x, xs) : [(y, x : ys) | (y, ys) <- picks xs]
