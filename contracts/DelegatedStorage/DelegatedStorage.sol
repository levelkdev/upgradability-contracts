pragma solidity ^0.4.18;

import '../Storage/BaseStorage.sol';
import '../Proxy/DelegateManagerInterface.sol';
import '../Proxy/DelegateManagable.sol';
import './KeyManagerInterface.sol';

contract DelegatedStorage is BaseStorage, DelegateManagable {

  KeyManagerInterface keyManager;

  function DelegatedStorage(KeyManagerInterface _keyManager, DelegateManagerInterface _delegateManager) public
    DelegateManagable(_delegateManager)
  {
    keyManager = _keyManager;
  }

  function scopedKey(bytes32 _key) internal view returns(bytes32) {
    return keccak256(keyManager.keyForContract(msg.sender), _key);
  }
}
