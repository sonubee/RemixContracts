pragma solidity ^0.4.18;
contract RFIDTruffle {

    uint[2][] rfidRecords;
    uint recordCount;

    function pushRFID(uint timestamp, uint id) external {
        rfidRecords.push([timestamp,id]);
        recordCount++;
    }

    function pushRFID2(uint timestamp, uint id) external returns (uint) {
        rfidRecords.push([timestamp,id]);
        recordCount++;

        return recordCount;
    }

    function getRecordCount() public view returns(uint){
        return recordCount;
    }

    function getRecordNumber(uint _recordNumber) public view returns (uint[2]){

        uint recordNumber = _recordNumber-1;

        uint timestamp = rfidRecords[recordNumber][0];
        uint id = rfidRecords[recordNumber][1];

        uint[2] memory arrayTest;
        arrayTest[0] = timestamp;
        arrayTest[1] = id;

        return arrayTest;
    }
}
