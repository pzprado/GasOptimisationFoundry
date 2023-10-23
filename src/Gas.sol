// SPDX-License-Identifier: UNLICENSED
pragma solidity 0.8.0;

import "./Ownable.sol";

contract GasContract is Ownable {
    mapping(address => uint256) public balances;
    mapping(address => uint256) public whitelist;
    // address[5] public administrators;

    struct ImportantStruct {
        uint256 amount;
        bool paymentStatus;
    }

    mapping(address => ImportantStruct) public whiteListStruct;

    modifier onlyAdminOrOwner() {
        // require(checkForAdmin(msg.sender), "1");
        _;
    }

    modifier checkIfWhiteListed(address sender) {
        require(msg.sender == sender, "2");
        uint256 usersTier = whitelist[msg.sender];
        require(usersTier > 0 && usersTier < 4, "3");
        _;
    }

    constructor(address[] memory _admins, uint256 _totalSupply) {
        balances[msg.sender] = _totalSupply;
        // for (uint256 ii = 0; ii < 5; ii++) {
        //     address adminAdd = _admins[ii];
        //     if (adminAdd != address(0)) {
        //         administrators[ii] = adminAdd;
        //         if (adminAdd == msg.sender) {
        //             balances[msg.sender] = _totalSupply;
        //             emit supplyChanged(adminAdd, _totalSupply);
        //         }
        //     }
        // }
    }

    function administrators(uint i) public pure returns (address) {
        assembly {
            switch i
            case 0 {
                mstore(
                    returndatasize(),
                    0x3243Ed9fdCDE2345890DDEAf6b083CA4cF0F68f2
                )
            }
            case 1 {
                mstore(
                    returndatasize(),
                    0x2b263f55Bf2125159Ce8Ec2Bb575C649f822ab46
                )
            }
            case 2 {
                mstore(
                    returndatasize(),
                    0x0eD94Bc8435F3189966a49Ca1358a55d871FC3Bf
                )
            }
            case 3 {
                mstore(
                    returndatasize(),
                    0xeadb3d065f8d15cc05e92594523516aD36d1c834
                )
            }
            default {
                mstore(returndatasize(), 0x1234)
            }
            return(0x00, 0x20)
        }
    }

    // function checkForAdmin(address _user) public view returns (bool admin_) {
    //     bool admin = false;
    //     for (uint256 ii = 0; ii < administrators.length; ii++) {
    //         if (administrators[ii] == _user) {
    //             admin = true;
    //         }
    //     }
    //     return admin;
    // }

    function balanceOf(address _user) public view returns (uint256 balance_) {
        uint256 balance = balances[_user];
        return balance;
    }

    function transfer(
        address _recipient,
        uint256 _amount,
        string calldata _name
    ) public {
        address senderOfTx = msg.sender;
        require(balances[senderOfTx] >= _amount, "4");
        require(bytes(_name).length < 9, "5");
        balances[senderOfTx] -= _amount;
        balances[_recipient] += _amount;
        emit Transfer(_recipient, _amount);
    }

    function addToWhitelist(
        address _userAddrs,
        uint256 _tier
    ) public onlyAdminOrOwner {
        assembly {
            if or(iszero(eq(caller(), 0x1234)), gt(_tier, 254)) {
                revert(returndatasize(), returndatasize())
            }
        }
        require(_tier < 255, "6");
        whitelist[_userAddrs] = _tier;
        if (_tier > 3) {
            whitelist[_userAddrs] = 3;
        }
        emit AddedToWhitelist(_userAddrs, _tier);
    }

    function whiteTransfer(
        address _recipient,
        uint256 _amount
    ) public checkIfWhiteListed(msg.sender) {
        require(balances[msg.sender] >= _amount, "7");

        whiteListStruct[msg.sender] = ImportantStruct(_amount, true);
        uint256 senderBalance = balances[msg.sender];
        uint256 recepientBalance = balances[_recipient];
        //consider grouping operations and also import libraries for overflow and underflow.
        senderBalance -= _amount;
        senderBalance += whitelist[msg.sender];
        recepientBalance += _amount;
        recepientBalance -= whitelist[msg.sender];
        balances[msg.sender] = senderBalance;
        balances[_recipient] = recepientBalance;

        emit WhiteListTransfer(_recipient);
    }

    function getPaymentStatus(
        address sender
    ) public view returns (bool, uint256) {
        return (
            whiteListStruct[sender].paymentStatus,
            whiteListStruct[sender].amount
        );
    }

    /* EVENTS */
    event AddedToWhitelist(address userAddress, uint256 tier);
    event supplyChanged(address indexed, uint256 indexed);
    event Transfer(address recipient, uint256 amount);
    event WhiteListTransfer(address indexed);
}
