// SPDX-License-Identifier: MIT
pragma solidity  ^0.8.26;

contract HelloWorld {
    string strvar = "Hello World";
    struct Info {
        string phrase;
        uint256 id;
        address addr;
    }

    Info[] infos;

    mapping(uint256 id => Info info) infoMapping;

    function sayhello(uint256 _id) public view returns(string memory) {
        if(infoMapping[_id].addr == address(0x0)){
            return addinfo(strvar);
        } else{
            return addinfo(infoMapping[_id].phrase);
        }
        }
        

    function setHelloWorld(string memory newstring, uint256 _id) public {
        Info memory info = Info (newstring, _id, msg.sender);
        infoMapping[_id]= info;
    }

    function addinfo(string memory helloWorldstr) internal pure returns (string memory){
        return string.concat(helloWorldstr," from Odyssey's contract.");

    }

}
