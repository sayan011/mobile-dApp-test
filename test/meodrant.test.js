const { expect } = require("chai");
const { ethers } = require("hardhat");

describe("Donate", function () {
  it("Should return the new greeting once it's changed", async function () {
    const Donate = await ethers.getContractFactory("Donate");
    const Donate = await Donate.deploy("Hello, world!");
    await Donate.deployed();

    expect(await Donate.greet()).to.equal("Hello, world!");

    const setGreetingTx = await Donate.setGreeting("Hola, mundo!");

    // wait until the transaction is mined
    await setGreetingTx.wait();

    expect(await Donate.greet()).to.equal("Hola, mundo!");
  });
});
