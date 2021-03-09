// SPDX-License-Identifier: UNLICENSED
pragma solidity =0.7.6;
pragma abicoder v2;

import '@uniswap/v3-core/contracts/interfaces/IUniswapV3Factory.sol';
import '@uniswap/v3-core/contracts/interfaces/IUniswapV3Pool.sol';

import '../interfaces/IPeripheryImmutableState.sol';
import '../interfaces/IRouterPositions.sol';
import '../libraries/PoolAddress.sol';

abstract contract RouterValidation is IPeripheryImmutableState {
    function _blockTimestamp() internal view virtual returns (uint256) {
        return block.timestamp;
    }

    modifier checkDeadline(uint256 deadline) {
        require(_blockTimestamp() <= deadline, 'Transaction too old');
        _;
    }
}