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


# Codes

1 - Gas Contract Only Admin Check: Caller not admin or owner
2 - Gas Contract CheckIfWhiteListed modifier : revert happened because the originator of the transaction was not the sender
3 - Gas Contract CheckIfWhiteListed modifier : revert happened because the user is not whitelisted
4 - Gas Contract - Transfer function - Sender has insufficient Balance
5 - Gas Contract - Transfer function -  The recipient name is too long, there is a max length of 8 characters
6 - Gas Contract - addToWhitelist function -  tier level should not be greater than 255
7 - Gas Contract - whiteTransfers function - Sender has insufficient Balance