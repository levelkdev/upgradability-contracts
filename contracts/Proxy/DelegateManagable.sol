pragma solidity ^0.4.18;

import './BaseProxy.sol';
import './DelegateManagerInterface.sol';

contract DelegateManagable is BaseProxy {
  DelegateManagerInterface delegateManager;

  function DelegateManagable(DelegateManagerInterface _delegateManager) public {
    delegateManager = _delegateManager;
  }

  // Overrides implementation() in BaseProxy.sol
  function implementation() public view returns (address) {
    return delegateManager.delegateForContract(msg.sender);
  }
}
