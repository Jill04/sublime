/** This example code is designed to quickly deploy an example contract using Remix.
 *  If you have never used Remix, try our example walkthrough: https://docs.chain.link/docs/example-walkthrough
 *  You will need testnet ETH and LINK.
 *     - Kovan ETH faucet: https://faucet.kovan.network/
 *     - Kovan LINK faucet: https://kovan.chain.link/
 */

pragma solidity ^0.6.7;

import "./AggregatorV3Interface.sol";


contract PriceConsumerV3 {

    AggregatorV3Interface internal priceFeed;
    int decimals = 10**18;
    /**
     * Network: Kovan
     
     */
     event display(int);
    constructor() public {
        
    }
    
    function assetPriceEquivalence(string memory asset1, string memory asset2) public 
    {
        //Aggregator: ETH/USD
       if(keccak256(abi.encodePacked(asset1)) == keccak256(abi.encodePacked('ETH')) && keccak256(abi.encodePacked(asset2)) == keccak256(abi.encodePacked('USD')) ) 
         priceFeed = AggregatorV3Interface(0x9326BFA02ADD2366b30bacB125260Af641031331);
         
       //Aggregator: DAI/USD 
       else if(keccak256(abi.encodePacked(asset1)) == keccak256(abi.encodePacked('DAI')) && keccak256(abi.encodePacked(asset2)) == keccak256(abi.encodePacked('USD')) ) 
         priceFeed = AggregatorV3Interface(0x777A68032a88E5A84678A77Af2CD65A7b3c0775a);
         
         //Aggregator: DAI/ETH 
       else if(keccak256(abi.encodePacked(asset1)) == keccak256(abi.encodePacked('DAI')) && keccak256(abi.encodePacked(asset2)) == keccak256(abi.encodePacked('ETH')) ) 
         priceFeed = AggregatorV3Interface(0x22B58f1EbEDfCA50feF632bD73368b2FdA96D541);     
    }

    /**
     * Returns the latest price
     */
    function getLatestPrice() public view returns (int) {
        (
            uint80 roundID, 
            int price,
            uint startedAt,
            uint timeStamp,
            uint80 answeredInRound
        ) = priceFeed.latestRoundData();
      
        
        // If the round is not complete yet, timestamp is 0
        require(timeStamp > 0, "Round not complete");
       
        return price*decimals;
    }
    
}