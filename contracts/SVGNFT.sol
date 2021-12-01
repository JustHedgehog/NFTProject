pragma solidity ^0.8.10;


import "@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol";

contract SVGNFT is ERC721URIStorage{
    constructor() ERC721 ("SVG NFT", "svgNFT"){

    }

    function create(string memory svg) public{
        
    }

}

