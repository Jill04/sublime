var abi=[
	{
		"inputs": [],
		"stateMutability": "nonpayable",
		"type": "constructor"
	},
	{
		"anonymous": false,
		"inputs": [
			{
				"indexed": false,
				"internalType": "int256",
				"name": "",
				"type": "int256"
			}
		],
		"name": "display",
		"type": "event"
	},
	{
		"inputs": [
			{
				"internalType": "string",
				"name": "asset1",
				"type": "string"
			},
			{
				"internalType": "string",
				"name": "asset2",
				"type": "string"
			}
		],
		"name": "assetPriceEquivalence",
		"outputs": [],
		"stateMutability": "nonpayable",
		"type": "function"
	},
	{
		"inputs": [],
		"name": "getLatestPrice",
		"outputs": [
			{
				"internalType": "int256",
				"name": "",
				"type": "int256"
			}
		],
		"stateMutability": "view",
		"type": "function"
	}
];
var Web3 = require('web3');

var web3 = new Web3(new Web3.providers.HttpProvider("https://kovan.infura.io/v3/81c84de556564487af1490504b4bd7ce"));
web3.eth.defaultAccount = web3.eth.accounts[0];
var PriceConsumerV3 = new  web3.eth.Contract(abi,'0x2037C1B3Fa32585e16D23EFC58d7eD5926F19Ef9');


exports.StockContract = Stock;
exports.web3Module = web3;