// SPDX-License-Identifier: MIT
    pragma solidity ^0.8.0;


    contract MintingContract{

    struct Nft {
        string name;
        string symbol;
        uint256 price;
    }

    mapping(uint256 => Nft) public Nfts; 
    mapping(uint256 => address) public tokenOwners;
    
    address public owner;
    uint256 public totalSupply;

    constructor() {
        owner = msg.sender;
        totalSupply = 0;
    }

    
    function mintNft(uint256 _tokenid,string memory _name,string memory _symbol,uint256 _price) public {
        require(msg.sender == owner, "Only owner can mint NFTs");
        require(tokenOwners[_tokenid] == address(0), "Token ID already exists");
        Nfts[_tokenid] = Nft(_name, _symbol, _price);
        tokenOwners[_tokenid] = owner;
        totalSupply += 1;
    }


}
