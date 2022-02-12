// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.4;

contract Coin {
    /// public variable
    address public minter;
    mapping(address => uint) public balances;

    /// events allow clients to react to contract changes you declared
    event Sent(address from, address to, uint amount);

    /// errors allw you to provide infor about why an operation failed. They are returned to the caller of the function
    error InsufficientBalance(uint requested, uint available);

    /// constructor code is run at contract is created
    constructor() 
    {
        minter = msg.sender;
    }

    /// sends an amount of newly created coins to an address, can only be called by the contract creator at constructor
    function mint(address receiver, uint amount) public 
    {
        require(msg.sender == minter);
        balances[receiver] += amount;
    }

    /// sends an amount of existing coins from any caller to an address
    function send(address receiver, uint amount) public 
    {
        if (amount > balances[msg.sender])
        {
            // revert InsufficientBalance({
            //     requested: amount,
            //     available: balances[msg.sender]
            // });
            revert InsufficientBalance(amount, balances[msg.sender]);
        }

        balances[msg.sender] -= amount;
        balances[receiver] += amount;
        emit Sent(msg.sender, receiver, amount);
    }
}