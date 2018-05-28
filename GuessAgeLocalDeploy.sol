pragma solidity ^0.4.18;

contract GuessAgeLocalDeploy {

    uint age;
    //mutliply to send ether (this is 1 ether)
    uint oneEther = 1000000000000000000;
    //creating contract object
    address contractAddress = this;

    //constructor
    constructor (uint _age) payable public {
        //fund with 10 eth
        if (msg.value != oneEther * 10)
            revert();
        age = _age;
    }

    //send your guess here with 5 eth
    function sendGuess (uint _guess) payable public {
        //guess with 5
        if (msg.value != oneEther * 5)
            revert();

        uint _difference;
        uint _returnAmount;

        //ensure positive number for _difference
        if (_guess < age) {
            _difference = age - _guess;
        } else {
            _difference = _guess - age;
        }

        //calculate how much ether to send back
        _returnAmount = 5 - _difference;

        //if correct guess, send 10 ether
        if (_difference == 0) {
            msg.sender.transfer(10 * oneEther);
        //otherwise send the difference back if less than 5
        } else if (_difference <= 5 && _difference > 0) {
            msg.sender.transfer(_returnAmount * oneEther);
        }
    }

    function getContractBalance() public view returns(uint){
        return contractAddress.balance;
    }
}
