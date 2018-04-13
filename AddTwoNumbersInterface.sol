pragma solidity ^0.4.18;

contract AddTwoNumbersInterface {
    uint public storedValue;
    function changeStoredValue(uint num1, uint num2) public {}
}

contract AddTwoNumbersCC {
    address addressTwoNumbers;

    function AddTwoNumbersCC(address _addressTwoNumbers) public{
        addressTwoNumbers = _addressTwoNumbers;
    }

    function addTwoNumbersInOtherContract(uint _num1, uint _num2) public {
        AddTwoNumbersInterface cc = AddTwoNumbersInterface(addressTwoNumbers);
        return cc.changeStoredValue(_num1, _num2);
    }

    function getAddedNumbers() public constant returns(uint addedNumbers) {
        AddTwoNumbersInterface cc = AddTwoNumbersInterface(addressTwoNumbers);
        return cc.storedValue();
    }

}
