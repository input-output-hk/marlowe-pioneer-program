{-# LANGUAGE NumericUnderscores #-}
{-# LANGUAGE OverloadedStrings #-}

import Language.Marlowe.Extended
import Marlowe.Contracts.Options

-- |Cliquet option
main :: IO ()
main = print $ pretty $
  cliquetOption
    Call
    (Role "Buyer")
    (Role "Seller")
    Nothing
    (Token "f4cf384ddd1b1377b08302b17990e9618b62924f5705458c17ee4f7d" "DjedUSD")
    ada
    (Constant 1000)
    [ (POSIXTime 1656610200) -- 2022-06-30 17:30:00.000000 UTC
    , (POSIXTime 1659288600) -- 2022-07-31 17:30:00.000000 UTC
    , (POSIXTime 1661967000) -- 2022-08-31 17:30:00.000000 UTC
    ]
    (POSIXTime 600)          -- 10 minutes

-- |A /Cliquet Option/ consists of a series of consecutive options. The options are executed in sequence, the strike price
-- of the next option is always the current price of the underlying. The option type can be either Call or Put.
cliquetOption ::
     OptionType     -- ^ Type of Option
  -> Party          -- ^ Buyer
  -> Party          -- ^ Seller
  -> Maybe ChoiceId -- ^ Price feed for the underlying
  -> Token          -- ^ Currency
  -> Token          -- ^ Underlying
  -> Value          -- ^ Ratio
  -> [Timeout]      -- ^ Maturities
  -> Timeout        -- ^ Settlement delay
  -> Contract       -- ^ Cliquet Option Contract
cliquetOption optionType buyer seller priceFeed currency underlying ratio expiries delay =
  undefined
