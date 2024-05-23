// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.20;

import {Test, console} from "forge-std/Test.sol";
import {MyNFT} from "../src/MyNFT.sol";

contract MyNFTTest is Test {
    MyNFT instance;
    address owner;
    address recipient;

    function setUp() public {
        instance = new MyNFT();
        owner = address(this);
        recipient = makeAddr("recipient");
    }

    function testSafeMint() public {
        string memory tokenURI = "ipfs://CID";
        instance.safeMint(recipient, tokenURI);
        assertEq(instance.ownerOf(0), recipient);
        assertEq(instance.tokenURI(0), tokenURI);
    }

}
