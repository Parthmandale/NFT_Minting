//SPDX-License-Identifier: MIT

pragma solidity ^0.8.20;

import {SimpleNft} from "../src/SimpleNft.sol";
import {Script} from "forge-std/Script.sol";

contract DeploySimpleNft is Script {
    function run() external returns (SimpleNft) {
        vm.startBroadcast();
        SimpleNft simpleNft = new SimpleNft();
        vm.stopBroadcast();
        return simpleNft;
    }
}
