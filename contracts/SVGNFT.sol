pragma solidity ^0.8.10;


import "@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol";
import "base64-sol/base64.sol";

contract SVGNFT is ERC721URIStorage{
    uint256 public tokenCounter;
    event CreatedSVGNFT(uint256 indexed tokenId, string tokenURI);
    constructor() ERC721 ("SVG NFT", "svgNFT"){
        tokenCounter= 0;
    }

    function create(string memory _svg) public{
        _safeMint(msg.sender, tokenCounter);
        string memory imageURI = svgToImageURI(_svg);
        string memory tokenURI = fomatTokenURI(imageURI);
        _setTokenURI(tokenCounter, tokenURI);
        emit CreatedSVGNFT(tokenCounter, tokenURI);
        tokenCounter+= 1;

    }

    function svgToImageURI(string memory _svg) public pure returns(string memory){
        string memory baseURL = "data:image/svg+xml;base64,";
        string memory svgBase64Encoded = Base64.encode(bytes(string(abi.encodePacked(_svg))));
        string memory imageURI = string(abi.encodePacked(baseURL,svgBase64Encoded));
        return imageURI;
    }

    function fomatTokenURI(string memory _imageURI) public pure returns (string memory){
        string memory baseURL = "data:application/json;base64,";
        return string (abi.encodePacked(
            baseURL,
            Base64.encode(
                 bytes(abi.encodePacked(
                    '{"name": "SVG NFT", ',
                    '"description": "An NFT based on SVG!", ',
                    '"attributes":"", ',
                    '"image": "', _imageURI, '"}'
                )
            ))
        ));
    }

}

