pragma solidity ^0.4.20;

//creates the ballots and then stores the address in a dynamic array
//currently hardcoded 3 choices required
contract BallotFactory {
    address[] newContracts;

    function createContract (string desc, string state, string p1, string p2, string p3) public {
        address newContract = new Ballot(desc, state, p1, p2, p3);
        newContracts.push(newContract);
    }

    function returnAllAddresses () public view returns (address[]) {
        return newContracts;
    }
}

contract Ballot {
    string title;
    string state;
    //3 choices. should put into array instead
    string c1;
    string c2;
    string c3;
    address private owner;
    mapping (address => bool) votedOrNot;
    mapping (string => uint) voteCount;
    //allows voting or not
    bool votingOpen;

    event BallotUpdate(string title,string state, string c1, uint c1voteCount, string c2, uint c2voteCount, string c3, uint c3voteCount, bool votingOpen);
    event DisplayWinner(string title, uint voteCount);

    modifier onlyOwner() {
        // if a condition is not met then throw an exception
        require(msg.sender != owner);
        _;
    }

    //takes in 5 parameters and creates the ballot
    constructor (string _title, string _state, string _c1, string _c2, string _c3) public  {
        title = _title;
        state = _state;
        c1 = _c1;
        c2 = _c2;
        c3 = _c3;
        //only issue here is we have hard coded 3 answers only. need to make dynamic
        voteCount[_c1] = 0;
        voteCount[_c2] = 0;
        voteCount[_c3] = 0;
        //allow voting
        votingOpen = true;
    }

    function vote(string choice) public {
        //revert if voting closed
        require(votingOpen);
        //ensure person has not voted yet
        require(votedOrNot[msg.sender]==false);
        //add the vote
        voteCount[choice]++;
        //person marked as voted=true
        votedOrNot[msg.sender]=true;
    }

    //winner is set to first choice and if a greater value shows up, that becomes winnner
    //definitely not best way to do it, but wokrs for now
    function returnWinner() public {

        //only return winner if voting has been closed
        require(votingOpen == false);

        string memory winner;
        uint totalVotes;

        //set winner to first choice
        totalVotes = voteCount[c1];
        winner = c1;

        //if choice2 > choice1, then winner = choice2
        if (voteCount[c2] > totalVotes){
            totalVotes = voteCount[c2];
            winner = c2;
        }

        //if choice3 > current winner, then winner = choice3
        if (voteCount[c3] > totalVotes){
            totalVotes = voteCount[c3];
            winner = c3;
        }

        //show winner as event
        emit DisplayWinner(winner, totalVotes);
    }

    function endVoting() public onlyOwner {
        votingOpen = false;
    }

    //returns all vote count at current moment
    function getBallotInfo() public {
        emit BallotUpdate(title, state, c1, voteCount[c1], c2, voteCount[c2], c3, voteCount[c3], votingOpen);
    }

}
