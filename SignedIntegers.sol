pragma solidity ^0.4.18;
//import "./ContractE.sol";
//import "https://github.com/sonubee/MarketMe-Solidity/MarketMe.sol";

contract SignedIntegers {
    uint x = 10;
    uint y = 12;
    uint public zz;
    int public z;
    int public a;
    int public c;
    int public d;
    int public e;
    //uint public f;
    //fixed public f;

    function SignedIntegers() public {
        //z = x - y;
        zz = x - y;
        z = int(x - y);
        a = int(x) - int(y);
        c = 1 - 3;
        d = int(x / y);
        e = int(y / x);
        //f = 5/2;
    }
}
