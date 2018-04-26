pragma solidity ^0.4.18;
contract Voting {
    
    address creator;

  struct Ballot {
    string question;
    uint possibleAnswers;
  }
  
  Ballot ballot;

  function Voting(string _question, uint _possibleAnswers) public {
    ballot.question = _question;
    ballot.possibleAnswers = _possibleAnswers;
    creator = 
  }
}
