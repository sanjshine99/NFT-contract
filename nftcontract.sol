// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

import "@openzeppelin/contracts@4.7.3/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts@4.7.3/token/ERC721/extensions/ERC721Enumerable.sol";
import "@openzeppelin/contracts@4.7.3/token/ERC721/extensions/ERC721URIStorage.sol";
//import "@openzeppelin/contracts@4.7.3/access/Ownable.sol";
import "@openzeppelin/contracts@4.7.3/utils/Counters.sol";

contract Sanjshine is ERC721, ERC721Enumerable, ERC721URIStorage{
    using Counters for Counters.Counter;

    Counters.Counter private _tokenIdCounter; // can be use and vissible only inside this smart contract itself
    uint256 MAX_SUPPLY = 10000;

    constructor() ERC721("Sanjshine", "ALCH") {} //constructor - creating, building instance of our smart contract

    function safeMint(address to, string memory uri) public //onlyOwner 
    { //Minting - action of writing a newthing onto the blockchain or creating new entry to the blockchain
    //public -  can be access by anyone and EVERYONE
    //onlyOwner - modifier (if not the owner called the safeMint function will be blocked), if u want the users to mint, so remove ownable
        uint256 tokenId = _tokenIdCounter.current();
        require(tokenId <= MAX_SUPPLY, "I'm sorry max NFTs have been minted.");
        _tokenIdCounter.increment();
        _safeMint(to, tokenId); //will cost some gas
        _setTokenURI(tokenId, uri); // uri contains meta data
    }

    // The following functions are overrides required by Solidity.

    function _beforeTokenTransfer(address from, address to, uint256 tokenId)
        internal
        override(ERC721, ERC721Enumerable)
    {
        super._beforeTokenTransfer(from, to, tokenId);
    }

    function _burn(uint256 tokenId) internal override(ERC721, ERC721URIStorage) {
        super._burn(tokenId);
    }

    function tokenURI(uint256 tokenId)
        public
        view //functions that are nt writing onto the blockchain and potentially when called from your wallet won't cost you any gas
        override(ERC721, ERC721URIStorage)
        returns (string memory)
    {
        return super.tokenURI(tokenId);
    }

    function supportsInterface(bytes4 interfaceId)
        public
        view
        override(ERC721, ERC721Enumerable)
        returns (bool)
    {
        return super.supportsInterface(interfaceId);
    }
}

//URI- Uniform Resource Identifier (URI identifies a resource and differentiates it from others by using a name, location, or both)
