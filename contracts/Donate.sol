//SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.0;

import "hardhat/console.sol";

contract Donate{
    uint totalDonations; 
    address payable owner; 
  
    
    constructor() {
      owner = payable(msg.sender); 
    }
  
    //public function to make donate
    function donate() public payable {
      (bool success,) = owner.call{value: msg.value}("");
      require(success, "Failed to send money");
    }
  
    // public function to return total of donations
    function getTotalDonations() view public returns(uint) {
      return totalDonations;
    }
  
}
