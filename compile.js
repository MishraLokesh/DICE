const path = require('path');
const fs = require('fs-extra');
const solc = require('solc');

const buildPath = path.resolve(__dirname, 'build');
fs.removeSync(buildPath);

const Contractpath = path.resolve(__dirname, 'contracts', 'DiceGame.sol');
const source = fs.readFileSync(Contractpath, 'UTF-8');

var input = {
  language: 'Solidity',
  sources: {
      'DiceGame.sol' : {
          content: source
      }
  },
  settings: {
      outputSelection: {
          '*': {
              '*': [ '*' ]
          }
      }
  }
};



var output = JSON.parse(solc.compile(JSON.stringify(input)));
console.log(output);

fs.ensureDirSync(buildPath);

output = output.contracts['DiceGame.sol'];

for (let contract in output) {
  fs.outputJsonSync(
    path.resolve(buildPath, contract.replace(':', '') + '.json'), 
    output[contract]
  );
}

