// SPDX-License-Identifier: MIT

pragma solidity ^0.8.20;

import {SimpleNft} from "../src/SimpleNft.sol";
import {DeploySimpleNft} from "../script/DeploySimpleNft.s.sol";
import {Test, console} from "forge-std/Test.sol";

contract SimpleNftTest is Test {
    DeploySimpleNft public deployer;
    SimpleNft public simpleNft;

    string constant NFT_NAME = "SimpleNft";
    string constant NFT_SYMOBL = "SNFT";

    address public deployerAddress;

    string public constant NFT_URI =
        "ipfs://bafybeig37ioir76s7mg5oobetncojcm3c3hxasyd4rvid4jqhy4gkaheg4/?filename=0-PUG.json";
    address public constant USER = address(1);

    function setUp() public {
        deployer = new DeploySimpleNft();
        simpleNft = deployer.run();
    }

    function testInitializedCorrectly() public view {
        assert(
            keccak256(abi.encodePacked(simpleNft.name())) ==
                keccak256(abi.encodePacked((NFT_NAME)))
        );

        assert(
            keccak256(abi.encodePacked(simpleNft.symbol())) ==
                keccak256(abi.encodePacked(NFT_SYMOBL))
        );
    }

    function testCanMintAndHaveBalance() public {
        vm.prank(USER);
        simpleNft.mintNft(NFT_URI);

        assert(simpleNft.balanceOf(USER) == 1);
    }

    function testTokenUriIsCorrect() public {
        vm.prank(USER);
        simpleNft.mintNft(NFT_URI); // oth index tokenId minted here

        assert(
            keccak256(abi.encodePacked(simpleNft.tokenURI(0))) ==
                keccak256(abi.encodePacked(NFT_URI))
        );
    }

    //    function testMintWithScript() public {
    //         uint256 startingTokenCount = basicNft.getTokenCounter();
    //         MintBasicNft mintBasicNft = new MintBasicNft();
    //         mintBasicNft.mintNftOnContract(address(basicNft));
    //         assert(basicNft.getTokenCounter() == startingTokenCount + 1);
    //     }
}
