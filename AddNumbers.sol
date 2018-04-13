pragma solidity ^0.4.18;

contract AddNumbers {
    uint public storedValue = 0;

    event ValueChanged(uint newValue); // Event

    function getStoredValue() public view returns (uint _storedValue) {
        _storedValue = storedValue;
    }

    function changeStoredValue(uint num1, uint num2) public {
        storedValue = num1 + num2;
        ValueChanged(storedValue);
    }
}
