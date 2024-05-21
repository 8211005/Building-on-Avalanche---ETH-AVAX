# Module-4-ETH-AVAX

## Description:
DegenToken is a Solidity smart contract that implements a simple ERC20 token called "Degen" (DGN). This token is designed for use within a gaming platform, allowing players to earn, transfer, redeem, and burn tokens for various in-game items and rewards. The contract also includes functionalities for minting new tokens and checking token balances.

## Features:
1. **Minting new tokens:** The owner of the contract can create new tokens and distribute them to players as rewards.
2. **Transferring tokens:** Players can transfer their tokens to others.
3. **Redeeming tokens:** Players can redeem their tokens for items available in the in-game store.
4. **Checking token balance:** Players can check their token balance at any time.
5. **Burning tokens:** Anyone can burn tokens they own that are no longer needed.


## Usage:
1. **Minting Tokens:**
   - Only the owner can mint new tokens using the `mintDGN` function.
2. **Transferring Tokens:**
   - Players can transfer their tokens to others using the `transferDGN` function.
3. **Redeeming Tokens:**
   - Players can redeem their tokens for in-game items by calling the `redeemDGN` function with the item ID as a parameter.
4. **Checking Token Balance:**
   - Players can check their token balance at any time using the `getBalance` function.
5. **Burning Tokens:**
   - Anyone can burn their own tokens using the `burnDGN` function.
