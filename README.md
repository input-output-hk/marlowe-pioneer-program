# Marlowe Pioneer Program

## Code examples

- [`simple-payment-pay`](code/src/lecture03/simple-payment-pay.hs): Simple payment using `Pay`.
- [`simple-payment-close`](code/src/lecture03/simple-payment-close.hs): Simple payment using `Close`.
- [`choice-if`](code/src/lecture03/choice-if.hs): Using `Choice` and `If`.
- [`choice-if-let`](code/src/lecture03/choice-if-let.hs): Using `Choice`, `If` and `Let`.
- [`double-pay`](code/src/lecture04/double-pay.hs): Sample solution for homework from Lecture 3.
- [`double-pay-refactored`](code/src/lecture04/double-pay-refactored.hs): Refactored sample solution for homework from Lecture 3.
- [`multi-pay`](code/src/lecture04/multi-pay.hs): Payments by an arbitrary number of "givers".

## Building, running and working with the code examples

- Change directory to the `code` folder: `cd code`.
- To build all examples, do `cabal build`. This will take a while the first time you do it!
- To run an individual example, use `cabal run`. For example: `cabal run simple-payment-pay`.
- To interact with an individual example in the Repl, use `cabal repl`. For example: `cabal repl exe:simple-payment-pay`.
