console.log('loaded');

const web3 = new Web3(new Web3.providers.HttpProvider('http://localhost:9545'));
web3.eth.getAccounts(console.log);