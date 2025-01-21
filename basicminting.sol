// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract NFTContract {
    address public owner;
    uint256 public totalSupply;
    uint256 private lastTokenId; 

    struct Nft {
        uint256 tokenId;
        string name;
        string symbol;
        uint256 price;
    }

    mapping(address => Nft[]) public ownerToNFTs; 
    mapping(uint256 => address) public tokenOwners; 

    constructor() {
        owner = msg.sender;
        lastTokenId = 0; 
    }

    function mintNft(string memory _name, string memory _symbol, uint256 _price) public {
        require(msg.sender == owner, "Only owner can mint NFTs");

        uint256 newTokenId = ++lastTokenId;

        Nft memory newNft = Nft({
            tokenId: newTokenId,
            name: _name,
            symbol: _symbol,
            price: _price
        });

        ownerToNFTs[owner].push(newNft);
        tokenOwners[newTokenId] = owner;

        totalSupply++;
    }

    function getNFTsByOwner(address _owner) public view returns (Nft[] memory) {
        return ownerToNFTs[_owner];
    }
}
