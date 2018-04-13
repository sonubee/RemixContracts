pragma solidity ^0.4.18;
contract E {

    uint public x;
    string public message;

    event LogUpdate(uint newXValue);
    event LogUpdateString(string message);

    function set(uint _x) public returns(bool success) {
        x = _x;
        message = "Updated";
        LogUpdateString(message);
        LogUpdate(x);
        return true;
    }

    function get() public view returns(uint){
        return x;
    }

}
