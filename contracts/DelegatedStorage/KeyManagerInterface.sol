pragma solidity ^0.4.18;

contract KeyManagerInterface {
  function keyForContract(address _contract) public view returns (bytes32 key);
}
