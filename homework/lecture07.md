# Optional Exercises for Marlowe CLI (Lecture 7)


## Running Marlowe Contracts without Blockchain Transactions

👉 [Transcript of lecture](https://github.com/input-output-hk/marlowe-cardano/blob/mpp-cli-lectures/marlowe-cli/lectures/03-marlowe-cli-abstract.ipynb)

1.  Simulate the escrow contract in Marlowe Playground and compare its simulation output to that of `marlowe-cli`.
2.  Alter the inputs (either the deposit, a choice, or the `--invalid-before`/`--invalid-hereafter` settings) in the above simulation of the escrow contract so that Marlowe rejects the input as being invalid.
3.  Repeat the above simulation of the escrow contract, but have the seller choose to confirm the problem instead of disputing it.
4.  Repeat the above simulation of the escrow contract, but have one of the steps time out because no input is provided before the deadline.
5.  Run a similar simulation using a different contract from `marlowe-cli template --help`, Marlowe Playground, or <https://github.com/input-output-hk/marlowe-cardano/tree/main/marlowe-contracts (Links to an external site.)>.


## Running Marlowe Contracts on the Blockchain

👉 [Transcript of lecture](https://github.com/input-output-hk/marlowe-cardano/blob/mpp-cli-lectures/marlowe-cli/lectures/04-marlowe-cli-concrete.ipynb)

1.  Alter the one or more of the command flags in `marlowe-cli run execute` in the above execution of the escrow contract so that the blockchain rejects the transaction because it fails validation by the Marlowe script. For example, omit including the required role token, sign with the wrong key, submit the transaction outside of the range between `--invalid-before` and `--invalid-hereafter`, or provide insufficient funds.
2.  Repeat the above execution of the escrow contract, but have the seller choose to confirm the problem instead of disputing it.
3.  Run a similar execution using a different contract from `marlowe-cli template --help`, Marlowe Playground, or <https://github.com/input-output-hk/marlowe-cardano/tree/main/marlowe-contracts (Links to an external site.)>.
4.  Draw a eUTxO diagram for a contract you have run with `marlowe-cli`, Marlowe Run, or Marlowe Playground.


## Running Marlowe Contracts with the Marlowe Backend

👉 [Transcript of lecture](https://github.com/input-output-hk/marlowe-cardano/blob/mpp-cli-lectures/marlowe-cli/lectures/05-marlowe-cli-pab.ipynb)

1.  Repeat the Marlowe backend tutorial <https://github.com/input-output-hk/marlowe-cardano/blob/mpp-cli-lectures/marlowe-cli/doc/backend-tutorial.md (Links to an external site.)>.
2.  Run the Marlowe backend tests <https://github.com/input-output-hk/marlowe-cardano/blob/mpp-cli-lectures/marlowe-cli/run-tests.sh (Links to an external site.)>.
