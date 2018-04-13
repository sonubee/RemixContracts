pragma solidity ^0.4.18;

contract GuessMonth {
    //Don't let public read
    uint private month;
    address public creator;

    //full ether
    uint fullEther = 1000000000000000000;
    bytes32 public hint;

    event GuessMade(string correctOrNot); // Event
    event MonthChanged(string textToLog); // Event

    //constructor
    function GuessMonth(uint _month) payable public {
        //verifying full ether sent
        if (msg.value != fullEther)
            revert();

        month = _month;
        creator = msg.sender;
    }

    //this is how we define the modifiers
    modifier onlyOwner() {
        // if a condition is not met then throw an exception
        if (msg.sender != creator) revert();
        // or else just continue executing the function
        _;
    }

    function makeGuess(uint _guessMonth) payable public {
        if (msg.value != fullEther / 10)
            revert();

        if (_guessMonth == month){
            msg.sender.transfer(fullEther);
            emit GuessMade("Correct!");
        } else {
            emit GuessMade("Incorrect!");
        }
    }

    function changeMonth(uint _newMonth) onlyOwner public {
        month = _newMonth;
        emit MonthChanged("Month Changed!");
    }

    function getCreatorAddress() view public returns (address){
        return creator;
    }

    function setHint(bytes32 _hint) public onlyOwner{
        hint = _hint;
    }

    function getHint() public view returns(bytes32 _hint){
        _hint = hint;
    }
}
