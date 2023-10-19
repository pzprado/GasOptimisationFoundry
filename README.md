# GAS OPTIMSATION

- Your task is to edit and optimise the Gas.sol contract.
- You cannot edit the tests &
- All the tests must pass.
- You can change the functionality of the contract as long as the tests pass.
- Try to get the gas usage as low as possible.

## To run tests & gas report with verbatim trace

Run: `forge test --gas-report -vvvv`

## To run tests & gas report

Run: `forge test --gas-report`

## To run a specific test

RUN:`forge test --match-test {TESTNAME} -vvvv`
EG: `forge test --match-test test_onlyOwner -vvvv`

# Current cost

A. Unchanged contract:

| src/Gas.sol:GasContract contract |                 |        |        |        |         |
| -------------------------------- | --------------- | ------ | ------ | ------ | ------- |
| Deployment Cost                  | Deployment Size |        |        |        |         |
| 2541445                          | 12630           |        |        |        |         |
| Function Name                    | min             | avg    | median | max    | # calls |
| addToWhitelist                   | 13885           | 51496  | 68064  | 68084  | 7       |
| administrators                   | 2547            | 2547   | 2547   | 2547   | 5       |
| balanceOf                        | 2660            | 2660   | 2660   | 2660   | 3       |
| balances                         | 598             | 1098   | 598    | 2598   | 4       |
| getPaymentStatus                 | 807             | 807    | 807    | 807    | 1       |
| transfer                         | 194526          | 194526 | 194526 | 194526 | 3       |
| whiteTransfer                    | 75937           | 77003  | 77537  | 77537  | 3       |
| whitelist                        | 642             | 642    | 642    | 642    | 2       |
