pragma solidity ^0.4.18;

import '../Proxy/DelegateManagable.sol';
import '../Proxy/DelegateManagerInterface.sol';
import '../StorageConsumer/BasicStorage.sol';

contract UpgradableContract is BasicStorage, DelegateManagable {

  function UpgradableContract(address storageAddress, DelegateManagerInterface delegateManager) public
    BasicStorage(storageAddress)
    DelegateManagable(delegateManager)
  { }
}
