//SPDX-License-Identifier:MIT
pragma solidity ^0.8.11;

contract DomEtherWallet {   
    address payable public owner;

    constructor()  {
        owner = payable(msg.sender);
    }

    receive() external payable{}

    function withdraw(uint _amount) external {
        require(msg.sender == owner, "warning!!!, private keys dont match,withdrawal halted");
        payable(msg.sender).transfer(_amount);

    } 

    function getBalance() external view returns (uint) {
        return address(this).balance;
    }
}