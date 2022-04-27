//SPDX-License-Identifier: MIT

pragma solidity 0.8.9;



contract Donation is Ownable {
    uint256 totalDonations;
    event Donated(address indexed _us, uint256 _amount);
    event MoneyReceived(address indexed _from, uint256 _amount);

    function isOwner() internal view returns (bool) {
        return owner() == msg.sender;
    }

    function withdrawMoney(address payable _to, uint256 _amount)
        public
        onlyOwner
    {
        _to.transfer(_amount);
    }

    function donate(address payable _to, uint256 _amount) public payable {
        _to.transfer(_amount);
    }

    function getTotalDonations() public view returns (uint256) {
        return totalDonations;
    }

    receive() external payable {
        emit MoneyReceived(msg.sender, msg.value);
    }
}
