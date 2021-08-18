# DiceGame

## About the Project

 This is a smart contract for a basic dice game where first the player can set a bet that he thinks he will be able to get by rolling the dice in 3 rounds. If he does manage to get the bet he placed, the matchFound for that particular player is set to true. 
 Further after 3 rounds, the player cannot roll the die anymore. 
 
 Incase he wants to continue, the reset function will set the count as 0 again. Now the player needs to again set the bet (it could be same or even a new one also). Now the same procedure is repeated again.



## Installation

1. Clone repo on your local system

```bash
git clone https://github.com/MishraLokesh/Health_Hub.git
```
2. Open a terminal on your localhost and install the dependencies

```bash
npm install
```
3. Create a Metamask account (if you do not already possess one) and use the Rinkeby Faucet (Our project is deployed on the Rinkeby Test Network) to obtain some test ETH in your metamask wallet.

```
https://faucet.rinkeby.io/ 
```
4. Add your personal 12-word mnemonic and Infura API

```
Goto deploy.js
```
```bash
#In the deploy.js file (lines 11-18) make the following changes to the file -->
let provider = new HDWalletProvider({
  mnemonic: {
  phrase: '#Enter 12 Word mnemonic here',
  },
  #// providerOrUrl: `https://rinkeby.infura.io/v3/${process.env.infura_API}`,
  providerOrUrl: '#Use the format of the Infura API token above and add your own',
  chainId: '4'
  });
```

5. Open a terminal on your localhost and deploy the development live server

```bash
npm run dev
```
You're good to go! DiceGame should open on the live server.

## Want to Contribute?
To contribute to this project:
1. Fork this repo
2. Make desired changes after cloning it on your local system.
3. Generate a pull request.

Note: Pull requests are welcome. For major changes, please open an issue first to discuss what you would like to change. Please make sure to update tests as appropriate.

## Connect with the Collaborators
1. Lokesh Mishra - [LinkedIN](https://www.linkedin.com/in/lokesh-mishra-0807/) || [GitHub](https://github.com/MishraLokesh) || [Instagram](https://www.instagram.com/lokesh.mishra__/)


## License
Distributed under the [MIT](https://choosealicense.com/licenses/mit/) license.



