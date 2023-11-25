// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

import {Script} from "forge-std/Script.sol";
import {DevOpsTools} from "lib/foundry-devops/src/DevOpsTools.sol";
import {SimpleNft} from "../src/SimpleNft.sol";

contract MintSimpleNft is Script {
    string public constant PUG_URI =
        "ipfs://bafybeig37ioir76s7mg5oobetncojcm3c3hxasyd4rvid4jqhy4gkaheg4/?filename=0-PUG.json";
    uint256 deployerKey;

    function run() external {
        address mostRecentlyDeployedSimpleNft = DevOpsTools
            .get_most_recent_deployment("SimpleNft", block.chainid);

        mintNftOnContract(mostRecentlyDeployedSimpleNft);
    }

    function mintNftOnContract(address basicNftAddress) public {
        vm.startBroadcast();
        SimpleNft(basicNftAddress).mintNft(PUG_URI);
        vm.stopBroadcast();
    }
}
