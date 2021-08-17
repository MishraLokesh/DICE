pragma solidity ^0.4.24;

contract Dice{

	struct Bet{
		uint8  currentBet;
		bool  isBetSet; //default value is false	
		uint8  destiny;
	}

	mapping(address => Bet) public bets;

	uint8 private randomFactor;

	event NewBetIsSet(address bidder , uint8 currentBet);

	event GameResult(address bidder, uint8 currentBet , uint8 destiny);

	constructor() public{
		randomFactor = 10;
	}

	function isBetSet() public view returns(bool){
		return bets[msg.sender].isBetSet;
	}
    function destiny() public view returns(uint){
		return bets[msg.sender].destiny;
	}
	function currentBet() public view returns(uint){
		return bets[msg.sender].currentBet;
	}

	function getNewbet(uint8 a) public {
		require(bets[msg.sender].isBetSet == false);
		bets[msg.sender].isBetSet = true;
		bets[msg.sender].currentBet = a;
	}

	function roll() public {

		require(bets[msg.sender].isBetSet == true);

        bets[msg.sender].destiny = (uint8(keccak256(abi.encodePacked(block.difficulty, now))) % 5) + 1;
// 		bets[msg.sender].isBetSet = false;
// 		if(bets[msg.sender].destiny == bets[msg.sender].currentBet){
// 			msg.sender.transfer(100000000000000);
// 			emit GameResult(msg.sender, bets[msg.sender].currentBet, bets[msg.sender].destiny);			
// 		}else{
// 			emit GameResult(msg.sender, bets[msg.sender].currentBet, bets[msg.sender].destiny);
// 		}
// 		return (msg.sender , betsil[msg.sender].currentBet , bets[msg.sender].destiny);
        // return bets[msg.sender].destiny;
	}


    // function() public payable{}
	

}