pragma solidity ^0.8.10;
// SPDX-License-Identifier: MIT
import "@openzeppelin/contracts/token/ERC1155/ERC1155.sol";
interface Documents_interface{
    function viewKey() external view returns(string memory);
} 

contract Documents is ERC1155 {
    uint256 public constant Doc = 0;
    string private EncryptionKEY;
    //launch contract
    constructor(string memory _EncryptionKEY, string memory URI) public ERC1155(URI) {
        EncryptionKEY = _EncryptionKEY;
        _mint(msg.sender, Doc, 1, "");
    }
    //only NFT holder can access the functions
    modifier onlyOwner{
        require(balanceOf(msg.sender,0) == 1,"You must be holder of the token to view it");
        _;
    }
    //view EncryptionKey
    function viewKey() public view onlyOwner returns(string memory){
        return EncryptionKEY;
    }
}