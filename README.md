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

## Optmisation steps:

1. Refactor:

`addToWhitelist`

Error codes:

255' = Gas Contract - addToWhitelist function - tier level should not be greater than 255

911' = Contract hacked, imposible, call help

Improved -26,030 gas until here.

11' = Gas Contract - Transfer function - Sender has insufficient Balance

12' = Gas Contract - Transfer function - The recipient name is too long, there is a max length of 8 characters

13' = Gas Contract - Transfer function - The recipient name is too long, there is a max length of 8 characters

14' = Gas Contract - Update Payment function - Amount must be greater than 0

15' = Gas Contract - Update Payment function - Administrator must have a valid non zero address

16' = Gas Contract - whiteTransfers function - Sender has insufficient Balance

17' = Gas Contract - whiteTransfers function - amount to send have to be bigger than 3

Improved -124,346 on the block above, total -150,376 gas until here.
