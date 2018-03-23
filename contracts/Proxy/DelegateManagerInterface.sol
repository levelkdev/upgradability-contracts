pragma solidity ^0.4.18;

contract DelegateManagerInterface {
  function delegateForContract(address _contract) public view returns (address delegate);
}
