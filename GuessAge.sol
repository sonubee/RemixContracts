pragma solidity ^0.4.18;

contract GuessAge {

    uint age;
    //mutliply to send ether (this is 1 ether)
    uint oneEther = 1000000000000000000;
    address creator;

    modifier onlyOwner() {
        // if a condition is not met then throw an exception
        if (msg.sender != creator) revert();
        // or else just continue executing the function
        emit Value(msg.value);
        _;
    }

    //All Events
    event GuessDetails(address guesser,uint amount);
    event GuessMade(string correctOrNot);
    event QuestionRead(string read);
    event Value(uint value);

    //constructor
    function GuessAge (uint _age) payable public {
        //fund with 10 eth
        if (msg.value != oneEther * 10)
            revert();
        age = _age;
        creator = msg.sender;
    }

    //adds ether to contract
    function fundContract () onlyOwner payable  external {
        //msg.value;
    }

    //practice pure call - not even reading from blockchain
    function readTheQuestion() public pure returns (string) {
        return "Guess my Age";
    }

    //send your guess here with 5 eth
    function sendGuess (uint _guess) payable public {
        //guess with 5 eth
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
            emit GuessMade("Correct!");
        //otherwise send the difference back if less than 5
        } else if (_difference <= 5 && _difference > 0) {
            msg.sender.transfer(_returnAmount * oneEther);
            emit GuessMade("Incorrect!");
        }

        emit GuessDetails(msg.sender, _guess);
    }

    //returns contact balance
    function getContractBalance() public view returns(uint){
        return address(this).balance;
    }
}
