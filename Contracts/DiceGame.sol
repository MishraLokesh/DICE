// SPDX-License-Identifier: GPL-3.0
pragma solidity >0.8.4;
contract Dice{

	struct Bet{
		uint8  currentBet;
		bool  isBetSet; //default value is false	
		uint  destiny;
    bool matchFound;
    uint count;
	}

	mapping(address => Bet) private bets;


	function isBetSet() public view returns(bool){
		return bets[msg.sender].isBetSet;
	}
    function destiny() public view returns(uint){
		return bets[msg.sender].destiny;
	}
	function currentBet() public view returns(uint){
		return bets[msg.sender].currentBet;
	}
	function WONorNOT() public view returns(bool){
		return bets[msg.sender].matchFound;
	}
	function getNewbet(uint8 a) public {
		require(bets[msg.sender].isBetSet == false);
		bets[msg.sender].isBetSet = true;
		bets[msg.sender].currentBet = a;
		
	}

	function roll() public payable{
		bets[msg.sender].count++;
        require(bets[msg.sender].isBetSet == true);

        bets[msg.sender].destiny = (uint(keccak256(abi.encodePacked(block.difficulty, block.timestamp, bets[msg.sender].count))) % 5) + 1;
    
		if(bets[msg.sender].destiny == bets[msg.sender].currentBet){
			// msg.sender.transfer(100000000000000);
			bets[msg.sender].matchFound = true;
		}
		if(bets[msg.sender].count == 3)
		    bets[msg.sender].isBetSet = false;
		
	}
	
	function reset() public{
	    bets[msg.sender].count = 0;
		bets[msg.sender].isBetSet = false;
	}

}


