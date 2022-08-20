//SPDX-Licence-Identifier: MIT
pragma solidity ^0.8.0;

contract Whitelist {

    uint8 public maxWhitelistedAddresses;

    mapping(address => bool) public whitelistedAddresses;

    uint8 public numAddressesWhitelisted;

    constructor(uint8 _maxWhitelistedAddresses) {
        maxWhitelistedAddresses =  _maxWhitelistedAddresses;
    }

    function addAddressesToWhitelist() public {
        require(!whitelistedAddresses[msg.sender], "Already whitelisted");
        require(numAddressesWhitelisted < maxWhitelistedAddresses, "Reached max limit");
        whitelistedAddresses[msg.sender] = true;
        numAddressesWhitelisted += 1;
    }
}
