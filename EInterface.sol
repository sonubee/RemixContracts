pragma solidity ^0.4.18;

contract EInterface {
    uint public x;
    function set(uint _x) returns(bool success) {} // undefined function is part of the "Interface".
}

contract F {

    address addressE;

    // E is already deployed.
    // Conveniently pass E's address to F

    function F(address EAddress) public {
        addressE = EAddress;
    }

    function setE(uint num) public returns(bool) {
        // valid ...
        // return addressE.call(bytes4(sha3('set(uint256)')), num);
        EInterface e = EInterface(addressE); // "EInterface" is understood from interface code above.
        return e.set(num);
    }

    function getE() public constant returns(uint E) {
        EInterface e = EInterface(addressE);
        return e.x();  /*  WHAT DO I PUT HERE? */
    }

}
