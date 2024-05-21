
// SPDX-License-Identifier: MIT
/*
1. Minting new tokens: The platform should be able to create new tokens and distribute them to players as rewards. Only the owner can mint tokens.
2. Transferring tokens: Players should be able to transfer their tokens to others.
3. Redeeming tokens: Players should be able to redeem their tokens for items in the in-game store.
4. Checking token balance: Players should be able to check their token balance at any time.
5. Burning tokens: Anyone should be able to burn tokens, that they own, that are no longer needed.
*/
pragma solidity ^0.8.20;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract DGNToken is ERC20, Ownable {
  // Event for token minting
  event TokensMinted(address indexed receiver, uint256 amount);

  // Define item IDs and their corresponding prices
  enum Item {
    TUMBLER,
    STICKERS,
    DEGEN_BALLPEN,
    DEGEN_BAG,
    CAP
  }
  mapping(Item => uint256) public itemPrices;

  constructor() ERC20("Degen", "DGN") Ownable(msg.sender) 
  {
    // Mint initial supply to the contract deployer
    _mint(msg.sender, 25000 * 1**decimals());

       // Set item prices
    itemPrices[Item.TUMBLER] = 500;
    itemPrices[Item.STICKERS] = 200;
    itemPrices[Item.DEGEN_BALLPEN] = 150;
    itemPrices[Item.DEGEN_BAG] = 1000;
    itemPrices[Item.CAP] = 750;

  }
  // Function to mint new tokens, only callable by the owner
  function mint(address _to, uint256 _amount) public onlyOwner {
    _mint(_to, _amount);
    emit TokensMinted(_to, _amount);
  }

  // Function to transfer tokens
  function transferTokens(address _to, uint256 _amount) public {
    _transfer(msg.sender, _to, _amount);
  }

  // Function to redeem tokens for in-game items
  function redeemTokens(Item _item) public {
    uint256 itemPrice = itemPrices[_item];
    require(balanceOf(msg.sender) >= itemPrice, "Insufficient balance");

    // Perform actions for redeeming the item (e.g., mint a unique NFT for the item)
    // This functionality can be implemented based on your specific game requirements

    // Burn tokens for the redeemed item
    _burn(msg.sender, itemPrice);
  }

  // Function to check token balance
  function checkTokenBalance(address _player) public view returns (uint256) {
    return balanceOf(_player);
  }

  // Function to burn tokens
  function burnTokens(uint256 _amount) public {
    require(balanceOf(msg.sender) >= _amount, "Insufficient balance");
    _burn(msg.sender, _amount);
  }
}
