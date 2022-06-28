{-# LANGUAGE OverloadedStrings #-}

import Language.Marlowe.Extended
import Marlowe.Contracts.Options

-- |Chooser option to buy or sell 1000 Ada for 500 DjedUSD with expiry 2022-06-30 17:30
main :: IO ()
main = print $ pretty $
  chooserOption
    (Role "Buyer")
    (Role "Seller")
    Nothing
    (Token "f4cf384ddd1b1377b08302b17990e9618b62924f5705458c17ee4f7d" "DjedUSD")
    ada
    (Constant 500)
    (Constant 1000)
    (POSIXTime 1656610200) -- 2022-06-30 17:30:00.000000 UTC
    (POSIXTime 1656612000) -- 2022-06-30 18:00:00.000000 UTC

-- |A /Chooser Option/ allows the holder of the option to decide prior to the expiration
-- if the option is a call or put. Strike and expiration date are the same in either case.
chooserOption ::
     Party          -- ^ Buyer
  -> Party          -- ^ Seller
  -> Maybe ChoiceId -- ^ Price feed for the underlying
  -> Token          -- ^ Currency
  -> Token          -- ^ Underlying
  -> Value          -- ^ Strike price (in currency)
  -> Value          -- ^ Amount of underlying tokens per contract
  -> Timeout        -- ^ Maturity
  -> Timeout        -- ^ Settlement date
  -> Contract       -- ^ Chooser Option Contract
chooserOption buyer seller priceFeed currency underlying strike ratio maturity settlement =
  undefined -- TODO
