pragma solidity ^0.4.18;

import '../DelegatedStorage/DelegatedStorage.sol';
import '../DelegatedStorage/KeyManagerInterface.sol';
import '../Proxy/DelegateManagerInterface.sol';
import 'zeppelin-solidity/contracts/ownership/Ownable.sol';
import './CoordinatorStorageDelegate.sol';

contract Coordinator is KeyManagerInterface, DelegateManagerInterface, Ownable {

  CoordinatorStorageDelegate public _storage;
  CoordinatorStorageDelegate public delegate;

  function Coordinator(address coordinatorStorageDelegate) public {
    _storage = CoordinatorStorageDelegate(new DelegatedStorage(this, this));
    delegate = CoordinatorStorageDelegate(coordinatorStorageDelegate);
  }

  function setContract(string _key, address _contract) public onlyOwner {
    _storage.setRegisteredContract(keccak256(_key), _contract);
    _storage.setRegisteredContractKey(_contract, keccak256(_key));
  }

  function removeContract(string _key) public onlyOwner {
    _storage.deleteRegisteredContract(keccak256(_key));
  }

  function setStorageDelegate(string _key, address _delegate) public onlyOwner {
    _storage.setRegisteredStorageDelegate(keccak256(_key), _delegate);
  }

  function setDelegate(string _key, address _delegate) public onlyOwner {
    _storage.setRegisteredDelegate(keccak256(_key), _delegate);
  }

  // KeyManagerInterface
  function keyForContract(address _contract) public view returns (bytes32) {
    if (_contract == address(this))
      return keccak256("Coordinator");
    return _storage.getRegisteredContractKey(_contract);
  }

  // DelegateManagerInterface
  function delegateForContract(address _contract) public view returns (address) {
    if (msg.sender == address(_storage)) {
      return getRegisteredStorageDelegate(_contract);
    } else {
      return getRegisteredDelegate(_contract);
    }
  }

  /* Private functions */

  function getRegisteredStorageDelegate(address _contract) private view returns (address) {
    if (_contract == address(this))
      return delegate;
    return _storage.getRegisteredStorageDelegate(keyForContract(_contract));
  }

  function getRegisteredDelegate(address _contract) private view returns (address) {
    return _storage.getRegisteredDelegate(keyForContract(msg.sender));
  }
}
