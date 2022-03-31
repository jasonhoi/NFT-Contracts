// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.8;

interface IMockInterface {
    function getValue() external returns(uint);
}

contract ImmutableAtConstructor {
    uint immutable value;

    event setValue(uint);

    constructor(IMockInterface mockContract) {
        // Sets the immutable variable.
        value = mockContract.getValue();
        // Reads the immutable variable.
        emit setValue(value);
    }
}