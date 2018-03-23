pragma solidity ^0.4.18;

import '../Storage/BaseStorage.sol';

contract CoordinatorStorageDelegate is BaseStorage {

  /**** Get Methods ***********/

  /// @param key The key for the record
  function getRegisteredContract(bytes32 key) public view returns (address) {
    return getAddress(keccak256("registeredContracts", key));
  }

  /// @param _contract The address of the contract
  function getRegisteredContractKey(address _contract) public view returns (bytes32) {
    return getBytes32(keccak256("registeredContractKeys", _contract));
  }

  /// @param key The key for the record
  function getRegisteredStorageDelegate(bytes32 key) public view returns (address) {
    return getAddress(keccak256("registeredStorageDelegates", key));
  }

  /// @param key The key for the record
  function getRegisteredDelegate(bytes32 key) public view returns (address) {
    return getAddress(keccak256("registeredDelegates", key));
  }

  /**** Set Methods ***********/

  /// @param key The key for the record
  /// @param _contract The address of the contract
  function setRegisteredContract(bytes32 key, address _contract) public {
    setAddress(keccak256("registeredContracts", key), _contract);
  }

  /// @param _contract The address of the contract
  /// @param key The key for the record
  function setRegisteredContractKey(address _contract, bytes32 key) public {
    setBytes32(keccak256("registeredContractKeys", _contract), key);
  }

  /// @param key The key for the record
  /// @param delegate The delegate for the contract key
  function setRegisteredStorageDelegate(bytes32 key, address delegate) public {
    setAddress(keccak256("registeredStorageDelegates", key), delegate);
  }

  /// @param key The key for the record
  /// @param delegate The delegate for the contract key
  function setRegisteredDelegate(bytes32 key, address delegate) public {
    setAddress(keccak256("registeredDelegates", key), delegate);
  }

  /**** Delete Methods ***********/

  /// @param key The key for the record
  function deleteRegisteredContract(bytes32 key) public {
    deleteAddress(keccak256("registeredContracts", key));
  }

  /// @param _contract The address of the contract
  function deleteRegisteredContractKey(address _contract) public {
    deleteBytes32(keccak256("registeredContractKeys", _contract));
  }

  /// @param key The key for the record
  function deleteRegisteredStorageDelegate(bytes32 key) public {
    deleteAddress(keccak256("registeredStorageDelegates", key));
  }

  /// @param key The key for the record
  function deleteRegisteredDelegate(bytes32 key) public {
    deleteAddress(keccak256("registeredDelegates", key));
  }
}
