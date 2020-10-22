/*

  Copyright 2020 ZeroEx Intl.

  Licensed under the Apache License, Version 2.0 (the "License");
  you may not use this file except in compliance with the License.
  You may obtain a copy of the License at

    http://www.apache.org/licenses/LICENSE-2.0

  Unless required by applicable law or agreed to in writing, software
  distributed under the License is distributed on an "AS IS" BASIS,
  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
  See the License for the specific language governing permissions and
  limitations under the License.

*/

pragma solidity ^0.6.5;

interface ILiquidityProvider {

    /// @dev Transfers `amount` of the ERC20 `tokenAddress` from `from` to `to`.
    /// @param tokenAddress The address of the ERC20 token to transfer.
    /// @param from Address to transfer asset from.
    /// @param to Address to transfer asset to.
    /// @param amount Amount of asset to transfer.
    /// @param bridgeData Arbitrary asset data needed by the bridge contract.
    /// @return success The magic bytes `0xdc1600f3` if successful.
    function bridgeTransferFrom(
        address tokenAddress,
        address from,
        address to,
        uint256 amount,
        bytes calldata bridgeData
    )
        external
        returns (bytes4 success);

    /// @dev Trades ETH for token. ETH must be sent to the contract prior to
    ///      calling this function to trigger the trade.
    /// @param taker The recipient of the bought tokens.
    /// @param minMakerAssetAmount The minimum amount of maker asset to buy.
    /// @return makerAssetAmount The amount of tokens bought.
    function sellEthForToken(
        address taker,
        uint256 minMakerAssetAmount
    )
        external
        returns (uint256 makerAssetAmount);

    /// @dev Trades token for ETH. The token must be sent to the contract prior
    ///      to calling this function to trigger the trade.
    /// @param taker The recipient of the bought ETH.
    /// @param minMakerAssetAmount The minimum amount of ETH to buy.
    /// @return makerAssetAmount The amount of ETH bought.
    function sellTokenForEth(
        address payable taker,
        uint256 minMakerAssetAmount
    )
        external
        returns (uint256 makerAssetAmount);
}
