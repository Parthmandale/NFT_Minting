// SPDX-License-Identifier: MIT

pragma solidity ^0.8.20;

import {SimpleNft} from "../src/SimpleNft.sol";
import {DeploySimpleNft} from "../script/DeploySimpleNft.s.sol";
import {Test, console} from "forge-std/Test.sol";

contract SimpleNftTest is Test {
    DeploySimpleNft public deployer;

    SimpleNft public simpleNft;

    function setUp() public {
        deployer = new DeploySimpleNft();
        simpleNft = deployer.run();
    }
}
