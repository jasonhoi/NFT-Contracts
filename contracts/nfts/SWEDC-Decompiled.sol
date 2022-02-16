#
#  Panoramix v4 Oct 2019 
#  Decompiled source of 0x7E7cB8D68444A5755f7a6507dE27260f8B169852
# 
#  Let's make the world open source 
# 
#
#  I failed with these: 
#  - unknown0c53c51c(?)
#  - unknown3408e470(?)
#  - safeTransferFrom(address _from, address _to, uint256 _tokenId)
#  - safeTransferFrom(address _from, address _to, uint256 _tokenId, bytes _data)
#  All the rest is below.
#

const unknown0f7e5970 = '1', 0
const unknowna217fddf = 0
const unknownd5391393 = 0x9f2df0fed2c77648de5860a4cc508cd0818c85b8b8a1ab4ceeef8d981c8956a6

def storage:
  unknown248a9ca3 is mapping of struct at storage 0
  unknown9010d07c is array of struct at storage 1
  stor2 is array of struct at storage 2
  stor3 is array of struct at storage 3
  ownerOf is mapping of addr at storage 4
  balanceOf is mapping of uint256 at storage 5
  approved is mapping of addr at storage 6
  stor7 is mapping of uint8 at storage 7
  tokenOfOwnerByIndex is mapping of uint256 at storage 8
  stor9 is mapping of uint256 at storage 9
  tokenByIndex is array of uint256 at storage 10
  stor11 is mapping of uint256 at storage 11
  unknown20379ee5 is uint256 at storage 13
  nonce is mapping of uint256 at storage 14
  owner is addr at storage 15
  stor16 is uint256 at storage 16
  stor17 is array of struct at storage 17
  maxSupply is uint32 at storage 18
  stor19 is array of struct at storage 19
  stor20 is addr at storage 20

def getApproved(uint256 _tokenId): # not payable
  require calldata.size - 4 >=′ 32
  if not ownerOf[_tokenId]:
      revert with 0x8c379a000000000000000000000000000000000000000000000000000000000, 'ERC721: approved query for nonexistent token'
  return approved[_tokenId]

def totalSupply(): # not payable
  return tokenByIndex.length

def unknown20379ee5(): # not payable
  return unknown20379ee5

def unknown248a9ca3(uint256 _param1): # not payable
  require calldata.size - 4 >=′ 32
  return unknown248a9ca3[_param1].field_256

def getNonce(address _addr): # not payable
  require calldata.size - 4 >=′ 32
  require _addr == _addr
  return nonce[addr(_addr)]

def tokenOfOwnerByIndex(address _owner, uint256 _index): # not payable
  require calldata.size - 4 >=′ 64
  require _owner == _owner
  if not _owner:
      revert with 0x8c379a000000000000000000000000000000000000000000000000000000000, 'ERC721: balance query for the zero address'
  if _index >= balanceOf[addr(_owner)]:
      revert with 0x8c379a000000000000000000000000000000000000000000000000000000000, 'ERC721Enumerable: owner index out of bounds'
  return tokenOfOwnerByIndex[addr(_owner)][_index]

def tokenByIndex(uint256 _index): # not payable
  require calldata.size - 4 >=′ 32
  if _index >= tokenByIndex.length:
      revert with 0x8c379a000000000000000000000000000000000000000000000000000000000, 'ERC721Enumerable: global index out of bounds'
  return tokenByIndex[_index]

def ownerOf(uint256 _tokenId): # not payable
  require calldata.size - 4 >=′ 32
  if not ownerOf[_tokenId]:
      revert with 0x8c379a000000000000000000000000000000000000000000000000000000000, 'ERC721: owner query for nonexistent token'
  return ownerOf[_tokenId]

def balanceOf(address _owner): # not payable
  require calldata.size - 4 >=′ 32
  require _owner == _owner
  if not _owner:
      revert with 0x8c379a000000000000000000000000000000000000000000000000000000000, 'ERC721: balance query for the zero address'
  return balanceOf[addr(_owner)]

def owner(): # not payable
  return owner

def unknown9010d07c(uint256 _param1, uint256 _param2): # not payable
  require calldata.size - 4 >=′ 64
  if _param2 >= unknown9010d07c[_param1].field_0:
      revert with 'NH{q', 50
  return unknown9010d07c[_param1][_param2].field_0

def unknown91d14854(uint256 _param1, uint256 _param2): # not payable
  require calldata.size - 4 >=′ 64
  require _param2 == addr(_param2)
  return bool(unknown248a9ca3[_param1][addr(_param2)].field_0)

def unknownca15c873(uint256 _param1): # not payable
  require calldata.size - 4 >=′ 32
  return unknown9010d07c[_param1].field_0

def maxSupply(): # not payable
  return maxSupply

#
#  Regular functions
#

def _fallback() payable: # default function
  revert

def renounceOwnership(): # not payable
  if caller != this.address:
      if owner != caller:
          revert with 0, 'Ownable: caller is not the owner'
  else:
      mem[96] = calldata.size
      mem[128 len calldata.size] = call.data[0 len calldata.size]
      if owner != mem[calldata.size + 108 len 20]:
          revert with 0, 'Ownable: caller is not the owner'
  owner = 0
  log OwnershipTransferred(
        address previousOwner=owner,
        address newOwner=0)

def isApprovedForAll(address _owner, address _operator): # not payable
  require calldata.size - 4 >=′ 64
  require _owner == _owner
  require _operator == _operator
  static call stor20.proxies(address param1) with:
          gas gas_remaining wei
         args _owner
  if not ext_call.success:
      revert with ext_call.return_data[0 len return_data.size]
  require return_data.size >=′ 32
  require ext_call.return_data == ext_call.return_data[12 len 20]
  if ext_call.return_data_operator:
      return bool(stor7[addr(_owner)][addr(_operator)])
  return 1

def supportsInterface(bytes4 _interfaceId): # not payable
  require calldata.size - 4 >=′ 32
  require _interfaceId == Mask(32, 224, _interfaceId)
  if 0x780e9d6300000000000000000000000000000000000000000000000000000000 == Mask(32, 224, _interfaceId):
      return True
  if 0x80ac58cd00000000000000000000000000000000000000000000000000000000 == Mask(32, 224, _interfaceId):
      return True
  if 0x5b5e139f00000000000000000000000000000000000000000000000000000000 == Mask(32, 224, _interfaceId):
      return True
  if 0x5a05180f00000000000000000000000000000000000000000000000000000000 == Mask(32, 224, _interfaceId):
      return True
  if 0x7965db0b00000000000000000000000000000000000000000000000000000000 == Mask(32, 224, _interfaceId):
      return True
  return (Mask(32, 224, _interfaceId) == 0x1ffc9a700000000000000000000000000000000000000000000000000000000)

def transferOwnership(address _newOwner): # not payable
  require calldata.size - 4 >=′ 32
  require _newOwner == _newOwner
  if caller != this.address:
      if owner != caller:
          revert with 0, 'Ownable: caller is not the owner'
      if not _newOwner:
          revert with 0x8c379a000000000000000000000000000000000000000000000000000000000, 'Ownable: new owner is the zero address'
  else:
      mem[96] = calldata.size
      mem[128 len calldata.size] = call.data[0 len calldata.size]
      if owner != mem[calldata.size + 108 len 20]:
          revert with 0, 'Ownable: caller is not the owner'
      if not _newOwner:
          revert with 0, 'Ownable: new owner is the zero address'
  ('bool', ('param', '_newOwner'))
  owner = _newOwner
  log OwnershipTransferred(
        address previousOwner=owner,
        address newOwner=_newOwner)

def setApprovalForAll(address _to, bool _approved): # not payable
  require calldata.size - 4 >=′ 64
  require _to == _to
  require _approved == _approved
  if caller != this.address:
      if caller == _to:
          revert with 0, 'ERC721: approve to caller'
      stor7[caller][addr(_to)] = uint8(_approved)
      log ApprovalForAll(
            address owner=_approved,
            address operator=caller,
            bool approved=_to)
  else:
      mem[96] = calldata.size
      mem[128 len calldata.size] = call.data[0 len calldata.size]
      if mem[calldata.size + 108 len 20] == _to:
          revert with 0, 'ERC721: approve to caller'
      stor7[mem[calldata.size + 108 len 20]][addr(_to)] = uint8(_approved)
      log ApprovalForAll(
            address owner=_approved,
            address operator=mem[calldata.size + 108 len 20],
            bool approved=_to)

def unknown316f478d(uint256 _param1, array _param2): # not payable
  require calldata.size - 4 >=′ 64
  require _param2 <= 18446744073709551615
  require _param2 + 35 <′ calldata.size
  if _param2.length > 18446744073709551615:
      revert with 'NH{q', 65
  if ceil32(ceil32(_param2.length)) + 97 < 96 or ceil32(ceil32(_param2.length)) + 97 > 18446744073709551615:
      revert with 'NH{q', 65
  require _param2 + _param2.length + 36 <= calldata.size
  mem[128 len _param2.length] = _param2[all]
  mem[_param2.length + 128] = 0
  if not ownerOf[_param1]:
      revert with 0, 'ERC721: owner query for nonexistent token'
  if caller != this.address:
      if ownerOf[_param1] != caller:
          revert with 0, 'SweetToken: setPreferredURL caller is not owner or bad tokenId'
  else:
      mem[ceil32(ceil32(_param2.length)) + 97] = calldata.size
      mem[ceil32(ceil32(_param2.length)) + 129 len calldata.size] = call.data[0 len calldata.size]
      if mem[calldata.size + ceil32(ceil32(_param2.length)) + 109 len 20] != ownerOf[_param1]:
          revert with 0, 'SweetToken: setPreferredURL caller is not owner or bad tokenId'
  if not ownerOf[_param1]:
      revert with 0, 'SweetToken: setPreferredURL caller is not owner or bad tokenId'
  if stor19[_param1].field_0:
      if stor19[_param1].field_0 == uint255(stor19[_param1].field_0) * 0.5 < 32:
          revert with 'NH{q', 34
      if _param2.length:
          stor19[_param1][].field_0 = Array(len=_param2.length, data=_param2[all])
      else:
          stor19[_param1].field_0 = 0
          idx = 0
          while (uint255(stor19[_param1].field_0) * 0.5) + 31 / 32 > idx:
              stor19[_param1][idx].field_0 = 0
              idx = idx + 1
              continue 
  else:
      if stor19[_param1].field_0 == stor19[_param1].field_1 < 32:
          revert with 'NH{q', 34
      if _param2.length:
          stor19[_param1][].field_0 = Array(len=_param2.length, data=_param2[all])
      else:
          stor19[_param1].field_0 = 0
          idx = 0
          while stor19[_param1].field_1 + 31 / 32 > idx:
              stor19[_param1][idx].field_0 = 0
              idx = idx + 1
              continue 

def unknown36568abe(uint256 _param1, uint256 _param2): # not payable
  require calldata.size - 4 >=′ 64
  require _param2 == addr(_param2)
  if caller != this.address:
      if addr(_param2) != caller:
          revert with 0x8c379a000000000000000000000000000000000000000000000000000000000, 'AccessControl: can only renounce roles for self'
      if unknown248a9ca3[_param1][addr(_param2)].field_0:
          unknown248a9ca3[_param1][addr(_param2)].field_0 = 0
          if caller != this.address:
              log 0xf6391f5c: _param1, addr(_param2), caller
          else:
              mem[96] = calldata.size
              mem[128 len calldata.size] = call.data[0 len calldata.size]
              log 0xf6391f5c: _param1, addr(_param2), mem[calldata.size + 108 len 20]
  else:
      mem[96] = calldata.size
      mem[128 len calldata.size] = call.data[0 len calldata.size]
      if addr(_param2) != mem[calldata.size + 108 len 20]:
          revert with 0, 'AccessControl: can only renounce roles for self'
      if unknown248a9ca3[_param1][addr(_param2)].field_0:
          unknown248a9ca3[_param1][addr(_param2)].field_0 = 0
          if caller != this.address:
              log 0xf6391f5c: _param1, addr(_param2), caller
          else:
              mem[ceil32(calldata.size) + 128] = calldata.size
              mem[ceil32(calldata.size) + 160 len calldata.size] = call.data[0 len calldata.size]
              log 0xf6391f5c: _param1, addr(_param2), mem[calldata.size + ceil32(calldata.size) + 140 len 20]
  if unknown9010d07c[_param1][1][addr(_param2)].field_0:
      if unknown9010d07c[_param1][1][addr(_param2)].field_0 < 1:
          revert with 'NH{q', 17
      if unknown9010d07c[_param1].field_0 < 1:
          revert with 'NH{q', 17
      if unknown9010d07c[_param1].field_0 - 1 != unknown9010d07c[_param1][1][addr(_param2)].field_0 - 1:
          if unknown9010d07c[_param1].field_0 - 1 >= unknown9010d07c[_param1].field_0:
              revert with 'NH{q', 50
          if unknown9010d07c[_param1][1][addr(_param2)].field_0 - 1 >= unknown9010d07c[_param1].field_0:
              revert with 'NH{q', 50
          unknown9010d07c[_param1][unknown9010d07c[_param1][1][addr(_param2)].field_0].field_0 = unknown9010d07c[_param1][unknown9010d07c[_param1].field_0].field_0
          unknown9010d07c[_param1][1][unknown9010d07c[_param1][unknown9010d07c[_param1].field_0].field_0].field_0 = unknown9010d07c[_param1][1][addr(_param2)].field_0
      if not unknown9010d07c[_param1].field_0:
          revert with 'NH{q', 49
      unknown9010d07c[_param1][unknown9010d07c[_param1].field_0].field_0 = 0
      unknown9010d07c[_param1].field_0--
      unknown9010d07c[_param1][1][addr(_param2)].field_0 = 0

def approve(address _spender, uint256 _value): # not payable
  require calldata.size - 4 >=′ 64
  require _spender == _spender
  if not ownerOf[_value]:
      revert with 0x8c379a000000000000000000000000000000000000000000000000000000000, 'ERC721: owner query for nonexistent token'
  if _spender == ownerOf[_value]:
      revert with 0x8c379a000000000000000000000000000000000000000000000000000000000, 'ERC721: approval to current owner'
  if caller != this.address:
      if caller == ownerOf[_value]:
          approved[_value] = _spender
          if not ownerOf[_value]:
              revert with 0x8c379a000000000000000000000000000000000000000000000000000000000, 'ERC721: owner query for nonexistent token'
      else:
          if caller != this.address:
              static call stor20.proxies(address param1) with:
                      gas gas_remaining wei
                     args ownerOf[_value]
              if not ext_call.success:
                  revert with ext_call.return_data[0 len return_data.size]
              require return_data.size >=′ 32
              require ext_call.return_data == ext_call.return_data[12 len 20]
              if ext_call.return_data[12 len 20] != caller:
                  if not stor7[stor4[_value]][caller]:
                      revert with 0, 'ERC721: approve caller is not owner nor approved for all'
          else:
              mem[96] = calldata.size
              mem[128 len calldata.size] = call.data[0 len calldata.size]
              static call stor20.proxies(address param1) with:
                      gas gas_remaining wei
                     args ownerOf[_value]
              if not ext_call.success:
                  revert with ext_call.return_data[0 len return_data.size]
              require return_data.size >=′ 32
              require ext_call.return_data == ext_call.return_data[12 len 20]
              if ext_call.return_datamem[calldata.size + 108 len 20]:
                  if not stor7[stor4[_value]][addr(mem[calldata.size + 96])]:
                      revert with 0, 'ERC721: approve caller is not owner nor approved for all'
          approved[_value] = _spender
          if not ownerOf[_value]:
              revert with 0, 'ERC721: owner query for nonexistent token'
  else:
      mem[96] = calldata.size
      mem[128 len calldata.size] = call.data[0 len calldata.size]
      if mem[calldata.size + 108 len 20] != ownerOf[_value]:
          if caller != this.address:
              static call stor20.proxies(address param1) with:
                      gas gas_remaining wei
                     args ownerOf[_value]
              if not ext_call.success:
                  revert with ext_call.return_data[0 len return_data.size]
              require return_data.size >=′ 32
              require ext_call.return_data == ext_call.return_data[12 len 20]
              if ext_call.return_data[12 len 20] != caller:
                  if not stor7[stor4[_value]][caller]:
                      revert with 0, 'ERC721: approve caller is not owner nor approved for all'
          else:
              mem[ceil32(calldata.size) + 128] = calldata.size
              mem[ceil32(calldata.size) + 160 len calldata.size] = call.data[0 len calldata.size]
              static call stor20.proxies(address param1) with:
                      gas gas_remaining wei
                     args ownerOf[_value]
              if not ext_call.success:
                  revert with ext_call.return_data[0 len return_data.size]
              require return_data.size >=′ 32
              require ext_call.return_data == ext_call.return_data[12 len 20]
              if ext_call.return_datamem[calldata.size + ceil32(calldata.size) + 140 len 20]:
                  if not stor7[stor4[_value]][addr(mem[calldata.size + ceil32(calldata.size) + 128])]:
                      revert with 0, 'ERC721: approve caller is not owner nor approved for all'
      approved[_value] = _spender
      if not ownerOf[_value]:
          revert with 0, 'ERC721: owner query for nonexistent token'
  ('bool', ('stor', ('map', ('param', '_value'), ('name', 'ownerOf', 4))))
  log Approval(
        address owner=ownerOf[_value],
        address spender=_spender,
        uint256 value=_value)

def mint(address _to, string _metadata): # not payable
  require calldata.size - 4 >=′ 64
  require _to == _to
  require _metadata <= 18446744073709551615
  require _metadata + 35 <′ calldata.size
  if _metadata.length > 18446744073709551615:
      revert with 'NH{q', 65
  if ceil32(ceil32(_metadata.length)) + 97 < 96 or ceil32(ceil32(_metadata.length)) + 97 > 18446744073709551615:
      revert with 'NH{q', 65
  require _metadata + _metadata.length + 36 <= calldata.size
  mem[128 len _metadata.length] = _metadata[all]
  mem[_metadata.length + 128] = 0
  if caller != this.address:
      if not unknown248a9ca3[0x9f2df0fed2c77648de5860a4cc508cd0818c85b8b8a1ab4ceeef8d981c8956a6][caller].field_0:
          revert with 0, 'must have minter role'
  else:
      mem[ceil32(ceil32(_metadata.length)) + 97] = calldata.size
      mem[ceil32(ceil32(_metadata.length)) + 129 len calldata.size] = call.data[0 len calldata.size]
      if not unknown248a9ca3[0x9f2df0fed2c77648de5860a4cc508cd0818c85b8b8a1ab4ceeef8d981c8956a6][addr(mem[calldata.size + ceil32(ceil32(_metadata.length)) + 97])].field_0:
          revert with 0, 'must have minter role'
  if stor16 >= maxSupply:
      revert with 0, 'max supply reached'
  if not _to:
      revert with 0, 'ERC721: mint to the zero address'
  if ownerOf[stor16]:
      revert with 0, 'ERC721: token already minted'
  stor11[stor16] = tokenByIndex.length
  tokenByIndex.length++
  tokenByIndex[tokenByIndex.length] = stor16
  if _to:
      if _to:
          if not _to:
              revert with 0, 'ERC721: balance query for the zero address'
          tokenOfOwnerByIndex[addr(_to)][stor5[addr(_to)]] = stor16
          stor9[stor16] = balanceOf[addr(_to)]
  else:
      if tokenByIndex.length < 1:
          revert with 'NH{q', 17
      if tokenByIndex.length - 1 >= tokenByIndex.length:
          revert with 'NH{q', 50
      if stor11[stor16] >= tokenByIndex.length:
          revert with 'NH{q', 50
      tokenByIndex[stor11[stor16]] = tokenByIndex[tokenByIndex.length]
      stor11[stor10[stor10.length]] = stor11[stor16]
      stor11[stor16] = 0
      if not tokenByIndex.length:
          revert with 'NH{q', 49
      tokenByIndex[tokenByIndex.length] = 0
      tokenByIndex.length--
  if balanceOf[addr(_to)] > -2:
      revert with 'NH{q', 17
  balanceOf[addr(_to)]++
  ownerOf[stor16] = _to
  log Transfer(
        address from=0,
        address to=_to,
        uint256 value=stor16)
  if stor19[stor16].field_0:
      if stor19[stor16].field_0 == uint255(stor19[stor16].field_0) * 0.5 < 32:
          revert with 'NH{q', 34
      if _metadata.length:
          stor19[stor16][].field_0 = Array(len=_metadata.length, data=_metadata[all])
      else:
          stor19[stor16].field_0 = 0
          idx = 0
          while (uint255(stor19[stor16].field_0) * 0.5) + 31 / 32 > idx:
              stor19[stor16][idx].field_0 = 0
              idx = idx + 1
              continue 
  else:
      if stor19[stor16].field_0 == stor19[stor16].field_1 < 32:
          revert with 'NH{q', 34
      if _metadata.length:
          stor19[stor16][].field_0 = Array(len=_metadata.length, data=_metadata[all])
      else:
          stor19[stor16].field_0 = 0
          idx = 0
          while stor19[stor16].field_1 + 31 / 32 > idx:
              stor19[stor16][idx].field_0 = 0
              idx = idx + 1
              continue 
  stor16++

def name(): # not payable
  if bool(stor2.length):
      if bool(stor2.length) == uint255(stor2.length) * 0.5 < 32:
          revert with 'NH{q', 34
      if bool(stor2.length):
          if bool(stor2.length) == uint255(stor2.length) * 0.5 < 32:
              revert with 'NH{q', 34
          if Mask(256, -1, stor2.length):
              if 31 < uint255(stor2.length) * 0.5:
                  mem[128] = uint256(stor2.field_0)
                  idx = 128
                  s = 0
                  while (uint255(stor2.length) * 0.5) + 96 > idx:
                      mem[idx + 32] = stor2[s].field_256
                      idx = idx + 32
                      s = s + 1
                      continue 
                  return Array(len=2 * Mask(256, -1, stor2.length), data=mem[128 len ceil32(uint255(stor2.length) * 0.5)])
              mem[128] = 256 * stor2.length.field_8
      else:
          if bool(stor2.length) == stor2.length.field_1 < 32:
              revert with 'NH{q', 34
          if stor2.length.field_1:
              if 31 < stor2.length.field_1:
                  mem[128] = uint256(stor2.field_0)
                  idx = 128
                  s = 0
                  while stor2.length.field_1 + 96 > idx:
                      mem[idx + 32] = stor2[s].field_256
                      idx = idx + 32
                      s = s + 1
                      continue 
                  return Array(len=2 * Mask(256, -1, stor2.length), data=mem[128 len ceil32(uint255(stor2.length) * 0.5)])
              mem[128] = 256 * stor2.length.field_8
      mem[ceil32(uint255(stor2.length) * 0.5) + 192 len ceil32(uint255(stor2.length) * 0.5)] = mem[128 len ceil32(uint255(stor2.length) * 0.5)]
      if ceil32(uint255(stor2.length) * 0.5) > uint255(stor2.length) * 0.5:
          mem[(uint255(stor2.length) * 0.5) + ceil32(uint255(stor2.length) * 0.5) + 192] = 0
      return Array(len=2 * Mask(256, -1, stor2.length), data=mem[128 len ceil32(uint255(stor2.length) * 0.5)], mem[(2 * ceil32(uint255(stor2.length) * 0.5)) + 192 len 2 * ceil32(uint255(stor2.length) * 0.5)]), 
  if bool(stor2.length) == stor2.length.field_1 < 32:
      revert with 'NH{q', 34
  if bool(stor2.length):
      if bool(stor2.length) == uint255(stor2.length) * 0.5 < 32:
          revert with 'NH{q', 34
      if Mask(256, -1, stor2.length):
          if 31 < uint255(stor2.length) * 0.5:
              mem[128] = uint256(stor2.field_0)
              idx = 128
              s = 0
              while (uint255(stor2.length) * 0.5) + 96 > idx:
                  mem[idx + 32] = stor2[s].field_256
                  idx = idx + 32
                  s = s + 1
                  continue 
              return Array(len=stor2.length % 128, data=mem[128 len ceil32(stor2.length.field_1)])
          mem[128] = 256 * stor2.length.field_8
  else:
      if bool(stor2.length) == stor2.length.field_1 < 32:
          revert with 'NH{q', 34
      if stor2.length.field_1:
          if 31 < stor2.length.field_1:
              mem[128] = uint256(stor2.field_0)
              idx = 128
              s = 0
              while stor2.length.field_1 + 96 > idx:
                  mem[idx + 32] = stor2[s].field_256
                  idx = idx + 32
                  s = s + 1
                  continue 
              return Array(len=stor2.length % 128, data=mem[128 len ceil32(stor2.length.field_1)])
          mem[128] = 256 * stor2.length.field_8
  mem[ceil32(stor2.length.field_1) + 192 len ceil32(stor2.length.field_1)] = mem[128 len ceil32(stor2.length.field_1)]
  if ceil32(stor2.length.field_1) > stor2.length.field_1:
      mem[stor2.length.field_1 + ceil32(stor2.length.field_1) + 192] = 0
  return Array(len=stor2.length % 128, data=mem[128 len ceil32(stor2.length.field_1)], mem[(2 * ceil32(stor2.length.field_1)) + 192 len 2 * ceil32(stor2.length.field_1)]), 

def symbol(): # not payable
  if bool(stor3.length):
      if bool(stor3.length) == uint255(stor3.length) * 0.5 < 32:
          revert with 'NH{q', 34
      if bool(stor3.length):
          if bool(stor3.length) == uint255(stor3.length) * 0.5 < 32:
              revert with 'NH{q', 34
          if Mask(256, -1, stor3.length):
              if 31 < uint255(stor3.length) * 0.5:
                  mem[128] = uint256(stor3.field_0)
                  idx = 128
                  s = 0
                  while (uint255(stor3.length) * 0.5) + 96 > idx:
                      mem[idx + 32] = stor3[s].field_256
                      idx = idx + 32
                      s = s + 1
                      continue 
                  return Array(len=2 * Mask(256, -1, stor3.length), data=mem[128 len ceil32(uint255(stor3.length) * 0.5)])
              mem[128] = 256 * stor3.length.field_8
      else:
          if bool(stor3.length) == stor3.length.field_1 < 32:
              revert with 'NH{q', 34
          if stor3.length.field_1:
              if 31 < stor3.length.field_1:
                  mem[128] = uint256(stor3.field_0)
                  idx = 128
                  s = 0
                  while stor3.length.field_1 + 96 > idx:
                      mem[idx + 32] = stor3[s].field_256
                      idx = idx + 32
                      s = s + 1
                      continue 
                  return Array(len=2 * Mask(256, -1, stor3.length), data=mem[128 len ceil32(uint255(stor3.length) * 0.5)])
              mem[128] = 256 * stor3.length.field_8
      mem[ceil32(uint255(stor3.length) * 0.5) + 192 len ceil32(uint255(stor3.length) * 0.5)] = mem[128 len ceil32(uint255(stor3.length) * 0.5)]
      if ceil32(uint255(stor3.length) * 0.5) > uint255(stor3.length) * 0.5:
          mem[(uint255(stor3.length) * 0.5) + ceil32(uint255(stor3.length) * 0.5) + 192] = 0
      return Array(len=2 * Mask(256, -1, stor3.length), data=mem[128 len ceil32(uint255(stor3.length) * 0.5)], mem[(2 * ceil32(uint255(stor3.length) * 0.5)) + 192 len 2 * ceil32(uint255(stor3.length) * 0.5)]), 
  if bool(stor3.length) == stor3.length.field_1 < 32:
      revert with 'NH{q', 34
  if bool(stor3.length):
      if bool(stor3.length) == uint255(stor3.length) * 0.5 < 32:
          revert with 'NH{q', 34
      if Mask(256, -1, stor3.length):
          if 31 < uint255(stor3.length) * 0.5:
              mem[128] = uint256(stor3.field_0)
              idx = 128
              s = 0
              while (uint255(stor3.length) * 0.5) + 96 > idx:
                  mem[idx + 32] = stor3[s].field_256
                  idx = idx + 32
                  s = s + 1
                  continue 
              return Array(len=stor3.length % 128, data=mem[128 len ceil32(stor3.length.field_1)])
          mem[128] = 256 * stor3.length.field_8
  else:
      if bool(stor3.length) == stor3.length.field_1 < 32:
          revert with 'NH{q', 34
      if stor3.length.field_1:
          if 31 < stor3.length.field_1:
              mem[128] = uint256(stor3.field_0)
              idx = 128
              s = 0
              while stor3.length.field_1 + 96 > idx:
                  mem[idx + 32] = stor3[s].field_256
                  idx = idx + 32
                  s = s + 1
                  continue 
              return Array(len=stor3.length % 128, data=mem[128 len ceil32(stor3.length.field_1)])
          mem[128] = 256 * stor3.length.field_8
  mem[ceil32(stor3.length.field_1) + 192 len ceil32(stor3.length.field_1)] = mem[128 len ceil32(stor3.length.field_1)]
  if ceil32(stor3.length.field_1) > stor3.length.field_1:
      mem[stor3.length.field_1 + ceil32(stor3.length.field_1) + 192] = 0
  return Array(len=stor3.length % 128, data=mem[128 len ceil32(stor3.length.field_1)], mem[(2 * ceil32(stor3.length.field_1)) + 192 len 2 * ceil32(stor3.length.field_1)]), 

def unknownd547741f(uint256 _param1, uint256 _param2): # not payable
  require calldata.size - 4 >=′ 64
  require _param2 == addr(_param2)
  if caller != this.address:
      if not unknown248a9ca3[unknown248a9ca3[_param1].field_256][caller].field_0:
          mem[128 len 42] = call.data[calldata.size len 42]
          idx = 41
          s = caller
          while idx > 1:
              if s % 16 >= 16:
                  revert with 'NH{q', 50
              if idx >= 42:
                  revert with 'NH{q', 50
              mem[idx + 128 len 8] = Mask(8, -(0, 0) + 256, 0) << (0, 0) - 256
              if not idx:
                  revert with 'NH{q', 17
              idx = idx - 1
              s = Mask(252, 0, s) * 0.0625
              continue 
          if caller + 10240:
              revert with 0, 'Strings: hex length insufficient'
          mem[224 len 66] = call.data[calldata.size len 66]
          idx = 65
          s = unknown248a9ca3[_param1].field_256
          while idx > 1:
              if s % 16 >= 16:
                  revert with 'NH{q', 50
              if idx >= 66:
                  revert with 'NH{q', 50
              mem[idx + 224 len 8] = Mask(8, -(0, 0) + 256, 0) << (0, 0) - 256
              if not idx:
                  revert with 'NH{q', 17
              idx = idx - 1
              s = Mask(252, 0, s) * 0.0625
              continue 
          if unknown248a9ca3[_param1].field_256 + 16384:
              revert with 0, 'Strings: hex length insufficient'
          revert with 0, 32, 148, 'AccessControl: account ', mem[160 len 42], ' is missing role ', mem[288 len 66], 0, 0 >> 928, 0
      if unknown248a9ca3[_param1][addr(_param2)].field_0:
          unknown248a9ca3[_param1][addr(_param2)].field_0 = 0
          if caller != this.address:
              log 0xf6391f5c: _param1, addr(_param2), caller
          else:
              mem[96] = calldata.size
              mem[128 len calldata.size] = call.data[0 len calldata.size]
              log 0xf6391f5c: _param1, addr(_param2), mem[calldata.size + 108 len 20]
  else:
      mem[96] = calldata.size
      mem[128 len calldata.size] = call.data[0 len calldata.size]
      if not unknown248a9ca3[unknown248a9ca3[_param1].field_256][addr(mem[calldata.size + 96])].field_0:
          mem[ceil32(calldata.size) + 160 len 42] = call.data[calldata.size len 42]
          idx = 41
          s = mem[calldata.size + 108 len 20]
          while idx > 1:
              if s % 16 >= 16:
                  revert with 'NH{q', 50
              if idx >= 42:
                  revert with 'NH{q', 50
              mem[idx + ceil32(calldata.size) + 160 len 8] = Mask(8, -(0, 0) + 256, 0) << (0, 0) - 256
              if not idx:
                  revert with 'NH{q', 17
              idx = idx - 1
              s = Mask(252, 0, s) * 0.0625
              continue 
          if mem[calldata.size + 108 len 20] + 10240:
              revert with 0, 'Strings: hex length insufficient'
          mem[ceil32(calldata.size) + 256 len 66] = call.data[calldata.size len 66]
          idx = 65
          s = unknown248a9ca3[_param1].field_256
          while idx > 1:
              if s % 16 >= 16:
                  revert with 'NH{q', 50
              if idx >= 66:
                  revert with 'NH{q', 50
              mem[idx + ceil32(calldata.size) + 256 len 8] = Mask(8, -(0, 0) + 256, 0) << (0, 0) - 256
              if not idx:
                  revert with 'NH{q', 17
              idx = idx - 1
              s = Mask(252, 0, s) * 0.0625
              continue 
          if unknown248a9ca3[_param1].field_256 + 16384:
              revert with 0, 'Strings: hex length insufficient'
          revert with 0, 
                      32,
                      148,
                      'AccessControl: account ', mem[ceil32(calldata.size) + 192 len 42], ' is missing role ', mem[ceil32(calldata.size) + 320 len 66], 0, 0 >> 928,
                      0
      if unknown248a9ca3[_param1][addr(_param2)].field_0:
          unknown248a9ca3[_param1][addr(_param2)].field_0 = 0
          if caller != this.address:
              log 0xf6391f5c: _param1, addr(_param2), caller
          else:
              mem[ceil32(calldata.size) + 128] = calldata.size
              mem[ceil32(calldata.size) + 160 len calldata.size] = call.data[0 len calldata.size]
              log 0xf6391f5c: _param1, addr(_param2), mem[calldata.size + ceil32(calldata.size) + 140 len 20]
  if unknown9010d07c[_param1][1][addr(_param2)].field_0:
      if unknown9010d07c[_param1][1][addr(_param2)].field_0 < 1:
          revert with 'NH{q', 17
      if unknown9010d07c[_param1].field_0 < 1:
          revert with 'NH{q', 17
      if unknown9010d07c[_param1].field_0 - 1 != unknown9010d07c[_param1][1][addr(_param2)].field_0 - 1:
          if unknown9010d07c[_param1].field_0 - 1 >= unknown9010d07c[_param1].field_0:
              revert with 'NH{q', 50
          if unknown9010d07c[_param1][1][addr(_param2)].field_0 - 1 >= unknown9010d07c[_param1].field_0:
              revert with 'NH{q', 50
          unknown9010d07c[_param1][unknown9010d07c[_param1][1][addr(_param2)].field_0].field_0 = unknown9010d07c[_param1][unknown9010d07c[_param1].field_0].field_0
          unknown9010d07c[_param1][1][unknown9010d07c[_param1][unknown9010d07c[_param1].field_0].field_0].field_0 = unknown9010d07c[_param1][1][addr(_param2)].field_0
      if not unknown9010d07c[_param1].field_0:
          revert with 'NH{q', 49
      unknown9010d07c[_param1][unknown9010d07c[_param1].field_0].field_0 = 0
      unknown9010d07c[_param1].field_0--
      unknown9010d07c[_param1][1][addr(_param2)].field_0 = 0

def tokenURI(uint256 _tokenId): # not payable
  require calldata.size - 4 >=′ 32
  if not ownerOf[_tokenId]:
      revert with 0, 'URI query for nonexistent token'
  if stor19[_tokenId].field_0:
      if stor19[_tokenId].field_0 == uint255(stor19[_tokenId].field_0) * 0.5 < 32:
          revert with 'NH{q', 34
      if stor19[_tokenId].field_0:
          if stor19[_tokenId].field_0 == uint255(stor19[_tokenId].field_0) * 0.5 < 32:
              revert with 'NH{q', 34
          if Mask(256, -1, stor19[_tokenId].field_0):
              if 31 < uint255(stor19[_tokenId].field_0) * 0.5:
                  mem[128] = stor19[_tokenId].field_0
                  idx = 128
                  s = 0
                  while (uint255(stor19[_tokenId].field_0) * 0.5) + 96 > idx:
                      mem[idx + 32] = stor19[_tokenId][s].field_256
                      idx = idx + 32
                      s = s + 1
                      continue 
                  return Array(len=2 * Mask(256, -1, stor19[_tokenId].field_0), data=mem[128 len ceil32(uint255(stor19[_tokenId].field_0) * 0.5)]), 
              mem[128] = 256 * stor19[_tokenId].field_8
      else:
          if stor19[_tokenId].field_0 == stor19[_tokenId].field_1 < 32:
              revert with 'NH{q', 34
          if stor19[_tokenId].field_1:
              if 31 < stor19[_tokenId].field_1:
                  mem[128] = stor19[_tokenId].field_0
                  idx = 128
                  s = 0
                  while stor19[_tokenId].field_1 + 96 > idx:
                      mem[idx + 32] = stor19[_tokenId][s].field_256
                      idx = idx + 32
                      s = s + 1
                      continue 
                  return Array(len=2 * Mask(256, -1, stor19[_tokenId].field_0), data=mem[128 len ceil32(uint255(stor19[_tokenId].field_0) * 0.5)]), 
              mem[128] = 256 * stor19[_tokenId].field_8
      mem[ceil32(uint255(stor19[_tokenId].field_0) * 0.5) + 192 len ceil32(uint255(stor19[_tokenId].field_0) * 0.5)] = mem[128 len ceil32(uint255(stor19[_tokenId].field_0) * 0.5)]
      if ceil32(uint255(stor19[_tokenId].field_0) * 0.5) > uint255(stor19[_tokenId].field_0) * 0.5:
          mem[(uint255(stor19[_tokenId].field_0) * 0.5) + ceil32(uint255(stor19[_tokenId].field_0) * 0.5) + 192] = 0
      return Array(len=2 * Mask(256, -1, stor19[_tokenId].field_0), data=mem[128 len ceil32(uint255(stor19[_tokenId].field_0) * 0.5)], mem[(2 * ceil32(uint255(stor19[_tokenId].field_0) * 0.5)) + 192 len 2 * ceil32(uint255(stor19[_tokenId].field_0) * 0.5)]), 
  if stor19[_tokenId].field_0 == stor19[_tokenId].field_1 < 32:
      revert with 'NH{q', 34
  if stor19[_tokenId].field_0:
      if stor19[_tokenId].field_0 == uint255(stor19[_tokenId].field_0) * 0.5 < 32:
          revert with 'NH{q', 34
      if Mask(256, -1, stor19[_tokenId].field_0):
          if 31 < uint255(stor19[_tokenId].field_0) * 0.5:
              mem[128] = stor19[_tokenId].field_0
              idx = 128
              s = 0
              while (uint255(stor19[_tokenId].field_0) * 0.5) + 96 > idx:
                  mem[idx + 32] = stor19[_tokenId][s].field_256
                  idx = idx + 32
                  s = s + 1
                  continue 
              return Array(len=stor19[_tokenId].field_0, data=mem[128 len ceil32(stor19[_tokenId].field_1)])
          mem[128] = 256 * stor19[_tokenId].field_8
  else:
      if stor19[_tokenId].field_0 == stor19[_tokenId].field_1 < 32:
          revert with 'NH{q', 34
      if stor19[_tokenId].field_1:
          if 31 < stor19[_tokenId].field_1:
              mem[128] = stor19[_tokenId].field_0
              idx = 128
              s = 0
              while stor19[_tokenId].field_1 + 96 > idx:
                  mem[idx + 32] = stor19[_tokenId][s].field_256
                  idx = idx + 32
                  s = s + 1
                  continue 
              return Array(len=stor19[_tokenId].field_0, data=mem[128 len ceil32(stor19[_tokenId].field_1)])
          mem[128] = 256 * stor19[_tokenId].field_8
  mem[ceil32(stor19[_tokenId].field_1) + 192 len ceil32(stor19[_tokenId].field_1)] = mem[128 len ceil32(stor19[_tokenId].field_1)]
  if ceil32(stor19[_tokenId].field_1) > stor19[_tokenId].field_1:
      mem[stor19[_tokenId].field_1 + ceil32(stor19[_tokenId].field_1) + 192] = 0
  return Array(len=stor19[_tokenId].field_0, data=mem[128 len ceil32(stor19[_tokenId].field_1)], mem[(2 * ceil32(stor19[_tokenId].field_1)) + 192 len 2 * ceil32(stor19[_tokenId].field_1)]), 

def unknown2f2ff15d(uint256 _param1, uint256 _param2): # not payable
  require calldata.size - 4 >=′ 64
  require _param2 == addr(_param2)
  if caller != this.address:
      if not unknown248a9ca3[unknown248a9ca3[_param1].field_256][caller].field_0:
          mem[128 len 42] = call.data[calldata.size len 42]
          idx = 41
          s = caller
          while idx > 1:
              if s % 16 >= 16:
                  revert with 'NH{q', 50
              if idx >= 42:
                  revert with 'NH{q', 50
              mem[idx + 128 len 8] = Mask(8, -(0, 0) + 256, 0) << (0, 0) - 256
              if not idx:
                  revert with 'NH{q', 17
              idx = idx - 1
              s = Mask(252, 0, s) * 0.0625
              continue 
          if caller + 10240:
              revert with 0, 'Strings: hex length insufficient'
          mem[224 len 66] = call.data[calldata.size len 66]
          idx = 65
          s = unknown248a9ca3[_param1].field_256
          while idx > 1:
              if s % 16 >= 16:
                  revert with 'NH{q', 50
              if idx >= 66:
                  revert with 'NH{q', 50
              mem[idx + 224 len 8] = Mask(8, -(0, 0) + 256, 0) << (0, 0) - 256
              if not idx:
                  revert with 'NH{q', 17
              idx = idx - 1
              s = Mask(252, 0, s) * 0.0625
              continue 
          if unknown248a9ca3[_param1].field_256 + 16384:
              revert with 0, 'Strings: hex length insufficient'
          revert with 0, 32, 148, 'AccessControl: account ', mem[160 len 42], ' is missing role ', mem[288 len 66], 0, 0 >> 928, 0
      if unknown248a9ca3[_param1][addr(_param2)].field_0:
          if not unknown9010d07c[_param1][1][addr(_param2)].field_0:
              unknown9010d07c[_param1].field_0++
              unknown9010d07c[_param1][unknown9010d07c[_param1].field_0].field_0 = addr(_param2)
              unknown9010d07c[_param1][unknown9010d07c[_param1].field_0].field_160 = 0
              unknown9010d07c[_param1][1][addr(_param2)].field_0 = unknown9010d07c[_param1].field_0
      else:
          unknown248a9ca3[_param1][addr(_param2)].field_0 = 1
          if caller != this.address:
              log 0x2f878811: _param1, addr(_param2), caller
          else:
              mem[96] = calldata.size
              mem[128 len calldata.size] = call.data[0 len calldata.size]
              log 0x2f878811: _param1, addr(_param2), mem[calldata.size + 108 len 20]
          if not unknown9010d07c[_param1][1][addr(_param2)].field_0:
              unknown9010d07c[_param1].field_0++
              unknown9010d07c[_param1][unknown9010d07c[_param1].field_0].field_0 = addr(_param2)
              unknown9010d07c[_param1][unknown9010d07c[_param1].field_0].field_160 = 0
              unknown9010d07c[_param1][1][addr(_param2)].field_0 = unknown9010d07c[_param1].field_0
  else:
      mem[96] = calldata.size
      mem[128 len calldata.size] = call.data[0 len calldata.size]
      if not unknown248a9ca3[unknown248a9ca3[_param1].field_256][addr(mem[calldata.size + 96])].field_0:
          mem[ceil32(calldata.size) + 160 len 42] = call.data[calldata.size len 42]
          idx = 41
          s = mem[calldata.size + 108 len 20]
          while idx > 1:
              if s % 16 >= 16:
                  revert with 'NH{q', 50
              if idx >= 42:
                  revert with 'NH{q', 50
              mem[idx + ceil32(calldata.size) + 160 len 8] = Mask(8, -(0, 0) + 256, 0) << (0, 0) - 256
              if not idx:
                  revert with 'NH{q', 17
              idx = idx - 1
              s = Mask(252, 0, s) * 0.0625
              continue 
          if mem[calldata.size + 108 len 20] + 10240:
              revert with 0, 'Strings: hex length insufficient'
          mem[ceil32(calldata.size) + 256 len 66] = call.data[calldata.size len 66]
          idx = 65
          s = unknown248a9ca3[_param1].field_256
          while idx > 1:
              if s % 16 >= 16:
                  revert with 'NH{q', 50
              if idx >= 66:
                  revert with 'NH{q', 50
              mem[idx + ceil32(calldata.size) + 256 len 8] = Mask(8, -(0, 0) + 256, 0) << (0, 0) - 256
              if not idx:
                  revert with 'NH{q', 17
              idx = idx - 1
              s = Mask(252, 0, s) * 0.0625
              continue 
          if unknown248a9ca3[_param1].field_256 + 16384:
              revert with 0, 'Strings: hex length insufficient'
          revert with 0, 
                      32,
                      148,
                      'AccessControl: account ', mem[ceil32(calldata.size) + 192 len 42], ' is missing role ', mem[ceil32(calldata.size) + 320 len 66], 0, 0 >> 928,
                      0
      if unknown248a9ca3[_param1][addr(_param2)].field_0:
          if not unknown9010d07c[_param1][1][addr(_param2)].field_0:
              unknown9010d07c[_param1].field_0++
              unknown9010d07c[_param1][unknown9010d07c[_param1].field_0].field_0 = addr(_param2)
              unknown9010d07c[_param1][unknown9010d07c[_param1].field_0].field_160 = 0
              unknown9010d07c[_param1][1][addr(_param2)].field_0 = unknown9010d07c[_param1].field_0
      else:
          unknown248a9ca3[_param1][addr(_param2)].field_0 = 1
          if caller != this.address:
              log 0x2f878811: _param1, addr(_param2), caller
          else:
              mem[ceil32(calldata.size) + 128] = calldata.size
              mem[ceil32(calldata.size) + 160 len calldata.size] = call.data[0 len calldata.size]
              log 0x2f878811: _param1, addr(_param2), mem[calldata.size + ceil32(calldata.size) + 140 len 20]
          if not unknown9010d07c[_param1][1][addr(_param2)].field_0:
              unknown9010d07c[_param1].field_0++
              unknown9010d07c[_param1][unknown9010d07c[_param1].field_0].field_0 = addr(_param2)
              unknown9010d07c[_param1][unknown9010d07c[_param1].field_0].field_160 = 0
              unknown9010d07c[_param1][1][addr(_param2)].field_0 = unknown9010d07c[_param1].field_0

def burn(uint256 _value): # not payable
  require calldata.size - 4 >=′ 32
  if caller != this.address:
      if not ownerOf[_value]:
          revert with 0x8c379a000000000000000000000000000000000000000000000000000000000, 'ERC721: operator query for nonexistent token'
      if not ownerOf[_value]:
          revert with 0x8c379a000000000000000000000000000000000000000000000000000000000, 'ERC721: owner query for nonexistent token'
      if caller == ownerOf[_value]:
          if not ownerOf[_value]:
              revert with 0x8c379a000000000000000000000000000000000000000000000000000000000, 'ERC721: owner query for nonexistent token'
          if ownerOf[_value]:
              if not ownerOf[_value]:
                  revert with 0x8c379a000000000000000000000000000000000000000000000000000000000, 'ERC721: balance query for the zero address'
              if balanceOf[stor4[_value]] < 1:
                  revert with 'NH{q', 17
              if balanceOf[stor4[_value]] - 1 != stor9[_value]:
                  tokenOfOwnerByIndex[stor4[_value]][stor9[_value]] = tokenOfOwnerByIndex[stor4[_value]][stor5[stor4[_value]] - 1]
                  stor9[stor8[stor4[_value]][stor5[stor4[_value]] - 1]] = stor9[_value]
              stor9[_value] = 0
              tokenOfOwnerByIndex[stor4[_value]][stor5[stor4[_value]] - 1] = 0
          if tokenByIndex.length < 1:
              revert with 'NH{q', 17
          if tokenByIndex.length - 1 >= tokenByIndex.length:
              revert with 'NH{q', 50
          if stor11[_value] >= tokenByIndex.length:
              revert with 'NH{q', 50
          tokenByIndex[stor11[_value]] = tokenByIndex[tokenByIndex.length]
          stor11[stor10[stor10.length]] = stor11[_value]
          stor11[_value] = 0
          if not tokenByIndex.length:
              revert with 'NH{q', 49
          tokenByIndex[tokenByIndex.length] = 0
          tokenByIndex.length--
          approved[_value] = 0
          if not ownerOf[_value]:
              revert with 0x8c379a000000000000000000000000000000000000000000000000000000000, 'ERC721: owner query for nonexistent token'
      else:
          if not ownerOf[_value]:
              revert with 0x8c379a000000000000000000000000000000000000000000000000000000000, 'ERC721: approved query for nonexistent token'
          if approved[_value] == caller:
              if not ownerOf[_value]:
                  revert with 0x8c379a000000000000000000000000000000000000000000000000000000000, 'ERC721: owner query for nonexistent token'
              if ownerOf[_value]:
                  if not ownerOf[_value]:
                      revert with 0x8c379a000000000000000000000000000000000000000000000000000000000, 'ERC721: balance query for the zero address'
                  if balanceOf[stor4[_value]] < 1:
                      revert with 'NH{q', 17
                  if balanceOf[stor4[_value]] - 1 != stor9[_value]:
                      tokenOfOwnerByIndex[stor4[_value]][stor9[_value]] = tokenOfOwnerByIndex[stor4[_value]][stor5[stor4[_value]] - 1]
                      stor9[stor8[stor4[_value]][stor5[stor4[_value]] - 1]] = stor9[_value]
                  stor9[_value] = 0
                  tokenOfOwnerByIndex[stor4[_value]][stor5[stor4[_value]] - 1] = 0
              if tokenByIndex.length < 1:
                  revert with 'NH{q', 17
              if tokenByIndex.length - 1 >= tokenByIndex.length:
                  revert with 'NH{q', 50
              if stor11[_value] >= tokenByIndex.length:
                  revert with 'NH{q', 50
              tokenByIndex[stor11[_value]] = tokenByIndex[tokenByIndex.length]
              stor11[stor10[stor10.length]] = stor11[_value]
              stor11[_value] = 0
              if not tokenByIndex.length:
                  revert with 'NH{q', 49
              tokenByIndex[tokenByIndex.length] = 0
              tokenByIndex.length--
              approved[_value] = 0
              if not ownerOf[_value]:
                  revert with 0x8c379a000000000000000000000000000000000000000000000000000000000, 'ERC721: owner query for nonexistent token'
          else:
              static call stor20.proxies(address param1) with:
                      gas gas_remaining wei
                     args ownerOf[_value]
              if not ext_call.success:
                  revert with ext_call.return_data[0 len return_data.size]
              require return_data.size >=′ 32
              require ext_call.return_data == ext_call.return_data[12 len 20]
              if ext_call.return_data[12 len 20] != caller:
                  if not stor7[stor4[_value]][caller]:
                      revert with 0, 'ERC721Burnable: caller is not owner nor approved'
              if not ownerOf[_value]:
                  revert with 0, 'ERC721: owner query for nonexistent token'
              if ownerOf[_value]:
                  if not ownerOf[_value]:
                      revert with 0, 'ERC721: balance query for the zero address'
                  if balanceOf[stor4[_value]] < 1:
                      revert with 'NH{q', 17
                  if balanceOf[stor4[_value]] - 1 != stor9[_value]:
                      tokenOfOwnerByIndex[stor4[_value]][stor9[_value]] = tokenOfOwnerByIndex[stor4[_value]][stor5[stor4[_value]] - 1]
                      stor9[stor8[stor4[_value]][stor5[stor4[_value]] - 1]] = stor9[_value]
                  stor9[_value] = 0
                  tokenOfOwnerByIndex[stor4[_value]][stor5[stor4[_value]] - 1] = 0
              if tokenByIndex.length < 1:
                  revert with 'NH{q', 17
              if tokenByIndex.length - 1 >= tokenByIndex.length:
                  revert with 'NH{q', 50
              if stor11[_value] >= tokenByIndex.length:
                  revert with 'NH{q', 50
              tokenByIndex[stor11[_value]] = tokenByIndex[tokenByIndex.length]
              stor11[stor10[stor10.length]] = stor11[_value]
              stor11[_value] = 0
              if not tokenByIndex.length:
                  revert with 'NH{q', 49
              tokenByIndex[tokenByIndex.length] = 0
              tokenByIndex.length--
              approved[_value] = 0
              if not ownerOf[_value]:
                  revert with 0, 'ERC721: owner query for nonexistent token'
  else:
      mem[96] = calldata.size
      mem[128 len calldata.size] = call.data[0 len calldata.size]
      if not ownerOf[_value]:
          revert with 0, 'ERC721: operator query for nonexistent token'
      if not ownerOf[_value]:
          revert with 0, 'ERC721: owner query for nonexistent token'
      if mem[calldata.size + 108 len 20] != ownerOf[_value]:
          if not ownerOf[_value]:
              revert with 0, 'ERC721: approved query for nonexistent token'
          if approved[_value] != mem[calldata.size + 108 len 20]:
              static call stor20.proxies(address param1) with:
                      gas gas_remaining wei
                     args ownerOf[_value]
              if not ext_call.success:
                  revert with ext_call.return_data[0 len return_data.size]
              require return_data.size >=′ 32
              require ext_call.return_data == ext_call.return_data[12 len 20]
              if ext_call.return_datamem[calldata.size + 108 len 20]:
                  if not stor7[stor4[_value]][addr(mem[calldata.size + 96])]:
                      revert with 0, 'ERC721Burnable: caller is not owner nor approved'
      if not ownerOf[_value]:
          revert with 0, 'ERC721: owner query for nonexistent token'
      if ownerOf[_value]:
          if not ownerOf[_value]:
              revert with 0, 'ERC721: balance query for the zero address'
          if balanceOf[stor4[_value]] < 1:
              revert with 'NH{q', 17
          if balanceOf[stor4[_value]] - 1 != stor9[_value]:
              tokenOfOwnerByIndex[stor4[_value]][stor9[_value]] = tokenOfOwnerByIndex[stor4[_value]][stor5[stor4[_value]] - 1]
              stor9[stor8[stor4[_value]][stor5[stor4[_value]] - 1]] = stor9[_value]
          stor9[_value] = 0
          tokenOfOwnerByIndex[stor4[_value]][stor5[stor4[_value]] - 1] = 0
      if tokenByIndex.length < 1:
          revert with 'NH{q', 17
      if tokenByIndex.length - 1 >= tokenByIndex.length:
          revert with 'NH{q', 50
      if stor11[_value] >= tokenByIndex.length:
          revert with 'NH{q', 50
      tokenByIndex[stor11[_value]] = tokenByIndex[tokenByIndex.length]
      stor11[stor10[stor10.length]] = stor11[_value]
      stor11[_value] = 0
      if not tokenByIndex.length:
          revert with 'NH{q', 49
      tokenByIndex[tokenByIndex.length] = 0
      tokenByIndex.length--
      approved[_value] = 0
      if not ownerOf[_value]:
          revert with 0, 'ERC721: owner query for nonexistent token'
  ('bool', ('stor', ('map', ('param', '_value'), ('name', 'ownerOf', 4))))
  log Approval(
        address owner=ownerOf[_value],
        address spender=0,
        uint256 value=_value)
  if balanceOf[stor4[_value]] < 1:
      revert with 'NH{q', 17
  balanceOf[stor4[_value]]--
  ownerOf[_value] = 0
  log Transfer(
        address from=ownerOf[_value],
        address to=0,
        uint256 value=_value)

def transferFrom(address _from, address _to, uint256 _value): # not payable
  require calldata.size - 4 >=′ 96
  require _from == _from
  require _to == _to
  if caller != this.address:
      if not ownerOf[_value]:
          revert with 0x8c379a000000000000000000000000000000000000000000000000000000000, 'ERC721: operator query for nonexistent token'
      if not ownerOf[_value]:
          revert with 0x8c379a000000000000000000000000000000000000000000000000000000000, 'ERC721: owner query for nonexistent token'
      if caller == ownerOf[_value]:
          if not ownerOf[_value]:
              revert with 0x8c379a000000000000000000000000000000000000000000000000000000000, 'ERC721: owner query for nonexistent token'
          if ownerOf[_value] != _from:
              revert with 0x8c379a000000000000000000000000000000000000000000000000000000000, 'ERC721: transfer of token that is not own'
          if not _to:
              revert with 0x8c379a000000000000000000000000000000000000000000000000000000000, 'ERC721: transfer to the zero address'
          if not _from:
              stor11[_value] = tokenByIndex.length
              tokenByIndex.length++
              tokenByIndex[tokenByIndex.length] = _value
          else:
              if _from != _to:
                  if not _from:
                      revert with 0x8c379a000000000000000000000000000000000000000000000000000000000, 'ERC721: balance query for the zero address'
                  if balanceOf[addr(_from)] < 1:
                      revert with 'NH{q', 17
                  if balanceOf[addr(_from)] - 1 != stor9[_value]:
                      tokenOfOwnerByIndex[addr(_from)][stor9[_value]] = tokenOfOwnerByIndex[addr(_from)][stor5[addr(_from)] - 1]
                      stor9[stor8[addr(_from)][stor5[addr(_from)] - 1]] = stor9[_value]
                  stor9[_value] = 0
                  tokenOfOwnerByIndex[addr(_from)][stor5[addr(_from)] - 1] = 0
          if _to:
              if _to != _from:
                  if not _to:
                      revert with 0x8c379a000000000000000000000000000000000000000000000000000000000, 'ERC721: balance query for the zero address'
                  tokenOfOwnerByIndex[addr(_to)][stor5[addr(_to)]] = _value
                  stor9[_value] = balanceOf[addr(_to)]
          else:
              if tokenByIndex.length < 1:
                  revert with 'NH{q', 17
              if tokenByIndex.length - 1 >= tokenByIndex.length:
                  revert with 'NH{q', 50
              if stor11[_value] >= tokenByIndex.length:
                  revert with 'NH{q', 50
              tokenByIndex[stor11[_value]] = tokenByIndex[tokenByIndex.length]
              stor11[stor10[stor10.length]] = stor11[_value]
              stor11[_value] = 0
              if not tokenByIndex.length:
                  revert with 'NH{q', 49
              tokenByIndex[tokenByIndex.length] = 0
              tokenByIndex.length--
          approved[_value] = 0
          if not ownerOf[_value]:
              revert with 0x8c379a000000000000000000000000000000000000000000000000000000000, 'ERC721: owner query for nonexistent token'
      else:
          if not ownerOf[_value]:
              revert with 0x8c379a000000000000000000000000000000000000000000000000000000000, 'ERC721: approved query for nonexistent token'
          if approved[_value] == caller:
              if not ownerOf[_value]:
                  revert with 0x8c379a000000000000000000000000000000000000000000000000000000000, 'ERC721: owner query for nonexistent token'
              if ownerOf[_value] != _from:
                  revert with 0x8c379a000000000000000000000000000000000000000000000000000000000, 'ERC721: transfer of token that is not own'
              if not _to:
                  revert with 0x8c379a000000000000000000000000000000000000000000000000000000000, 'ERC721: transfer to the zero address'
              if not _from:
                  stor11[_value] = tokenByIndex.length
                  tokenByIndex.length++
                  tokenByIndex[tokenByIndex.length] = _value
              else:
                  if _from != _to:
                      if not _from:
                          revert with 0x8c379a000000000000000000000000000000000000000000000000000000000, 'ERC721: balance query for the zero address'
                      if balanceOf[addr(_from)] < 1:
                          revert with 'NH{q', 17
                      if balanceOf[addr(_from)] - 1 != stor9[_value]:
                          tokenOfOwnerByIndex[addr(_from)][stor9[_value]] = tokenOfOwnerByIndex[addr(_from)][stor5[addr(_from)] - 1]
                          stor9[stor8[addr(_from)][stor5[addr(_from)] - 1]] = stor9[_value]
                      stor9[_value] = 0
                      tokenOfOwnerByIndex[addr(_from)][stor5[addr(_from)] - 1] = 0
              if _to:
                  if _to != _from:
                      if not _to:
                          revert with 0x8c379a000000000000000000000000000000000000000000000000000000000, 'ERC721: balance query for the zero address'
                      tokenOfOwnerByIndex[addr(_to)][stor5[addr(_to)]] = _value
                      stor9[_value] = balanceOf[addr(_to)]
              else:
                  if tokenByIndex.length < 1:
                      revert with 'NH{q', 17
                  if tokenByIndex.length - 1 >= tokenByIndex.length:
                      revert with 'NH{q', 50
                  if stor11[_value] >= tokenByIndex.length:
                      revert with 'NH{q', 50
                  tokenByIndex[stor11[_value]] = tokenByIndex[tokenByIndex.length]
                  stor11[stor10[stor10.length]] = stor11[_value]
                  stor11[_value] = 0
                  if not tokenByIndex.length:
                      revert with 'NH{q', 49
                  tokenByIndex[tokenByIndex.length] = 0
                  tokenByIndex.length--
              approved[_value] = 0
              if not ownerOf[_value]:
                  revert with 0x8c379a000000000000000000000000000000000000000000000000000000000, 'ERC721: owner query for nonexistent token'
          else:
              static call stor20.proxies(address param1) with:
                      gas gas_remaining wei
                     args ownerOf[_value]
              if not ext_call.success:
                  revert with ext_call.return_data[0 len return_data.size]
              require return_data.size >=′ 32
              require ext_call.return_data == ext_call.return_data[12 len 20]
              if ext_call.return_data[12 len 20] != caller:
                  if not stor7[stor4[_value]][caller]:
                      revert with 0, 'ERC721: transfer caller is not owner nor approved'
              if not ownerOf[_value]:
                  revert with 0, 'ERC721: owner query for nonexistent token'
              if ownerOf[_value] != _from:
                  revert with 0, 'ERC721: transfer of token that is not own'
              if not _to:
                  revert with 0, 'ERC721: transfer to the zero address'
              if not _from:
                  stor11[_value] = tokenByIndex.length
                  tokenByIndex.length++
                  tokenByIndex[tokenByIndex.length] = _value
              else:
                  if _from != _to:
                      if not _from:
                          revert with 0, 'ERC721: balance query for the zero address'
                      if balanceOf[addr(_from)] < 1:
                          revert with 'NH{q', 17
                      if balanceOf[addr(_from)] - 1 != stor9[_value]:
                          tokenOfOwnerByIndex[addr(_from)][stor9[_value]] = tokenOfOwnerByIndex[addr(_from)][stor5[addr(_from)] - 1]
                          stor9[stor8[addr(_from)][stor5[addr(_from)] - 1]] = stor9[_value]
                      stor9[_value] = 0
                      tokenOfOwnerByIndex[addr(_from)][stor5[addr(_from)] - 1] = 0
              if _to:
                  if _to != _from:
                      if not _to:
                          revert with 0, 'ERC721: balance query for the zero address'
                      tokenOfOwnerByIndex[addr(_to)][stor5[addr(_to)]] = _value
                      stor9[_value] = balanceOf[addr(_to)]
              else:
                  if tokenByIndex.length < 1:
                      revert with 'NH{q', 17
                  if tokenByIndex.length - 1 >= tokenByIndex.length:
                      revert with 'NH{q', 50
                  if stor11[_value] >= tokenByIndex.length:
                      revert with 'NH{q', 50
                  tokenByIndex[stor11[_value]] = tokenByIndex[tokenByIndex.length]
                  stor11[stor10[stor10.length]] = stor11[_value]
                  stor11[_value] = 0
                  if not tokenByIndex.length:
                      revert with 'NH{q', 49
                  tokenByIndex[tokenByIndex.length] = 0
                  tokenByIndex.length--
              approved[_value] = 0
              if not ownerOf[_value]:
                  revert with 0, 'ERC721: owner query for nonexistent token'
  else:
      mem[96] = calldata.size
      mem[128 len calldata.size] = call.data[0 len calldata.size]
      if not ownerOf[_value]:
          revert with 0, 'ERC721: operator query for nonexistent token'
      if not ownerOf[_value]:
          revert with 0, 'ERC721: owner query for nonexistent token'
      if mem[calldata.size + 108 len 20] != ownerOf[_value]:
          if not ownerOf[_value]:
              revert with 0, 'ERC721: approved query for nonexistent token'
          if approved[_value] != mem[calldata.size + 108 len 20]:
              static call stor20.proxies(address param1) with:
                      gas gas_remaining wei
                     args ownerOf[_value]
              if not ext_call.success:
                  revert with ext_call.return_data[0 len return_data.size]
              require return_data.size >=′ 32
              require ext_call.return_data == ext_call.return_data[12 len 20]
              if ext_call.return_datamem[calldata.size + 108 len 20]:
                  if not stor7[stor4[_value]][addr(mem[calldata.size + 96])]:
                      revert with 0, 'ERC721: transfer caller is not owner nor approved'
      if not ownerOf[_value]:
          revert with 0, 'ERC721: owner query for nonexistent token'
      if ownerOf[_value] != _from:
          revert with 0, 'ERC721: transfer of token that is not own'
      if not _to:
          revert with 0, 'ERC721: transfer to the zero address'
      if not _from:
          stor11[_value] = tokenByIndex.length
          tokenByIndex.length++
          tokenByIndex[tokenByIndex.length] = _value
      else:
          if _from != _to:
              if not _from:
                  revert with 0, 'ERC721: balance query for the zero address'
              if balanceOf[addr(_from)] < 1:
                  revert with 'NH{q', 17
              if balanceOf[addr(_from)] - 1 != stor9[_value]:
                  tokenOfOwnerByIndex[addr(_from)][stor9[_value]] = tokenOfOwnerByIndex[addr(_from)][stor5[addr(_from)] - 1]
                  stor9[stor8[addr(_from)][stor5[addr(_from)] - 1]] = stor9[_value]
              stor9[_value] = 0
              tokenOfOwnerByIndex[addr(_from)][stor5[addr(_from)] - 1] = 0
      if _to:
          if _to != _from:
              if not _to:
                  revert with 0, 'ERC721: balance query for the zero address'
              tokenOfOwnerByIndex[addr(_to)][stor5[addr(_to)]] = _value
              stor9[_value] = balanceOf[addr(_to)]
      else:
          if tokenByIndex.length < 1:
              revert with 'NH{q', 17
          if tokenByIndex.length - 1 >= tokenByIndex.length:
              revert with 'NH{q', 50
          if stor11[_value] >= tokenByIndex.length:
              revert with 'NH{q', 50
          tokenByIndex[stor11[_value]] = tokenByIndex[tokenByIndex.length]
          stor11[stor10[stor10.length]] = stor11[_value]
          stor11[_value] = 0
          if not tokenByIndex.length:
              revert with 'NH{q', 49
          tokenByIndex[tokenByIndex.length] = 0
          tokenByIndex.length--
      approved[_value] = 0
      if not ownerOf[_value]:
          revert with 0, 'ERC721: owner query for nonexistent token'
  ('bool', ('stor', ('map', ('param', '_value'), ('name', 'ownerOf', 4))))
  log Approval(
        address owner=ownerOf[_value],
        address spender=0,
        uint256 value=_value)
  if balanceOf[addr(_from)] < 1:
      revert with 'NH{q', 17
  balanceOf[addr(_from)]--
  if balanceOf[addr(_to)] > -2:
      revert with 'NH{q', 17
  balanceOf[addr(_to)]++
  ownerOf[_value] = _to
  log Transfer(
        address from=_from,
        address to=_to,
        uint256 value=_value)

def unknowne8a3d485(): # not payable
  if bool(stor17.length):
      if bool(stor17.length) == uint255(stor17.length) * 0.5 < 32:
          revert with 'NH{q', 34
      if bool(stor17.length):
          if bool(stor17.length) == uint255(stor17.length) * 0.5 < 32:
              revert with 'NH{q', 34
          if not Mask(256, -1, stor17.length):
              mem[ceil32(uint255(stor17.length) * 0.5) + 160 len ceil32(uint255(stor17.length) * 0.5)] = mem[128 len ceil32(uint255(stor17.length) * 0.5)]
              mem[ceil32(uint255(stor17.length) * 0.5) + (uint255(stor17.length) * 0.5) + 160] = '/contract'
              mem[ceil32(uint255(stor17.length) * 0.5) + (uint255(stor17.length) * 0.5) + 169] = 32
              mem[ceil32(uint255(stor17.length) * 0.5) + (uint255(stor17.length) * 0.5) + 201] = mem[ceil32(uint255(stor17.length) * 0.5) + 128]
              mem[ceil32(uint255(stor17.length) * 0.5) + (uint255(stor17.length) * 0.5) + 233 len ceil32(mem[ceil32(uint255(stor17.length) * 0.5) + 128])] = mem[ceil32(uint255(stor17.length) * 0.5) + 160 len ceil32(mem[ceil32(uint255(stor17.length) * 0.5) + 128])]
              if ceil32(mem[ceil32(uint255(stor17.length) * 0.5) + 128]) > mem[ceil32(uint255(stor17.length) * 0.5) + 128]:
                  mem[mem[ceil32(uint255(stor17.length) * 0.5) + 128] + ceil32(uint255(stor17.length) * 0.5) + (uint255(stor17.length) * 0.5) + 233] = 0
          else:
              if 31 >= uint255(stor17.length) * 0.5:
                  mem[128] = 256 * stor17.length.field_8
              else:
                  mem[128] = uint256(stor17.field_0)
                  idx = 128
                  s = 0
                  while (uint255(stor17.length) * 0.5) + 96 > idx:
                      mem[idx + 32] = stor17[s].field_256
                      idx = idx + 32
                      s = s + 1
                      continue 
              mem[ceil32(uint255(stor17.length) * 0.5) + 160 len ceil32(uint255(stor17.length) * 0.5)] = mem[128 len ceil32(uint255(stor17.length) * 0.5)]
              mem[ceil32(uint255(stor17.length) * 0.5) + (uint255(stor17.length) * 0.5) + 160] = '/contract'
              mem[ceil32(uint255(stor17.length) * 0.5) + (uint255(stor17.length) * 0.5) + 169] = 32
              mem[ceil32(uint255(stor17.length) * 0.5) + (uint255(stor17.length) * 0.5) + 201] = mem[ceil32(uint255(stor17.length) * 0.5) + 128]
              mem[ceil32(uint255(stor17.length) * 0.5) + (uint255(stor17.length) * 0.5) + 233 len ceil32(mem[ceil32(uint255(stor17.length) * 0.5) + 128])] = mem[ceil32(uint255(stor17.length) * 0.5) + 160 len ceil32(mem[ceil32(uint255(stor17.length) * 0.5) + 128])]
              if ceil32(mem[ceil32(uint255(stor17.length) * 0.5) + 128]) > mem[ceil32(uint255(stor17.length) * 0.5) + 128]:
                  mem[mem[ceil32(uint255(stor17.length) * 0.5) + 128] + ceil32(uint255(stor17.length) * 0.5) + (uint255(stor17.length) * 0.5) + 233] = 0
      else:
          if bool(stor17.length) == stor17.length.field_1 < 32:
              revert with 'NH{q', 34
          if not stor17.length.field_1:
              mem[ceil32(uint255(stor17.length) * 0.5) + 160 len ceil32(uint255(stor17.length) * 0.5)] = mem[128 len ceil32(uint255(stor17.length) * 0.5)]
              mem[ceil32(uint255(stor17.length) * 0.5) + (uint255(stor17.length) * 0.5) + 160] = '/contract'
              mem[ceil32(uint255(stor17.length) * 0.5) + (uint255(stor17.length) * 0.5) + 169] = 32
              mem[ceil32(uint255(stor17.length) * 0.5) + (uint255(stor17.length) * 0.5) + 201] = mem[ceil32(uint255(stor17.length) * 0.5) + 128]
              mem[ceil32(uint255(stor17.length) * 0.5) + (uint255(stor17.length) * 0.5) + 233 len ceil32(mem[ceil32(uint255(stor17.length) * 0.5) + 128])] = mem[ceil32(uint255(stor17.length) * 0.5) + 160 len ceil32(mem[ceil32(uint255(stor17.length) * 0.5) + 128])]
              if ceil32(mem[ceil32(uint255(stor17.length) * 0.5) + 128]) > mem[ceil32(uint255(stor17.length) * 0.5) + 128]:
                  mem[mem[ceil32(uint255(stor17.length) * 0.5) + 128] + ceil32(uint255(stor17.length) * 0.5) + (uint255(stor17.length) * 0.5) + 233] = 0
          else:
              if 31 >= stor17.length.field_1:
                  mem[128] = 256 * stor17.length.field_8
              else:
                  mem[128] = uint256(stor17.field_0)
                  idx = 128
                  s = 0
                  while stor17.length.field_1 + 96 > idx:
                      mem[idx + 32] = stor17[s].field_256
                      idx = idx + 32
                      s = s + 1
                      continue 
              mem[ceil32(uint255(stor17.length) * 0.5) + 160 len ceil32(uint255(stor17.length) * 0.5)] = mem[128 len ceil32(uint255(stor17.length) * 0.5)]
              mem[ceil32(uint255(stor17.length) * 0.5) + (uint255(stor17.length) * 0.5) + 160] = '/contract'
              mem[ceil32(uint255(stor17.length) * 0.5) + (uint255(stor17.length) * 0.5) + 169] = 32
              mem[ceil32(uint255(stor17.length) * 0.5) + (uint255(stor17.length) * 0.5) + 201] = mem[ceil32(uint255(stor17.length) * 0.5) + 128]
              mem[ceil32(uint255(stor17.length) * 0.5) + (uint255(stor17.length) * 0.5) + 233 len ceil32(mem[ceil32(uint255(stor17.length) * 0.5) + 128])] = mem[ceil32(uint255(stor17.length) * 0.5) + 160 len ceil32(mem[ceil32(uint255(stor17.length) * 0.5) + 128])]
              if ceil32(mem[ceil32(uint255(stor17.length) * 0.5) + 128]) > mem[ceil32(uint255(stor17.length) * 0.5) + 128]:
                  mem[mem[ceil32(uint255(stor17.length) * 0.5) + 128] + ceil32(uint255(stor17.length) * 0.5) + (uint255(stor17.length) * 0.5) + 233] = 0
      return Array(len=mem[ceil32(uint255(stor17.length) * 0.5) + 128], data=mem[ceil32(uint255(stor17.length) * 0.5) + (uint255(stor17.length) * 0.5) + 233 len ceil32(mem[ceil32(uint255(stor17.length) * 0.5) + 128])]), 
  if bool(stor17.length) == stor17.length.field_1 < 32:
      revert with 'NH{q', 34
  if bool(stor17.length):
      if bool(stor17.length) == uint255(stor17.length) * 0.5 < 32:
          revert with 'NH{q', 34
      if not Mask(256, -1, stor17.length):
          mem[ceil32(stor17.length.field_1) + 160 len ceil32(stor17.length.field_1)] = mem[128 len ceil32(stor17.length.field_1)]
          mem[ceil32(stor17.length.field_1) + stor17.length.field_1 + 160] = '/contract'
          mem[ceil32(stor17.length.field_1) + stor17.length.field_1 + 169] = 32
          mem[ceil32(stor17.length.field_1) + stor17.length.field_1 + 201] = mem[ceil32(stor17.length.field_1) + 128]
          mem[ceil32(stor17.length.field_1) + stor17.length.field_1 + 233 len ceil32(mem[ceil32(stor17.length.field_1) + 128])] = mem[ceil32(stor17.length.field_1) + 160 len ceil32(mem[ceil32(stor17.length.field_1) + 128])]
          if ceil32(mem[ceil32(stor17.length.field_1) + 128]) > mem[ceil32(stor17.length.field_1) + 128]:
              mem[mem[ceil32(stor17.length.field_1) + 128] + ceil32(stor17.length.field_1) + stor17.length.field_1 + 233] = 0
      else:
          if 31 >= uint255(stor17.length) * 0.5:
              mem[128] = 256 * stor17.length.field_8
          else:
              mem[128] = uint256(stor17.field_0)
              idx = 128
              s = 0
              while (uint255(stor17.length) * 0.5) + 96 > idx:
                  mem[idx + 32] = stor17[s].field_256
                  idx = idx + 32
                  s = s + 1
                  continue 
          mem[ceil32(stor17.length.field_1) + 160 len ceil32(stor17.length.field_1)] = mem[128 len ceil32(stor17.length.field_1)]
          mem[ceil32(stor17.length.field_1) + stor17.length.field_1 + 160] = '/contract'
          mem[ceil32(stor17.length.field_1) + stor17.length.field_1 + 169] = 32
          mem[ceil32(stor17.length.field_1) + stor17.length.field_1 + 201] = mem[ceil32(stor17.length.field_1) + 128]
          mem[ceil32(stor17.length.field_1) + stor17.length.field_1 + 233 len ceil32(mem[ceil32(stor17.length.field_1) + 128])] = mem[ceil32(stor17.length.field_1) + 160 len ceil32(mem[ceil32(stor17.length.field_1) + 128])]
          if ceil32(mem[ceil32(stor17.length.field_1) + 128]) > mem[ceil32(stor17.length.field_1) + 128]:
              mem[mem[ceil32(stor17.length.field_1) + 128] + ceil32(stor17.length.field_1) + stor17.length.field_1 + 233] = 0
  else:
      if bool(stor17.length) == stor17.length.field_1 < 32:
          revert with 'NH{q', 34
      if not stor17.length.field_1:
          mem[ceil32(stor17.length.field_1) + 160 len ceil32(stor17.length.field_1)] = mem[128 len ceil32(stor17.length.field_1)]
          mem[ceil32(stor17.length.field_1) + stor17.length.field_1 + 160] = '/contract'
          mem[ceil32(stor17.length.field_1) + stor17.length.field_1 + 169] = 32
          mem[ceil32(stor17.length.field_1) + stor17.length.field_1 + 201] = mem[ceil32(stor17.length.field_1) + 128]
          mem[ceil32(stor17.length.field_1) + stor17.length.field_1 + 233 len ceil32(mem[ceil32(stor17.length.field_1) + 128])] = mem[ceil32(stor17.length.field_1) + 160 len ceil32(mem[ceil32(stor17.length.field_1) + 128])]
          if ceil32(mem[ceil32(stor17.length.field_1) + 128]) > mem[ceil32(stor17.length.field_1) + 128]:
              mem[mem[ceil32(stor17.length.field_1) + 128] + ceil32(stor17.length.field_1) + stor17.length.field_1 + 233] = 0
      else:
          if 31 >= stor17.length.field_1:
              mem[128] = 256 * stor17.length.field_8
          else:
              mem[128] = uint256(stor17.field_0)
              idx = 128
              s = 0
              while stor17.length.field_1 + 96 > idx:
                  mem[idx + 32] = stor17[s].field_256
                  idx = idx + 32
                  s = s + 1
                  continue 
          mem[ceil32(stor17.length.field_1) + 160 len ceil32(stor17.length.field_1)] = mem[128 len ceil32(stor17.length.field_1)]
          mem[ceil32(stor17.length.field_1) + stor17.length.field_1 + 160] = '/contract'
          mem[ceil32(stor17.length.field_1) + stor17.length.field_1 + 169] = 32
          mem[ceil32(stor17.length.field_1) + stor17.length.field_1 + 201] = mem[ceil32(stor17.length.field_1) + 128]
          mem[ceil32(stor17.length.field_1) + stor17.length.field_1 + 233 len ceil32(mem[ceil32(stor17.length.field_1) + 128])] = mem[ceil32(stor17.length.field_1) + 160 len ceil32(mem[ceil32(stor17.length.field_1) + 128])]
          if ceil32(mem[ceil32(stor17.length.field_1) + 128]) > mem[ceil32(stor17.length.field_1) + 128]:
              mem[mem[ceil32(stor17.length.field_1) + 128] + ceil32(stor17.length.field_1) + stor17.length.field_1 + 233] = 0
  return Array(len=mem[ceil32(stor17.length.field_1) + 128], data=mem[ceil32(stor17.length.field_1) + stor17.length.field_1 + 233 len ceil32(mem[ceil32(stor17.length.field_1) + 128])]), 

def unknowne346c6ba(uint256 _param1): # not payable
  require calldata.size - 4 >=′ 32
  if not ownerOf[_param1]:
      revert with 0x8c379a000000000000000000000000000000000000000000000000000000000, 'preferredURL query for nonexistent token'
  if stor19[_param1].field_0:
      if stor19[_param1].field_0 == uint255(stor19[_param1].field_0) * 0.5 < 32:
          revert with 'NH{q', 34
      if stor19[_param1].field_0:
          if stor19[_param1].field_0 == uint255(stor19[_param1].field_0) * 0.5 < 32:
              revert with 'NH{q', 34
          if not Mask(256, -1, stor19[_param1].field_0):
              if Mask(256, -1, stor19[_param1].field_0):
                  mem[ceil32(uint255(stor19[_param1].field_0) * 0.5) + 192 len ceil32(uint255(stor19[_param1].field_0) * 0.5)] = mem[128 len ceil32(uint255(stor19[_param1].field_0) * 0.5)]
                  if ceil32(uint255(stor19[_param1].field_0) * 0.5) > uint255(stor19[_param1].field_0) * 0.5:
                      mem[(uint255(stor19[_param1].field_0) * 0.5) + ceil32(uint255(stor19[_param1].field_0) * 0.5) + 192] = 0
                  return Array(len=2 * Mask(256, -1, stor19[_param1].field_0), data=mem[128 len ceil32(uint255(stor19[_param1].field_0) * 0.5)], mem[(2 * ceil32(uint255(stor19[_param1].field_0) * 0.5)) + 192 len 2 * ceil32(uint255(stor19[_param1].field_0) * 0.5)]), 
              if not ownerOf[_param1]:
                  revert with 0, 'URI query for nonexistent token'
              if not stor19[_param1].field_0:
                  if stor19[_param1].field_0 == stor19[_param1].field_1 < 32:
                      revert with 'NH{q', 34
                  if stor19[_param1].field_0:
                      if stor19[_param1].field_0 == uint255(stor19[_param1].field_0) * 0.5 < 32:
                          revert with 'NH{q', 34
                      if Mask(256, -1, stor19[_param1].field_0):
                          if 31 < uint255(stor19[_param1].field_0) * 0.5:
                              mem[ceil32(uint255(stor19[_param1].field_0) * 0.5) + 160] = stor19[_param1].field_0
                              idx = ceil32(uint255(stor19[_param1].field_0) * 0.5) + 160
                              s = 0
                              while ceil32(uint255(stor19[_param1].field_0) * 0.5) + (uint255(stor19[_param1].field_0) * 0.5) + 128 > idx:
                                  mem[idx + 32] = stor19[_param1][s].field_256
                                  idx = idx + 32
                                  s = s + 1
                                  continue 
                              return Array(len=stor19[_param1].field_0, data=mem[ceil32(uint255(stor19[_param1].field_0) * 0.5) + 160 len ceil32(stor19[_param1].field_1)]), 
                          mem[ceil32(uint255(stor19[_param1].field_0) * 0.5) + 160] = 256 * stor19[_param1].field_8
                  else:
                      if stor19[_param1].field_0 == stor19[_param1].field_1 < 32:
                          revert with 'NH{q', 34
                      if stor19[_param1].field_1:
                          if 31 < stor19[_param1].field_1:
                              mem[ceil32(uint255(stor19[_param1].field_0) * 0.5) + 160] = stor19[_param1].field_0
                              idx = ceil32(uint255(stor19[_param1].field_0) * 0.5) + 160
                              s = 0
                              while ceil32(uint255(stor19[_param1].field_0) * 0.5) + stor19[_param1].field_1 + 128 > idx:
                                  mem[idx + 32] = stor19[_param1][s].field_256
                                  idx = idx + 32
                                  s = s + 1
                                  continue 
                              return Array(len=stor19[_param1].field_0, data=mem[ceil32(uint255(stor19[_param1].field_0) * 0.5) + 160 len ceil32(stor19[_param1].field_1)]), 
                          mem[ceil32(uint255(stor19[_param1].field_0) * 0.5) + 160] = 256 * stor19[_param1].field_8
                  mem[ceil32(uint255(stor19[_param1].field_0) * 0.5) + ceil32(stor19[_param1].field_1) + 224 len ceil32(stor19[_param1].field_1)] = mem[ceil32(uint255(stor19[_param1].field_0) * 0.5) + 160 len ceil32(stor19[_param1].field_1)]
                  if ceil32(stor19[_param1].field_1) > stor19[_param1].field_1:
                      mem[stor19[_param1].field_1 + ceil32(uint255(stor19[_param1].field_0) * 0.5) + ceil32(stor19[_param1].field_1) + 224] = 0
                  return Array(len=stor19[_param1].field_0, data=mem[ceil32(uint255(stor19[_param1].field_0) * 0.5) + 160 len ceil32(stor19[_param1].field_1)], mem[ceil32(uint255(stor19[_param1].field_0) * 0.5) + (2 * ceil32(stor19[_param1].field_1)) + 224 len 2 * ceil32(stor19[_param1].field_1)]), 
              if stor19[_param1].field_0 == uint255(stor19[_param1].field_0) * 0.5 < 32:
                  revert with 'NH{q', 34
              if stor19[_param1].field_0:
                  if stor19[_param1].field_0 == uint255(stor19[_param1].field_0) * 0.5 < 32:
                      revert with 'NH{q', 34
                  if not Mask(256, -1, stor19[_param1].field_0):
                      mem[(2 * ceil32(uint255(stor19[_param1].field_0) * 0.5)) + 160] = 32
                      mem[(2 * ceil32(uint255(stor19[_param1].field_0) * 0.5)) + 192] = uint255(stor19[_param1].field_0) * 0.5
                      mem[(2 * ceil32(uint255(stor19[_param1].field_0) * 0.5)) + 224 len ceil32(uint255(stor19[_param1].field_0) * 0.5)] = mem[ceil32(uint255(stor19[_param1].field_0) * 0.5) + 160 len ceil32(uint255(stor19[_param1].field_0) * 0.5)]
                      if ceil32(uint255(stor19[_param1].field_0) * 0.5) > uint255(stor19[_param1].field_0) * 0.5:
                          mem[(uint255(stor19[_param1].field_0) * 0.5) + (2 * ceil32(uint255(stor19[_param1].field_0) * 0.5)) + 224] = 0
                      return memory
                        from (2 * ceil32(uint255(stor19[_param1].field_0) * 0.5)) + 160
                         len (6 * ceil32(uint255(stor19[_param1].field_0) * 0.5)) + 64
                  if 31 >= uint255(stor19[_param1].field_0) * 0.5:
                      mem[ceil32(uint255(stor19[_param1].field_0) * 0.5) + 160] = 256 * stor19[_param1].field_8
                      mem[(2 * ceil32(uint255(stor19[_param1].field_0) * 0.5)) + 160] = 32
                      mem[(2 * ceil32(uint255(stor19[_param1].field_0) * 0.5)) + 192] = uint255(stor19[_param1].field_0) * 0.5
                      mem[(2 * ceil32(uint255(stor19[_param1].field_0) * 0.5)) + 224 len ceil32(uint255(stor19[_param1].field_0) * 0.5)] = mem[ceil32(uint255(stor19[_param1].field_0) * 0.5) + 160 len ceil32(uint255(stor19[_param1].field_0) * 0.5)]
                      if ceil32(uint255(stor19[_param1].field_0) * 0.5) > uint255(stor19[_param1].field_0) * 0.5:
                          mem[(uint255(stor19[_param1].field_0) * 0.5) + (2 * ceil32(uint255(stor19[_param1].field_0) * 0.5)) + 224] = 0
                      return memory
                        from (2 * ceil32(uint255(stor19[_param1].field_0) * 0.5)) + 160
                         len (6 * ceil32(uint255(stor19[_param1].field_0) * 0.5)) + 64
                  mem[ceil32(uint255(stor19[_param1].field_0) * 0.5) + 160] = stor19[_param1].field_0
                  idx = ceil32(uint255(stor19[_param1].field_0) * 0.5) + 160
                  s = 0
                  while ceil32(uint255(stor19[_param1].field_0) * 0.5) + (uint255(stor19[_param1].field_0) * 0.5) + 128 > idx:
                      mem[idx + 32] = stor19[_param1][s].field_256
                      idx = idx + 32
                      s = s + 1
                      continue 
              else:
                  if stor19[_param1].field_0 == stor19[_param1].field_1 < 32:
                      revert with 'NH{q', 34
                  if not stor19[_param1].field_1:
                      mem[(2 * ceil32(uint255(stor19[_param1].field_0) * 0.5)) + 160] = 32
                      mem[(2 * ceil32(uint255(stor19[_param1].field_0) * 0.5)) + 192] = uint255(stor19[_param1].field_0) * 0.5
                      mem[(2 * ceil32(uint255(stor19[_param1].field_0) * 0.5)) + 224 len ceil32(uint255(stor19[_param1].field_0) * 0.5)] = mem[ceil32(uint255(stor19[_param1].field_0) * 0.5) + 160 len ceil32(uint255(stor19[_param1].field_0) * 0.5)]
                      if ceil32(uint255(stor19[_param1].field_0) * 0.5) > uint255(stor19[_param1].field_0) * 0.5:
                          mem[(uint255(stor19[_param1].field_0) * 0.5) + (2 * ceil32(uint255(stor19[_param1].field_0) * 0.5)) + 224] = 0
                      return memory
                        from (2 * ceil32(uint255(stor19[_param1].field_0) * 0.5)) + 160
                         len (6 * ceil32(uint255(stor19[_param1].field_0) * 0.5)) + 64
                  if 31 >= stor19[_param1].field_1:
                      mem[ceil32(uint255(stor19[_param1].field_0) * 0.5) + 160] = 256 * stor19[_param1].field_8
                      mem[(2 * ceil32(uint255(stor19[_param1].field_0) * 0.5)) + 160] = 32
                      mem[(2 * ceil32(uint255(stor19[_param1].field_0) * 0.5)) + 192] = uint255(stor19[_param1].field_0) * 0.5
                      mem[(2 * ceil32(uint255(stor19[_param1].field_0) * 0.5)) + 224 len ceil32(uint255(stor19[_param1].field_0) * 0.5)] = mem[ceil32(uint255(stor19[_param1].field_0) * 0.5) + 160 len ceil32(uint255(stor19[_param1].field_0) * 0.5)]
                      if ceil32(uint255(stor19[_param1].field_0) * 0.5) > uint255(stor19[_param1].field_0) * 0.5:
                          mem[(uint255(stor19[_param1].field_0) * 0.5) + (2 * ceil32(uint255(stor19[_param1].field_0) * 0.5)) + 224] = 0
                      return memory
                        from (2 * ceil32(uint255(stor19[_param1].field_0) * 0.5)) + 160
                         len (6 * ceil32(uint255(stor19[_param1].field_0) * 0.5)) + 64
                  mem[ceil32(uint255(stor19[_param1].field_0) * 0.5) + 160] = stor19[_param1].field_0
                  idx = ceil32(uint255(stor19[_param1].field_0) * 0.5) + 160
                  s = 0
                  while ceil32(uint255(stor19[_param1].field_0) * 0.5) + stor19[_param1].field_1 + 128 > idx:
                      mem[idx + 32] = stor19[_param1][s].field_256
                      idx = idx + 32
                      s = s + 1
                      continue 
              mem[(2 * ceil32(uint255(stor19[_param1].field_0) * 0.5)) + 160] = 32
              mem[(2 * ceil32(uint255(stor19[_param1].field_0) * 0.5)) + 192] = uint255(stor19[_param1].field_0) * 0.5
              mem[(2 * ceil32(uint255(stor19[_param1].field_0) * 0.5)) + 224 len ceil32(uint255(stor19[_param1].field_0) * 0.5)] = mem[ceil32(uint255(stor19[_param1].field_0) * 0.5) + 160 len ceil32(uint255(stor19[_param1].field_0) * 0.5)]
              if ceil32(uint255(stor19[_param1].field_0) * 0.5) > uint255(stor19[_param1].field_0) * 0.5:
                  mem[(uint255(stor19[_param1].field_0) * 0.5) + (2 * ceil32(uint255(stor19[_param1].field_0) * 0.5)) + 224] = 0
          else:
              if 31 >= uint255(stor19[_param1].field_0) * 0.5:
                  mem[128] = 256 * stor19[_param1].field_8
                  if Mask(256, -1, stor19[_param1].field_0):
                      mem[ceil32(uint255(stor19[_param1].field_0) * 0.5) + 192 len ceil32(uint255(stor19[_param1].field_0) * 0.5)] = mem[128 len ceil32(uint255(stor19[_param1].field_0) * 0.5)]
                      if ceil32(uint255(stor19[_param1].field_0) * 0.5) > uint255(stor19[_param1].field_0) * 0.5:
                          mem[(uint255(stor19[_param1].field_0) * 0.5) + ceil32(uint255(stor19[_param1].field_0) * 0.5) + 192] = 0
                      return Array(len=2 * Mask(256, -1, stor19[_param1].field_0), data=mem[128 len ceil32(uint255(stor19[_param1].field_0) * 0.5)], mem[(2 * ceil32(uint255(stor19[_param1].field_0) * 0.5)) + 192 len 2 * ceil32(uint255(stor19[_param1].field_0) * 0.5)]), 
                  if not ownerOf[_param1]:
                      revert with 0, 'URI query for nonexistent token'
                  if not stor19[_param1].field_0:
                      if stor19[_param1].field_0 == stor19[_param1].field_1 < 32:
                          revert with 'NH{q', 34
                      if stor19[_param1].field_0:
                          if stor19[_param1].field_0 == uint255(stor19[_param1].field_0) * 0.5 < 32:
                              revert with 'NH{q', 34
                          if Mask(256, -1, stor19[_param1].field_0):
                              if 31 < uint255(stor19[_param1].field_0) * 0.5:
                                  mem[ceil32(uint255(stor19[_param1].field_0) * 0.5) + 160] = stor19[_param1].field_0
                                  idx = ceil32(uint255(stor19[_param1].field_0) * 0.5) + 160
                                  s = 0
                                  while ceil32(uint255(stor19[_param1].field_0) * 0.5) + (uint255(stor19[_param1].field_0) * 0.5) + 128 > idx:
                                      mem[idx + 32] = stor19[_param1][s].field_256
                                      idx = idx + 32
                                      s = s + 1
                                      continue 
                                  return Array(len=stor19[_param1].field_0, data=mem[ceil32(uint255(stor19[_param1].field_0) * 0.5) + 160 len ceil32(stor19[_param1].field_1)]), 
                              mem[ceil32(uint255(stor19[_param1].field_0) * 0.5) + 160] = 256 * stor19[_param1].field_8
                      else:
                          if stor19[_param1].field_0 == stor19[_param1].field_1 < 32:
                              revert with 'NH{q', 34
                          if stor19[_param1].field_1:
                              if 31 < stor19[_param1].field_1:
                                  mem[ceil32(uint255(stor19[_param1].field_0) * 0.5) + 160] = stor19[_param1].field_0
                                  idx = ceil32(uint255(stor19[_param1].field_0) * 0.5) + 160
                                  s = 0
                                  while ceil32(uint255(stor19[_param1].field_0) * 0.5) + stor19[_param1].field_1 + 128 > idx:
                                      mem[idx + 32] = stor19[_param1][s].field_256
                                      idx = idx + 32
                                      s = s + 1
                                      continue 
                                  return Array(len=stor19[_param1].field_0, data=mem[ceil32(uint255(stor19[_param1].field_0) * 0.5) + 160 len ceil32(stor19[_param1].field_1)]), 
                              mem[ceil32(uint255(stor19[_param1].field_0) * 0.5) + 160] = 256 * stor19[_param1].field_8
                      mem[ceil32(uint255(stor19[_param1].field_0) * 0.5) + ceil32(stor19[_param1].field_1) + 224 len ceil32(stor19[_param1].field_1)] = mem[ceil32(uint255(stor19[_param1].field_0) * 0.5) + 160 len ceil32(stor19[_param1].field_1)]
                      if ceil32(stor19[_param1].field_1) > stor19[_param1].field_1:
                          mem[stor19[_param1].field_1 + ceil32(uint255(stor19[_param1].field_0) * 0.5) + ceil32(stor19[_param1].field_1) + 224] = 0
                      return Array(len=stor19[_param1].field_0, data=mem[ceil32(uint255(stor19[_param1].field_0) * 0.5) + 160 len ceil32(stor19[_param1].field_1)], mem[ceil32(uint255(stor19[_param1].field_0) * 0.5) + (2 * ceil32(stor19[_param1].field_1)) + 224 len 2 * ceil32(stor19[_param1].field_1)]), 
                  if stor19[_param1].field_0 == uint255(stor19[_param1].field_0) * 0.5 < 32:
                      revert with 'NH{q', 34
                  if stor19[_param1].field_0:
                      if stor19[_param1].field_0 == uint255(stor19[_param1].field_0) * 0.5 < 32:
                          revert with 'NH{q', 34
                      if not Mask(256, -1, stor19[_param1].field_0):
                          mem[(2 * ceil32(uint255(stor19[_param1].field_0) * 0.5)) + 160] = 32
                          mem[(2 * ceil32(uint255(stor19[_param1].field_0) * 0.5)) + 192] = uint255(stor19[_param1].field_0) * 0.5
                          mem[(2 * ceil32(uint255(stor19[_param1].field_0) * 0.5)) + 224 len ceil32(uint255(stor19[_param1].field_0) * 0.5)] = mem[ceil32(uint255(stor19[_param1].field_0) * 0.5) + 160 len ceil32(uint255(stor19[_param1].field_0) * 0.5)]
                          if ceil32(uint255(stor19[_param1].field_0) * 0.5) > uint255(stor19[_param1].field_0) * 0.5:
                              mem[(uint255(stor19[_param1].field_0) * 0.5) + (2 * ceil32(uint255(stor19[_param1].field_0) * 0.5)) + 224] = 0
                          return memory
                            from (2 * ceil32(uint255(stor19[_param1].field_0) * 0.5)) + 160
                             len (6 * ceil32(uint255(stor19[_param1].field_0) * 0.5)) + 64
                      if 31 >= uint255(stor19[_param1].field_0) * 0.5:
                          mem[ceil32(uint255(stor19[_param1].field_0) * 0.5) + 160] = 256 * stor19[_param1].field_8
                          mem[(2 * ceil32(uint255(stor19[_param1].field_0) * 0.5)) + 160] = 32
                          mem[(2 * ceil32(uint255(stor19[_param1].field_0) * 0.5)) + 192] = uint255(stor19[_param1].field_0) * 0.5
                          mem[(2 * ceil32(uint255(stor19[_param1].field_0) * 0.5)) + 224 len ceil32(uint255(stor19[_param1].field_0) * 0.5)] = mem[ceil32(uint255(stor19[_param1].field_0) * 0.5) + 160 len ceil32(uint255(stor19[_param1].field_0) * 0.5)]
                          if ceil32(uint255(stor19[_param1].field_0) * 0.5) > uint255(stor19[_param1].field_0) * 0.5:
                              mem[(uint255(stor19[_param1].field_0) * 0.5) + (2 * ceil32(uint255(stor19[_param1].field_0) * 0.5)) + 224] = 0
                          return memory
                            from (2 * ceil32(uint255(stor19[_param1].field_0) * 0.5)) + 160
                             len (6 * ceil32(uint255(stor19[_param1].field_0) * 0.5)) + 64
                      mem[ceil32(uint255(stor19[_param1].field_0) * 0.5) + 160] = stor19[_param1].field_0
                      idx = ceil32(uint255(stor19[_param1].field_0) * 0.5) + 160
                      s = 0
                      while ceil32(uint255(stor19[_param1].field_0) * 0.5) + (uint255(stor19[_param1].field_0) * 0.5) + 128 > idx:
                          mem[idx + 32] = stor19[_param1][s].field_256
                          idx = idx + 32
                          s = s + 1
                          continue 
                  else:
                      if stor19[_param1].field_0 == stor19[_param1].field_1 < 32:
                          revert with 'NH{q', 34
                      if not stor19[_param1].field_1:
                          mem[(2 * ceil32(uint255(stor19[_param1].field_0) * 0.5)) + 160] = 32
                          mem[(2 * ceil32(uint255(stor19[_param1].field_0) * 0.5)) + 192] = uint255(stor19[_param1].field_0) * 0.5
                          mem[(2 * ceil32(uint255(stor19[_param1].field_0) * 0.5)) + 224 len ceil32(uint255(stor19[_param1].field_0) * 0.5)] = mem[ceil32(uint255(stor19[_param1].field_0) * 0.5) + 160 len ceil32(uint255(stor19[_param1].field_0) * 0.5)]
                          if ceil32(uint255(stor19[_param1].field_0) * 0.5) > uint255(stor19[_param1].field_0) * 0.5:
                              mem[(uint255(stor19[_param1].field_0) * 0.5) + (2 * ceil32(uint255(stor19[_param1].field_0) * 0.5)) + 224] = 0
                          return memory
                            from (2 * ceil32(uint255(stor19[_param1].field_0) * 0.5)) + 160
                             len (6 * ceil32(uint255(stor19[_param1].field_0) * 0.5)) + 64
                      if 31 >= stor19[_param1].field_1:
                          mem[ceil32(uint255(stor19[_param1].field_0) * 0.5) + 160] = 256 * stor19[_param1].field_8
                          mem[(2 * ceil32(uint255(stor19[_param1].field_0) * 0.5)) + 160] = 32
                          mem[(2 * ceil32(uint255(stor19[_param1].field_0) * 0.5)) + 192] = uint255(stor19[_param1].field_0) * 0.5
                          mem[(2 * ceil32(uint255(stor19[_param1].field_0) * 0.5)) + 224 len ceil32(uint255(stor19[_param1].field_0) * 0.5)] = mem[ceil32(uint255(stor19[_param1].field_0) * 0.5) + 160 len ceil32(uint255(stor19[_param1].field_0) * 0.5)]
                          if ceil32(uint255(stor19[_param1].field_0) * 0.5) > uint255(stor19[_param1].field_0) * 0.5:
                              mem[(uint255(stor19[_param1].field_0) * 0.5) + (2 * ceil32(uint255(stor19[_param1].field_0) * 0.5)) + 224] = 0
                          return memory
                            from (2 * ceil32(uint255(stor19[_param1].field_0) * 0.5)) + 160
                             len (6 * ceil32(uint255(stor19[_param1].field_0) * 0.5)) + 64
                      mem[ceil32(uint255(stor19[_param1].field_0) * 0.5) + 160] = stor19[_param1].field_0
                      idx = ceil32(uint255(stor19[_param1].field_0) * 0.5) + 160
                      s = 0
                      while ceil32(uint255(stor19[_param1].field_0) * 0.5) + stor19[_param1].field_1 + 128 > idx:
                          mem[idx + 32] = stor19[_param1][s].field_256
                          idx = idx + 32
                          s = s + 1
                          continue 
                  mem[(2 * ceil32(uint255(stor19[_param1].field_0) * 0.5)) + 160] = 32
                  mem[(2 * ceil32(uint255(stor19[_param1].field_0) * 0.5)) + 192] = uint255(stor19[_param1].field_0) * 0.5
                  mem[(2 * ceil32(uint255(stor19[_param1].field_0) * 0.5)) + 224 len ceil32(uint255(stor19[_param1].field_0) * 0.5)] = mem[ceil32(uint255(stor19[_param1].field_0) * 0.5) + 160 len ceil32(uint255(stor19[_param1].field_0) * 0.5)]
                  if ceil32(uint255(stor19[_param1].field_0) * 0.5) > uint255(stor19[_param1].field_0) * 0.5:
                      mem[(uint255(stor19[_param1].field_0) * 0.5) + (2 * ceil32(uint255(stor19[_param1].field_0) * 0.5)) + 224] = 0
              else:
                  mem[128] = stor19[_param1].field_0
                  idx = 128
                  s = 0
                  while (uint255(stor19[_param1].field_0) * 0.5) + 96 > idx:
                      mem[idx + 32] = stor19[_param1][s].field_256
                      idx = idx + 32
                      s = s + 1
                      continue 
                  if Mask(256, -1, stor19[_param1].field_0):
                      return Array(len=2 * Mask(256, -1, stor19[_param1].field_0), data=mem[128 len ceil32(uint255(stor19[_param1].field_0) * 0.5)]), 
                  if not ownerOf[_param1]:
                      revert with 0, 'URI query for nonexistent token'
                  if not stor19[_param1].field_0:
                      if stor19[_param1].field_0 == stor19[_param1].field_1 < 32:
                          revert with 'NH{q', 34
                      if stor19[_param1].field_0:
                          if stor19[_param1].field_0 == uint255(stor19[_param1].field_0) * 0.5 < 32:
                              revert with 'NH{q', 34
                          if Mask(256, -1, stor19[_param1].field_0):
                              if 31 >= uint255(stor19[_param1].field_0) * 0.5:
                                  mem[ceil32(uint255(stor19[_param1].field_0) * 0.5) + 160] = 256 * stor19[_param1].field_8
                              else:
                                  mem[ceil32(uint255(stor19[_param1].field_0) * 0.5) + 160] = stor19[_param1].field_0
                                  idx = ceil32(uint255(stor19[_param1].field_0) * 0.5) + 160
                                  s = 0
                                  while ceil32(uint255(stor19[_param1].field_0) * 0.5) + (uint255(stor19[_param1].field_0) * 0.5) + 128 > idx:
                                      mem[idx + 32] = stor19[_param1][s].field_256
                                      idx = idx + 32
                                      s = s + 1
                                      continue 
                      else:
                          if stor19[_param1].field_0 == stor19[_param1].field_1 < 32:
                              revert with 'NH{q', 34
                          if stor19[_param1].field_1:
                              if 31 >= stor19[_param1].field_1:
                                  mem[ceil32(uint255(stor19[_param1].field_0) * 0.5) + 160] = 256 * stor19[_param1].field_8
                              else:
                                  mem[ceil32(uint255(stor19[_param1].field_0) * 0.5) + 160] = stor19[_param1].field_0
                                  idx = ceil32(uint255(stor19[_param1].field_0) * 0.5) + 160
                                  s = 0
                                  while ceil32(uint255(stor19[_param1].field_0) * 0.5) + stor19[_param1].field_1 + 128 > idx:
                                      mem[idx + 32] = stor19[_param1][s].field_256
                                      idx = idx + 32
                                      s = s + 1
                                      continue 
                      return Array(len=stor19[_param1].field_0, data=mem[ceil32(uint255(stor19[_param1].field_0) * 0.5) + 160 len ceil32(stor19[_param1].field_1)]), 
                  if stor19[_param1].field_0 == uint255(stor19[_param1].field_0) * 0.5 < 32:
                      revert with 'NH{q', 34
                  if stor19[_param1].field_0:
                      if stor19[_param1].field_0 == uint255(stor19[_param1].field_0) * 0.5 < 32:
                          revert with 'NH{q', 34
                      if not Mask(256, -1, stor19[_param1].field_0):
                          mem[(2 * ceil32(uint255(stor19[_param1].field_0) * 0.5)) + 160] = 32
                          mem[(2 * ceil32(uint255(stor19[_param1].field_0) * 0.5)) + 192] = uint255(stor19[_param1].field_0) * 0.5
                          mem[(2 * ceil32(uint255(stor19[_param1].field_0) * 0.5)) + 224 len ceil32(uint255(stor19[_param1].field_0) * 0.5)] = mem[ceil32(uint255(stor19[_param1].field_0) * 0.5) + 160 len ceil32(uint255(stor19[_param1].field_0) * 0.5)]
                          if ceil32(uint255(stor19[_param1].field_0) * 0.5) > uint255(stor19[_param1].field_0) * 0.5:
                              mem[(uint255(stor19[_param1].field_0) * 0.5) + (2 * ceil32(uint255(stor19[_param1].field_0) * 0.5)) + 224] = 0
                      else:
                          if 31 >= uint255(stor19[_param1].field_0) * 0.5:
                              mem[ceil32(uint255(stor19[_param1].field_0) * 0.5) + 160] = 256 * stor19[_param1].field_8
                              mem[(2 * ceil32(uint255(stor19[_param1].field_0) * 0.5)) + 160] = 32
                              mem[(2 * ceil32(uint255(stor19[_param1].field_0) * 0.5)) + 192] = uint255(stor19[_param1].field_0) * 0.5
                              mem[(2 * ceil32(uint255(stor19[_param1].field_0) * 0.5)) + 224 len ceil32(uint255(stor19[_param1].field_0) * 0.5)] = mem[ceil32(uint255(stor19[_param1].field_0) * 0.5) + 160 len ceil32(uint255(stor19[_param1].field_0) * 0.5)]
                              if ceil32(uint255(stor19[_param1].field_0) * 0.5) > uint255(stor19[_param1].field_0) * 0.5:
                                  mem[(uint255(stor19[_param1].field_0) * 0.5) + (2 * ceil32(uint255(stor19[_param1].field_0) * 0.5)) + 224] = 0
                          else:
                              mem[ceil32(uint255(stor19[_param1].field_0) * 0.5) + 160] = stor19[_param1].field_0
                              idx = ceil32(uint255(stor19[_param1].field_0) * 0.5) + 160
                              s = 0
                              while ceil32(uint255(stor19[_param1].field_0) * 0.5) + (uint255(stor19[_param1].field_0) * 0.5) + 128 > idx:
                                  mem[idx + 32] = stor19[_param1][s].field_256
                                  idx = idx + 32
                                  s = s + 1
                                  continue 
                              mem[(2 * ceil32(uint255(stor19[_param1].field_0) * 0.5)) + 160] = 32
                              mem[(2 * ceil32(uint255(stor19[_param1].field_0) * 0.5)) + 192] = uint255(stor19[_param1].field_0) * 0.5
                              mem[(2 * ceil32(uint255(stor19[_param1].field_0) * 0.5)) + 224 len ceil32(uint255(stor19[_param1].field_0) * 0.5)] = mem[ceil32(uint255(stor19[_param1].field_0) * 0.5) + 160 len ceil32(uint255(stor19[_param1].field_0) * 0.5)]
                              if ceil32(uint255(stor19[_param1].field_0) * 0.5) <= uint255(stor19[_param1].field_0) * 0.5:
                                  return memory
                                    from (2 * ceil32(uint255(stor19[_param1].field_0) * 0.5)) + 160
                                     len ceil32(uint255(stor19[_param1].field_0) * 0.5) + 64
                              mem[(uint255(stor19[_param1].field_0) * 0.5) + (2 * ceil32(uint255(stor19[_param1].field_0) * 0.5)) + 224] = 0
                  else:
                      if stor19[_param1].field_0 == stor19[_param1].field_1 < 32:
                          revert with 'NH{q', 34
                      if not stor19[_param1].field_1:
                          mem[(2 * ceil32(uint255(stor19[_param1].field_0) * 0.5)) + 160] = 32
                          mem[(2 * ceil32(uint255(stor19[_param1].field_0) * 0.5)) + 192] = uint255(stor19[_param1].field_0) * 0.5
                          mem[(2 * ceil32(uint255(stor19[_param1].field_0) * 0.5)) + 224 len ceil32(uint255(stor19[_param1].field_0) * 0.5)] = mem[ceil32(uint255(stor19[_param1].field_0) * 0.5) + 160 len ceil32(uint255(stor19[_param1].field_0) * 0.5)]
                          if ceil32(uint255(stor19[_param1].field_0) * 0.5) > uint255(stor19[_param1].field_0) * 0.5:
                              mem[(uint255(stor19[_param1].field_0) * 0.5) + (2 * ceil32(uint255(stor19[_param1].field_0) * 0.5)) + 224] = 0
                      else:
                          if 31 >= stor19[_param1].field_1:
                              mem[ceil32(uint255(stor19[_param1].field_0) * 0.5) + 160] = 256 * stor19[_param1].field_8
                              mem[(2 * ceil32(uint255(stor19[_param1].field_0) * 0.5)) + 160] = 32
                              mem[(2 * ceil32(uint255(stor19[_param1].field_0) * 0.5)) + 192] = uint255(stor19[_param1].field_0) * 0.5
                              mem[(2 * ceil32(uint255(stor19[_param1].field_0) * 0.5)) + 224 len ceil32(uint255(stor19[_param1].field_0) * 0.5)] = mem[ceil32(uint255(stor19[_param1].field_0) * 0.5) + 160 len ceil32(uint255(stor19[_param1].field_0) * 0.5)]
                              if ceil32(uint255(stor19[_param1].field_0) * 0.5) > uint255(stor19[_param1].field_0) * 0.5:
                                  mem[(uint255(stor19[_param1].field_0) * 0.5) + (2 * ceil32(uint255(stor19[_param1].field_0) * 0.5)) + 224] = 0
                          else:
                              mem[ceil32(uint255(stor19[_param1].field_0) * 0.5) + 160] = stor19[_param1].field_0
                              idx = ceil32(uint255(stor19[_param1].field_0) * 0.5) + 160
                              s = 0
                              while ceil32(uint255(stor19[_param1].field_0) * 0.5) + stor19[_param1].field_1 + 128 > idx:
                                  mem[idx + 32] = stor19[_param1][s].field_256
                                  idx = idx + 32
                                  s = s + 1
                                  continue 
                              mem[(2 * ceil32(uint255(stor19[_param1].field_0) * 0.5)) + 160] = 32
                              mem[(2 * ceil32(uint255(stor19[_param1].field_0) * 0.5)) + 192] = uint255(stor19[_param1].field_0) * 0.5
                              mem[(2 * ceil32(uint255(stor19[_param1].field_0) * 0.5)) + 224 len ceil32(uint255(stor19[_param1].field_0) * 0.5)] = mem[ceil32(uint255(stor19[_param1].field_0) * 0.5) + 160 len ceil32(uint255(stor19[_param1].field_0) * 0.5)]
                              if ceil32(uint255(stor19[_param1].field_0) * 0.5) <= uint255(stor19[_param1].field_0) * 0.5:
                                  return memory
                                    from (2 * ceil32(uint255(stor19[_param1].field_0) * 0.5)) + 160
                                     len ceil32(uint255(stor19[_param1].field_0) * 0.5) + 64
                              mem[(uint255(stor19[_param1].field_0) * 0.5) + (2 * ceil32(uint255(stor19[_param1].field_0) * 0.5)) + 224] = 0
      else:
          if stor19[_param1].field_0 == stor19[_param1].field_1 < 32:
              revert with 'NH{q', 34
          if not stor19[_param1].field_1:
              if Mask(256, -1, stor19[_param1].field_0):
                  mem[ceil32(uint255(stor19[_param1].field_0) * 0.5) + 192 len ceil32(uint255(stor19[_param1].field_0) * 0.5)] = mem[128 len ceil32(uint255(stor19[_param1].field_0) * 0.5)]
                  if ceil32(uint255(stor19[_param1].field_0) * 0.5) > uint255(stor19[_param1].field_0) * 0.5:
                      mem[(uint255(stor19[_param1].field_0) * 0.5) + ceil32(uint255(stor19[_param1].field_0) * 0.5) + 192] = 0
                  return Array(len=2 * Mask(256, -1, stor19[_param1].field_0), data=mem[128 len ceil32(uint255(stor19[_param1].field_0) * 0.5)], mem[(2 * ceil32(uint255(stor19[_param1].field_0) * 0.5)) + 192 len 2 * ceil32(uint255(stor19[_param1].field_0) * 0.5)]), 
              if not ownerOf[_param1]:
                  revert with 0, 'URI query for nonexistent token'
              if not stor19[_param1].field_0:
                  if stor19[_param1].field_0 == stor19[_param1].field_1 < 32:
                      revert with 'NH{q', 34
                  if stor19[_param1].field_0:
                      if stor19[_param1].field_0 == uint255(stor19[_param1].field_0) * 0.5 < 32:
                          revert with 'NH{q', 34
                      if Mask(256, -1, stor19[_param1].field_0):
                          if 31 < uint255(stor19[_param1].field_0) * 0.5:
                              mem[ceil32(uint255(stor19[_param1].field_0) * 0.5) + 160] = stor19[_param1].field_0
                              idx = ceil32(uint255(stor19[_param1].field_0) * 0.5) + 160
                              s = 0
                              while ceil32(uint255(stor19[_param1].field_0) * 0.5) + (uint255(stor19[_param1].field_0) * 0.5) + 128 > idx:
                                  mem[idx + 32] = stor19[_param1][s].field_256
                                  idx = idx + 32
                                  s = s + 1
                                  continue 
                              return Array(len=stor19[_param1].field_0, data=mem[ceil32(uint255(stor19[_param1].field_0) * 0.5) + 160 len ceil32(stor19[_param1].field_1)]), 
                          mem[ceil32(uint255(stor19[_param1].field_0) * 0.5) + 160] = 256 * stor19[_param1].field_8
                  else:
                      if stor19[_param1].field_0 == stor19[_param1].field_1 < 32:
                          revert with 'NH{q', 34
                      if stor19[_param1].field_1:
                          if 31 < stor19[_param1].field_1:
                              mem[ceil32(uint255(stor19[_param1].field_0) * 0.5) + 160] = stor19[_param1].field_0
                              idx = ceil32(uint255(stor19[_param1].field_0) * 0.5) + 160
                              s = 0
                              while ceil32(uint255(stor19[_param1].field_0) * 0.5) + stor19[_param1].field_1 + 128 > idx:
                                  mem[idx + 32] = stor19[_param1][s].field_256
                                  idx = idx + 32
                                  s = s + 1
                                  continue 
                              return Array(len=stor19[_param1].field_0, data=mem[ceil32(uint255(stor19[_param1].field_0) * 0.5) + 160 len ceil32(stor19[_param1].field_1)]), 
                          mem[ceil32(uint255(stor19[_param1].field_0) * 0.5) + 160] = 256 * stor19[_param1].field_8
                  mem[ceil32(uint255(stor19[_param1].field_0) * 0.5) + ceil32(stor19[_param1].field_1) + 224 len ceil32(stor19[_param1].field_1)] = mem[ceil32(uint255(stor19[_param1].field_0) * 0.5) + 160 len ceil32(stor19[_param1].field_1)]
                  if ceil32(stor19[_param1].field_1) > stor19[_param1].field_1:
                      mem[stor19[_param1].field_1 + ceil32(uint255(stor19[_param1].field_0) * 0.5) + ceil32(stor19[_param1].field_1) + 224] = 0
                  return Array(len=stor19[_param1].field_0, data=mem[ceil32(uint255(stor19[_param1].field_0) * 0.5) + 160 len ceil32(stor19[_param1].field_1)], mem[ceil32(uint255(stor19[_param1].field_0) * 0.5) + (2 * ceil32(stor19[_param1].field_1)) + 224 len 2 * ceil32(stor19[_param1].field_1)]), 
              if stor19[_param1].field_0 == uint255(stor19[_param1].field_0) * 0.5 < 32:
                  revert with 'NH{q', 34
              if stor19[_param1].field_0:
                  if stor19[_param1].field_0 == uint255(stor19[_param1].field_0) * 0.5 < 32:
                      revert with 'NH{q', 34
                  if not Mask(256, -1, stor19[_param1].field_0):
                      mem[(2 * ceil32(uint255(stor19[_param1].field_0) * 0.5)) + 160] = 32
                      mem[(2 * ceil32(uint255(stor19[_param1].field_0) * 0.5)) + 192] = uint255(stor19[_param1].field_0) * 0.5
                      mem[(2 * ceil32(uint255(stor19[_param1].field_0) * 0.5)) + 224 len ceil32(uint255(stor19[_param1].field_0) * 0.5)] = mem[ceil32(uint255(stor19[_param1].field_0) * 0.5) + 160 len ceil32(uint255(stor19[_param1].field_0) * 0.5)]
                      if ceil32(uint255(stor19[_param1].field_0) * 0.5) > uint255(stor19[_param1].field_0) * 0.5:
                          mem[(uint255(stor19[_param1].field_0) * 0.5) + (2 * ceil32(uint255(stor19[_param1].field_0) * 0.5)) + 224] = 0
                      return memory
                        from (2 * ceil32(uint255(stor19[_param1].field_0) * 0.5)) + 160
                         len (6 * ceil32(uint255(stor19[_param1].field_0) * 0.5)) + 64
                  if 31 >= uint255(stor19[_param1].field_0) * 0.5:
                      mem[ceil32(uint255(stor19[_param1].field_0) * 0.5) + 160] = 256 * stor19[_param1].field_8
                      mem[(2 * ceil32(uint255(stor19[_param1].field_0) * 0.5)) + 160] = 32
                      mem[(2 * ceil32(uint255(stor19[_param1].field_0) * 0.5)) + 192] = uint255(stor19[_param1].field_0) * 0.5
                      mem[(2 * ceil32(uint255(stor19[_param1].field_0) * 0.5)) + 224 len ceil32(uint255(stor19[_param1].field_0) * 0.5)] = mem[ceil32(uint255(stor19[_param1].field_0) * 0.5) + 160 len ceil32(uint255(stor19[_param1].field_0) * 0.5)]
                      if ceil32(uint255(stor19[_param1].field_0) * 0.5) > uint255(stor19[_param1].field_0) * 0.5:
                          mem[(uint255(stor19[_param1].field_0) * 0.5) + (2 * ceil32(uint255(stor19[_param1].field_0) * 0.5)) + 224] = 0
                      return memory
                        from (2 * ceil32(uint255(stor19[_param1].field_0) * 0.5)) + 160
                         len (6 * ceil32(uint255(stor19[_param1].field_0) * 0.5)) + 64
                  mem[ceil32(uint255(stor19[_param1].field_0) * 0.5) + 160] = stor19[_param1].field_0
                  idx = ceil32(uint255(stor19[_param1].field_0) * 0.5) + 160
                  s = 0
                  while ceil32(uint255(stor19[_param1].field_0) * 0.5) + (uint255(stor19[_param1].field_0) * 0.5) + 128 > idx:
                      mem[idx + 32] = stor19[_param1][s].field_256
                      idx = idx + 32
                      s = s + 1
                      continue 
              else:
                  if stor19[_param1].field_0 == stor19[_param1].field_1 < 32:
                      revert with 'NH{q', 34
                  if not stor19[_param1].field_1:
                      mem[(2 * ceil32(uint255(stor19[_param1].field_0) * 0.5)) + 160] = 32
                      mem[(2 * ceil32(uint255(stor19[_param1].field_0) * 0.5)) + 192] = uint255(stor19[_param1].field_0) * 0.5
                      mem[(2 * ceil32(uint255(stor19[_param1].field_0) * 0.5)) + 224 len ceil32(uint255(stor19[_param1].field_0) * 0.5)] = mem[ceil32(uint255(stor19[_param1].field_0) * 0.5) + 160 len ceil32(uint255(stor19[_param1].field_0) * 0.5)]
                      if ceil32(uint255(stor19[_param1].field_0) * 0.5) > uint255(stor19[_param1].field_0) * 0.5:
                          mem[(uint255(stor19[_param1].field_0) * 0.5) + (2 * ceil32(uint255(stor19[_param1].field_0) * 0.5)) + 224] = 0
                      return memory
                        from (2 * ceil32(uint255(stor19[_param1].field_0) * 0.5)) + 160
                         len (6 * ceil32(uint255(stor19[_param1].field_0) * 0.5)) + 64
                  if 31 >= stor19[_param1].field_1:
                      mem[ceil32(uint255(stor19[_param1].field_0) * 0.5) + 160] = 256 * stor19[_param1].field_8
                      mem[(2 * ceil32(uint255(stor19[_param1].field_0) * 0.5)) + 160] = 32
                      mem[(2 * ceil32(uint255(stor19[_param1].field_0) * 0.5)) + 192] = uint255(stor19[_param1].field_0) * 0.5
                      mem[(2 * ceil32(uint255(stor19[_param1].field_0) * 0.5)) + 224 len ceil32(uint255(stor19[_param1].field_0) * 0.5)] = mem[ceil32(uint255(stor19[_param1].field_0) * 0.5) + 160 len ceil32(uint255(stor19[_param1].field_0) * 0.5)]
                      if ceil32(uint255(stor19[_param1].field_0) * 0.5) > uint255(stor19[_param1].field_0) * 0.5:
                          mem[(uint255(stor19[_param1].field_0) * 0.5) + (2 * ceil32(uint255(stor19[_param1].field_0) * 0.5)) + 224] = 0
                      return memory
                        from (2 * ceil32(uint255(stor19[_param1].field_0) * 0.5)) + 160
                         len (6 * ceil32(uint255(stor19[_param1].field_0) * 0.5)) + 64
                  mem[ceil32(uint255(stor19[_param1].field_0) * 0.5) + 160] = stor19[_param1].field_0
                  idx = ceil32(uint255(stor19[_param1].field_0) * 0.5) + 160
                  s = 0
                  while ceil32(uint255(stor19[_param1].field_0) * 0.5) + stor19[_param1].field_1 + 128 > idx:
                      mem[idx + 32] = stor19[_param1][s].field_256
                      idx = idx + 32
                      s = s + 1
                      continue 
              mem[(2 * ceil32(uint255(stor19[_param1].field_0) * 0.5)) + 160] = 32
              mem[(2 * ceil32(uint255(stor19[_param1].field_0) * 0.5)) + 192] = uint255(stor19[_param1].field_0) * 0.5
              mem[(2 * ceil32(uint255(stor19[_param1].field_0) * 0.5)) + 224 len ceil32(uint255(stor19[_param1].field_0) * 0.5)] = mem[ceil32(uint255(stor19[_param1].field_0) * 0.5) + 160 len ceil32(uint255(stor19[_param1].field_0) * 0.5)]
              if ceil32(uint255(stor19[_param1].field_0) * 0.5) > uint255(stor19[_param1].field_0) * 0.5:
                  mem[(uint255(stor19[_param1].field_0) * 0.5) + (2 * ceil32(uint255(stor19[_param1].field_0) * 0.5)) + 224] = 0
          else:
              if 31 >= stor19[_param1].field_1:
                  mem[128] = 256 * stor19[_param1].field_8
                  if Mask(256, -1, stor19[_param1].field_0):
                      mem[ceil32(uint255(stor19[_param1].field_0) * 0.5) + 192 len ceil32(uint255(stor19[_param1].field_0) * 0.5)] = mem[128 len ceil32(uint255(stor19[_param1].field_0) * 0.5)]
                      if ceil32(uint255(stor19[_param1].field_0) * 0.5) > uint255(stor19[_param1].field_0) * 0.5:
                          mem[(uint255(stor19[_param1].field_0) * 0.5) + ceil32(uint255(stor19[_param1].field_0) * 0.5) + 192] = 0
                      return Array(len=2 * Mask(256, -1, stor19[_param1].field_0), data=mem[128 len ceil32(uint255(stor19[_param1].field_0) * 0.5)], mem[(2 * ceil32(uint255(stor19[_param1].field_0) * 0.5)) + 192 len 2 * ceil32(uint255(stor19[_param1].field_0) * 0.5)]), 
                  if not ownerOf[_param1]:
                      revert with 0, 'URI query for nonexistent token'
                  if not stor19[_param1].field_0:
                      if stor19[_param1].field_0 == stor19[_param1].field_1 < 32:
                          revert with 'NH{q', 34
                      if stor19[_param1].field_0:
                          if stor19[_param1].field_0 == uint255(stor19[_param1].field_0) * 0.5 < 32:
                              revert with 'NH{q', 34
                          if Mask(256, -1, stor19[_param1].field_0):
                              if 31 < uint255(stor19[_param1].field_0) * 0.5:
                                  mem[ceil32(uint255(stor19[_param1].field_0) * 0.5) + 160] = stor19[_param1].field_0
                                  idx = ceil32(uint255(stor19[_param1].field_0) * 0.5) + 160
                                  s = 0
                                  while ceil32(uint255(stor19[_param1].field_0) * 0.5) + (uint255(stor19[_param1].field_0) * 0.5) + 128 > idx:
                                      mem[idx + 32] = stor19[_param1][s].field_256
                                      idx = idx + 32
                                      s = s + 1
                                      continue 
                                  return Array(len=stor19[_param1].field_0, data=mem[ceil32(uint255(stor19[_param1].field_0) * 0.5) + 160 len ceil32(stor19[_param1].field_1)]), 
                              mem[ceil32(uint255(stor19[_param1].field_0) * 0.5) + 160] = 256 * stor19[_param1].field_8
                      else:
                          if stor19[_param1].field_0 == stor19[_param1].field_1 < 32:
                              revert with 'NH{q', 34
                          if stor19[_param1].field_1:
                              if 31 < stor19[_param1].field_1:
                                  mem[ceil32(uint255(stor19[_param1].field_0) * 0.5) + 160] = stor19[_param1].field_0
                                  idx = ceil32(uint255(stor19[_param1].field_0) * 0.5) + 160
                                  s = 0
                                  while ceil32(uint255(stor19[_param1].field_0) * 0.5) + stor19[_param1].field_1 + 128 > idx:
                                      mem[idx + 32] = stor19[_param1][s].field_256
                                      idx = idx + 32
                                      s = s + 1
                                      continue 
                                  return Array(len=stor19[_param1].field_0, data=mem[ceil32(uint255(stor19[_param1].field_0) * 0.5) + 160 len ceil32(stor19[_param1].field_1)]), 
                              mem[ceil32(uint255(stor19[_param1].field_0) * 0.5) + 160] = 256 * stor19[_param1].field_8
                      mem[ceil32(uint255(stor19[_param1].field_0) * 0.5) + ceil32(stor19[_param1].field_1) + 224 len ceil32(stor19[_param1].field_1)] = mem[ceil32(uint255(stor19[_param1].field_0) * 0.5) + 160 len ceil32(stor19[_param1].field_1)]
                      if ceil32(stor19[_param1].field_1) > stor19[_param1].field_1:
                          mem[stor19[_param1].field_1 + ceil32(uint255(stor19[_param1].field_0) * 0.5) + ceil32(stor19[_param1].field_1) + 224] = 0
                      return Array(len=stor19[_param1].field_0, data=mem[ceil32(uint255(stor19[_param1].field_0) * 0.5) + 160 len ceil32(stor19[_param1].field_1)], mem[ceil32(uint255(stor19[_param1].field_0) * 0.5) + (2 * ceil32(stor19[_param1].field_1)) + 224 len 2 * ceil32(stor19[_param1].field_1)]), 
                  if stor19[_param1].field_0 == uint255(stor19[_param1].field_0) * 0.5 < 32:
                      revert with 'NH{q', 34
                  if stor19[_param1].field_0:
                      if stor19[_param1].field_0 == uint255(stor19[_param1].field_0) * 0.5 < 32:
                          revert with 'NH{q', 34
                      if not Mask(256, -1, stor19[_param1].field_0):
                          mem[(2 * ceil32(uint255(stor19[_param1].field_0) * 0.5)) + 160] = 32
                          mem[(2 * ceil32(uint255(stor19[_param1].field_0) * 0.5)) + 192] = uint255(stor19[_param1].field_0) * 0.5
                          mem[(2 * ceil32(uint255(stor19[_param1].field_0) * 0.5)) + 224 len ceil32(uint255(stor19[_param1].field_0) * 0.5)] = mem[ceil32(uint255(stor19[_param1].field_0) * 0.5) + 160 len ceil32(uint255(stor19[_param1].field_0) * 0.5)]
                          if ceil32(uint255(stor19[_param1].field_0) * 0.5) > uint255(stor19[_param1].field_0) * 0.5:
                              mem[(uint255(stor19[_param1].field_0) * 0.5) + (2 * ceil32(uint255(stor19[_param1].field_0) * 0.5)) + 224] = 0
                          return memory
                            from (2 * ceil32(uint255(stor19[_param1].field_0) * 0.5)) + 160
                             len (6 * ceil32(uint255(stor19[_param1].field_0) * 0.5)) + 64
                      if 31 >= uint255(stor19[_param1].field_0) * 0.5:
                          mem[ceil32(uint255(stor19[_param1].field_0) * 0.5) + 160] = 256 * stor19[_param1].field_8
                          mem[(2 * ceil32(uint255(stor19[_param1].field_0) * 0.5)) + 160] = 32
                          mem[(2 * ceil32(uint255(stor19[_param1].field_0) * 0.5)) + 192] = uint255(stor19[_param1].field_0) * 0.5
                          mem[(2 * ceil32(uint255(stor19[_param1].field_0) * 0.5)) + 224 len ceil32(uint255(stor19[_param1].field_0) * 0.5)] = mem[ceil32(uint255(stor19[_param1].field_0) * 0.5) + 160 len ceil32(uint255(stor19[_param1].field_0) * 0.5)]
                          if ceil32(uint255(stor19[_param1].field_0) * 0.5) > uint255(stor19[_param1].field_0) * 0.5:
                              mem[(uint255(stor19[_param1].field_0) * 0.5) + (2 * ceil32(uint255(stor19[_param1].field_0) * 0.5)) + 224] = 0
                          return memory
                            from (2 * ceil32(uint255(stor19[_param1].field_0) * 0.5)) + 160
                             len (6 * ceil32(uint255(stor19[_param1].field_0) * 0.5)) + 64
                      mem[ceil32(uint255(stor19[_param1].field_0) * 0.5) + 160] = stor19[_param1].field_0
                      idx = ceil32(uint255(stor19[_param1].field_0) * 0.5) + 160
                      s = 0
                      while ceil32(uint255(stor19[_param1].field_0) * 0.5) + (uint255(stor19[_param1].field_0) * 0.5) + 128 > idx:
                          mem[idx + 32] = stor19[_param1][s].field_256
                          idx = idx + 32
                          s = s + 1
                          continue 
                  else:
                      if stor19[_param1].field_0 == stor19[_param1].field_1 < 32:
                          revert with 'NH{q', 34
                      if not stor19[_param1].field_1:
                          mem[(2 * ceil32(uint255(stor19[_param1].field_0) * 0.5)) + 160] = 32
                          mem[(2 * ceil32(uint255(stor19[_param1].field_0) * 0.5)) + 192] = uint255(stor19[_param1].field_0) * 0.5
                          mem[(2 * ceil32(uint255(stor19[_param1].field_0) * 0.5)) + 224 len ceil32(uint255(stor19[_param1].field_0) * 0.5)] = mem[ceil32(uint255(stor19[_param1].field_0) * 0.5) + 160 len ceil32(uint255(stor19[_param1].field_0) * 0.5)]
                          if ceil32(uint255(stor19[_param1].field_0) * 0.5) > uint255(stor19[_param1].field_0) * 0.5:
                              mem[(uint255(stor19[_param1].field_0) * 0.5) + (2 * ceil32(uint255(stor19[_param1].field_0) * 0.5)) + 224] = 0
                          return memory
                            from (2 * ceil32(uint255(stor19[_param1].field_0) * 0.5)) + 160
                             len (6 * ceil32(uint255(stor19[_param1].field_0) * 0.5)) + 64
                      if 31 >= stor19[_param1].field_1:
                          mem[ceil32(uint255(stor19[_param1].field_0) * 0.5) + 160] = 256 * stor19[_param1].field_8
                          mem[(2 * ceil32(uint255(stor19[_param1].field_0) * 0.5)) + 160] = 32
                          mem[(2 * ceil32(uint255(stor19[_param1].field_0) * 0.5)) + 192] = uint255(stor19[_param1].field_0) * 0.5
                          mem[(2 * ceil32(uint255(stor19[_param1].field_0) * 0.5)) + 224 len ceil32(uint255(stor19[_param1].field_0) * 0.5)] = mem[ceil32(uint255(stor19[_param1].field_0) * 0.5) + 160 len ceil32(uint255(stor19[_param1].field_0) * 0.5)]
                          if ceil32(uint255(stor19[_param1].field_0) * 0.5) > uint255(stor19[_param1].field_0) * 0.5:
                              mem[(uint255(stor19[_param1].field_0) * 0.5) + (2 * ceil32(uint255(stor19[_param1].field_0) * 0.5)) + 224] = 0
                          return memory
                            from (2 * ceil32(uint255(stor19[_param1].field_0) * 0.5)) + 160
                             len (6 * ceil32(uint255(stor19[_param1].field_0) * 0.5)) + 64
                      mem[ceil32(uint255(stor19[_param1].field_0) * 0.5) + 160] = stor19[_param1].field_0
                      idx = ceil32(uint255(stor19[_param1].field_0) * 0.5) + 160
                      s = 0
                      while ceil32(uint255(stor19[_param1].field_0) * 0.5) + stor19[_param1].field_1 + 128 > idx:
                          mem[idx + 32] = stor19[_param1][s].field_256
                          idx = idx + 32
                          s = s + 1
                          continue 
                  mem[(2 * ceil32(uint255(stor19[_param1].field_0) * 0.5)) + 160] = 32
                  mem[(2 * ceil32(uint255(stor19[_param1].field_0) * 0.5)) + 192] = uint255(stor19[_param1].field_0) * 0.5
                  mem[(2 * ceil32(uint255(stor19[_param1].field_0) * 0.5)) + 224 len ceil32(uint255(stor19[_param1].field_0) * 0.5)] = mem[ceil32(uint255(stor19[_param1].field_0) * 0.5) + 160 len ceil32(uint255(stor19[_param1].field_0) * 0.5)]
                  if ceil32(uint255(stor19[_param1].field_0) * 0.5) > uint255(stor19[_param1].field_0) * 0.5:
                      mem[(uint255(stor19[_param1].field_0) * 0.5) + (2 * ceil32(uint255(stor19[_param1].field_0) * 0.5)) + 224] = 0
              else:
                  mem[128] = stor19[_param1].field_0
                  idx = 128
                  s = 0
                  while stor19[_param1].field_1 + 96 > idx:
                      mem[idx + 32] = stor19[_param1][s].field_256
                      idx = idx + 32
                      s = s + 1
                      continue 
                  if Mask(256, -1, stor19[_param1].field_0):
                      return Array(len=2 * Mask(256, -1, stor19[_param1].field_0), data=mem[128 len ceil32(uint255(stor19[_param1].field_0) * 0.5)]), 
                  if not ownerOf[_param1]:
                      revert with 0, 'URI query for nonexistent token'
                  if not stor19[_param1].field_0:
                      if stor19[_param1].field_0 == stor19[_param1].field_1 < 32:
                          revert with 'NH{q', 34
                      if stor19[_param1].field_0:
                          if stor19[_param1].field_0 == uint255(stor19[_param1].field_0) * 0.5 < 32:
                              revert with 'NH{q', 34
                          if Mask(256, -1, stor19[_param1].field_0):
                              if 31 >= uint255(stor19[_param1].field_0) * 0.5:
                                  mem[ceil32(uint255(stor19[_param1].field_0) * 0.5) + 160] = 256 * stor19[_param1].field_8
                              else:
                                  mem[ceil32(uint255(stor19[_param1].field_0) * 0.5) + 160] = stor19[_param1].field_0
                                  idx = ceil32(uint255(stor19[_param1].field_0) * 0.5) + 160
                                  s = 0
                                  while ceil32(uint255(stor19[_param1].field_0) * 0.5) + (uint255(stor19[_param1].field_0) * 0.5) + 128 > idx:
                                      mem[idx + 32] = stor19[_param1][s].field_256
                                      idx = idx + 32
                                      s = s + 1
                                      continue 
                      else:
                          if stor19[_param1].field_0 == stor19[_param1].field_1 < 32:
                              revert with 'NH{q', 34
                          if stor19[_param1].field_1:
                              if 31 >= stor19[_param1].field_1:
                                  mem[ceil32(uint255(stor19[_param1].field_0) * 0.5) + 160] = 256 * stor19[_param1].field_8
                              else:
                                  mem[ceil32(uint255(stor19[_param1].field_0) * 0.5) + 160] = stor19[_param1].field_0
                                  idx = ceil32(uint255(stor19[_param1].field_0) * 0.5) + 160
                                  s = 0
                                  while ceil32(uint255(stor19[_param1].field_0) * 0.5) + stor19[_param1].field_1 + 128 > idx:
                                      mem[idx + 32] = stor19[_param1][s].field_256
                                      idx = idx + 32
                                      s = s + 1
                                      continue 
                      return Array(len=stor19[_param1].field_0, data=mem[ceil32(uint255(stor19[_param1].field_0) * 0.5) + 160 len ceil32(stor19[_param1].field_1)]), 
                  if stor19[_param1].field_0 == uint255(stor19[_param1].field_0) * 0.5 < 32:
                      revert with 'NH{q', 34
                  if stor19[_param1].field_0:
                      if stor19[_param1].field_0 == uint255(stor19[_param1].field_0) * 0.5 < 32:
                          revert with 'NH{q', 34
                      if not Mask(256, -1, stor19[_param1].field_0):
                          mem[(2 * ceil32(uint255(stor19[_param1].field_0) * 0.5)) + 160] = 32
                          mem[(2 * ceil32(uint255(stor19[_param1].field_0) * 0.5)) + 192] = uint255(stor19[_param1].field_0) * 0.5
                          mem[(2 * ceil32(uint255(stor19[_param1].field_0) * 0.5)) + 224 len ceil32(uint255(stor19[_param1].field_0) * 0.5)] = mem[ceil32(uint255(stor19[_param1].field_0) * 0.5) + 160 len ceil32(uint255(stor19[_param1].field_0) * 0.5)]
                          if ceil32(uint255(stor19[_param1].field_0) * 0.5) > uint255(stor19[_param1].field_0) * 0.5:
                              mem[(uint255(stor19[_param1].field_0) * 0.5) + (2 * ceil32(uint255(stor19[_param1].field_0) * 0.5)) + 224] = 0
                      else:
                          if 31 >= uint255(stor19[_param1].field_0) * 0.5:
                              mem[ceil32(uint255(stor19[_param1].field_0) * 0.5) + 160] = 256 * stor19[_param1].field_8
                              mem[(2 * ceil32(uint255(stor19[_param1].field_0) * 0.5)) + 160] = 32
                              mem[(2 * ceil32(uint255(stor19[_param1].field_0) * 0.5)) + 192] = uint255(stor19[_param1].field_0) * 0.5
                              mem[(2 * ceil32(uint255(stor19[_param1].field_0) * 0.5)) + 224 len ceil32(uint255(stor19[_param1].field_0) * 0.5)] = mem[ceil32(uint255(stor19[_param1].field_0) * 0.5) + 160 len ceil32(uint255(stor19[_param1].field_0) * 0.5)]
                              if ceil32(uint255(stor19[_param1].field_0) * 0.5) > uint255(stor19[_param1].field_0) * 0.5:
                                  mem[(uint255(stor19[_param1].field_0) * 0.5) + (2 * ceil32(uint255(stor19[_param1].field_0) * 0.5)) + 224] = 0
                          else:
                              mem[ceil32(uint255(stor19[_param1].field_0) * 0.5) + 160] = stor19[_param1].field_0
                              idx = ceil32(uint255(stor19[_param1].field_0) * 0.5) + 160
                              s = 0
                              while ceil32(uint255(stor19[_param1].field_0) * 0.5) + (uint255(stor19[_param1].field_0) * 0.5) + 128 > idx:
                                  mem[idx + 32] = stor19[_param1][s].field_256
                                  idx = idx + 32
                                  s = s + 1
                                  continue 
                              mem[(2 * ceil32(uint255(stor19[_param1].field_0) * 0.5)) + 160] = 32
                              mem[(2 * ceil32(uint255(stor19[_param1].field_0) * 0.5)) + 192] = uint255(stor19[_param1].field_0) * 0.5
                              mem[(2 * ceil32(uint255(stor19[_param1].field_0) * 0.5)) + 224 len ceil32(uint255(stor19[_param1].field_0) * 0.5)] = mem[ceil32(uint255(stor19[_param1].field_0) * 0.5) + 160 len ceil32(uint255(stor19[_param1].field_0) * 0.5)]
                              if ceil32(uint255(stor19[_param1].field_0) * 0.5) <= uint255(stor19[_param1].field_0) * 0.5:
                                  return memory
                                    from (2 * ceil32(uint255(stor19[_param1].field_0) * 0.5)) + 160
                                     len ceil32(uint255(stor19[_param1].field_0) * 0.5) + 64
                              mem[(uint255(stor19[_param1].field_0) * 0.5) + (2 * ceil32(uint255(stor19[_param1].field_0) * 0.5)) + 224] = 0
                  else:
                      if stor19[_param1].field_0 == stor19[_param1].field_1 < 32:
                          revert with 'NH{q', 34
                      if not stor19[_param1].field_1:
                          mem[(2 * ceil32(uint255(stor19[_param1].field_0) * 0.5)) + 160] = 32
                          mem[(2 * ceil32(uint255(stor19[_param1].field_0) * 0.5)) + 192] = uint255(stor19[_param1].field_0) * 0.5
                          mem[(2 * ceil32(uint255(stor19[_param1].field_0) * 0.5)) + 224 len ceil32(uint255(stor19[_param1].field_0) * 0.5)] = mem[ceil32(uint255(stor19[_param1].field_0) * 0.5) + 160 len ceil32(uint255(stor19[_param1].field_0) * 0.5)]
                          if ceil32(uint255(stor19[_param1].field_0) * 0.5) > uint255(stor19[_param1].field_0) * 0.5:
                              mem[(uint255(stor19[_param1].field_0) * 0.5) + (2 * ceil32(uint255(stor19[_param1].field_0) * 0.5)) + 224] = 0
                      else:
                          if 31 >= stor19[_param1].field_1:
                              mem[ceil32(uint255(stor19[_param1].field_0) * 0.5) + 160] = 256 * stor19[_param1].field_8
                              mem[(2 * ceil32(uint255(stor19[_param1].field_0) * 0.5)) + 160] = 32
                              mem[(2 * ceil32(uint255(stor19[_param1].field_0) * 0.5)) + 192] = uint255(stor19[_param1].field_0) * 0.5
                              mem[(2 * ceil32(uint255(stor19[_param1].field_0) * 0.5)) + 224 len ceil32(uint255(stor19[_param1].field_0) * 0.5)] = mem[ceil32(uint255(stor19[_param1].field_0) * 0.5) + 160 len ceil32(uint255(stor19[_param1].field_0) * 0.5)]
                              if ceil32(uint255(stor19[_param1].field_0) * 0.5) > uint255(stor19[_param1].field_0) * 0.5:
                                  mem[(uint255(stor19[_param1].field_0) * 0.5) + (2 * ceil32(uint255(stor19[_param1].field_0) * 0.5)) + 224] = 0
                          else:
                              mem[ceil32(uint255(stor19[_param1].field_0) * 0.5) + 160] = stor19[_param1].field_0
                              idx = ceil32(uint255(stor19[_param1].field_0) * 0.5) + 160
                              s = 0
                              while ceil32(uint255(stor19[_param1].field_0) * 0.5) + stor19[_param1].field_1 + 128 > idx:
                                  mem[idx + 32] = stor19[_param1][s].field_256
                                  idx = idx + 32
                                  s = s + 1
                                  continue 
                              mem[(2 * ceil32(uint255(stor19[_param1].field_0) * 0.5)) + 160] = 32
                              mem[(2 * ceil32(uint255(stor19[_param1].field_0) * 0.5)) + 192] = uint255(stor19[_param1].field_0) * 0.5
                              mem[(2 * ceil32(uint255(stor19[_param1].field_0) * 0.5)) + 224 len ceil32(uint255(stor19[_param1].field_0) * 0.5)] = mem[ceil32(uint255(stor19[_param1].field_0) * 0.5) + 160 len ceil32(uint255(stor19[_param1].field_0) * 0.5)]
                              if ceil32(uint255(stor19[_param1].field_0) * 0.5) <= uint255(stor19[_param1].field_0) * 0.5:
                                  return memory
                                    from (2 * ceil32(uint255(stor19[_param1].field_0) * 0.5)) + 160
                                     len ceil32(uint255(stor19[_param1].field_0) * 0.5) + 64
                              mem[(uint255(stor19[_param1].field_0) * 0.5) + (2 * ceil32(uint255(stor19[_param1].field_0) * 0.5)) + 224] = 0
      return memory
        from (2 * ceil32(uint255(stor19[_param1].field_0) * 0.5)) + 160
         len (4 * ceil32(uint255(stor19[_param1].field_0) * 0.5)) + 64
  if stor19[_param1].field_0 == stor19[_param1].field_1 < 32:
      revert with 'NH{q', 34
  if stor19[_param1].field_0:
      if stor19[_param1].field_0 == uint255(stor19[_param1].field_0) * 0.5 < 32:
          revert with 'NH{q', 34
      if not Mask(256, -1, stor19[_param1].field_0):
          if stor19[_param1].field_1:
              mem[ceil32(stor19[_param1].field_1) + 192 len ceil32(stor19[_param1].field_1)] = mem[128 len ceil32(stor19[_param1].field_1)]
              if ceil32(stor19[_param1].field_1) > stor19[_param1].field_1:
                  mem[stor19[_param1].field_1 + ceil32(stor19[_param1].field_1) + 192] = 0
              return Array(len=stor19[_param1].field_0, data=mem[128 len ceil32(stor19[_param1].field_1)], mem[(2 * ceil32(stor19[_param1].field_1)) + 192 len 2 * ceil32(stor19[_param1].field_1)]), 
          if not ownerOf[_param1]:
              revert with 0, 'URI query for nonexistent token'
          if stor19[_param1].field_0:
              if stor19[_param1].field_0 == uint255(stor19[_param1].field_0) * 0.5 < 32:
                  revert with 'NH{q', 34
              if stor19[_param1].field_0:
                  if stor19[_param1].field_0 == uint255(stor19[_param1].field_0) * 0.5 < 32:
                      revert with 'NH{q', 34
                  if Mask(256, -1, stor19[_param1].field_0):
                      if 31 < uint255(stor19[_param1].field_0) * 0.5:
                          mem[ceil32(stor19[_param1].field_1) + 160] = stor19[_param1].field_0
                          idx = ceil32(stor19[_param1].field_1) + 160
                          s = 0
                          while ceil32(stor19[_param1].field_1) + (uint255(stor19[_param1].field_0) * 0.5) + 128 > idx:
                              mem[idx + 32] = stor19[_param1][s].field_256
                              idx = idx + 32
                              s = s + 1
                              continue 
                          return Array(len=2 * Mask(256, -1, stor19[_param1].field_0), data=mem[ceil32(stor19[_param1].field_1) + 160 len ceil32(uint255(stor19[_param1].field_0) * 0.5)]), 
                      mem[ceil32(stor19[_param1].field_1) + 160] = 256 * stor19[_param1].field_8
              else:
                  if stor19[_param1].field_0 == stor19[_param1].field_1 < 32:
                      revert with 'NH{q', 34
                  if stor19[_param1].field_1:
                      if 31 < stor19[_param1].field_1:
                          mem[ceil32(stor19[_param1].field_1) + 160] = stor19[_param1].field_0
                          idx = ceil32(stor19[_param1].field_1) + 160
                          s = 0
                          while ceil32(stor19[_param1].field_1) + stor19[_param1].field_1 + 128 > idx:
                              mem[idx + 32] = stor19[_param1][s].field_256
                              idx = idx + 32
                              s = s + 1
                              continue 
                          return Array(len=2 * Mask(256, -1, stor19[_param1].field_0), data=mem[ceil32(stor19[_param1].field_1) + 160 len ceil32(uint255(stor19[_param1].field_0) * 0.5)]), 
                      mem[ceil32(stor19[_param1].field_1) + 160] = 256 * stor19[_param1].field_8
              mem[ceil32(stor19[_param1].field_1) + ceil32(uint255(stor19[_param1].field_0) * 0.5) + 224 len ceil32(uint255(stor19[_param1].field_0) * 0.5)] = mem[ceil32(stor19[_param1].field_1) + 160 len ceil32(uint255(stor19[_param1].field_0) * 0.5)]
              if ceil32(uint255(stor19[_param1].field_0) * 0.5) > uint255(stor19[_param1].field_0) * 0.5:
                  mem[(uint255(stor19[_param1].field_0) * 0.5) + ceil32(stor19[_param1].field_1) + ceil32(uint255(stor19[_param1].field_0) * 0.5) + 224] = 0
              return Array(len=2 * Mask(256, -1, stor19[_param1].field_0), data=mem[ceil32(stor19[_param1].field_1) + 160 len ceil32(uint255(stor19[_param1].field_0) * 0.5)], mem[ceil32(stor19[_param1].field_1) + (2 * ceil32(uint255(stor19[_param1].field_0) * 0.5)) + 224 len 2 * ceil32(uint255(stor19[_param1].field_0) * 0.5)]), 
          if stor19[_param1].field_0 == stor19[_param1].field_1 < 32:
              revert with 'NH{q', 34
          if stor19[_param1].field_0:
              if stor19[_param1].field_0 == uint255(stor19[_param1].field_0) * 0.5 < 32:
                  revert with 'NH{q', 34
              if not Mask(256, -1, stor19[_param1].field_0):
                  mem[(2 * ceil32(stor19[_param1].field_1)) + 160] = 32
                  mem[(2 * ceil32(stor19[_param1].field_1)) + 192] = stor19[_param1].field_1
                  mem[(2 * ceil32(stor19[_param1].field_1)) + 224 len ceil32(stor19[_param1].field_1)] = mem[ceil32(stor19[_param1].field_1) + 160 len ceil32(stor19[_param1].field_1)]
                  if ceil32(stor19[_param1].field_1) > stor19[_param1].field_1:
                      mem[stor19[_param1].field_1 + (2 * ceil32(stor19[_param1].field_1)) + 224] = 0
                  return memory
                    from (2 * ceil32(stor19[_param1].field_1)) + 160
                     len (6 * ceil32(stor19[_param1].field_1)) + 64
              if 31 >= uint255(stor19[_param1].field_0) * 0.5:
                  mem[ceil32(stor19[_param1].field_1) + 160] = 256 * stor19[_param1].field_8
                  mem[(2 * ceil32(stor19[_param1].field_1)) + 160] = 32
                  mem[(2 * ceil32(stor19[_param1].field_1)) + 192] = stor19[_param1].field_1
                  mem[(2 * ceil32(stor19[_param1].field_1)) + 224 len ceil32(stor19[_param1].field_1)] = mem[ceil32(stor19[_param1].field_1) + 160 len ceil32(stor19[_param1].field_1)]
                  if ceil32(stor19[_param1].field_1) > stor19[_param1].field_1:
                      mem[stor19[_param1].field_1 + (2 * ceil32(stor19[_param1].field_1)) + 224] = 0
                  return memory
                    from (2 * ceil32(stor19[_param1].field_1)) + 160
                     len (6 * ceil32(stor19[_param1].field_1)) + 64
              mem[ceil32(stor19[_param1].field_1) + 160] = stor19[_param1].field_0
              idx = ceil32(stor19[_param1].field_1) + 160
              s = 0
              while ceil32(stor19[_param1].field_1) + (uint255(stor19[_param1].field_0) * 0.5) + 128 > idx:
                  mem[idx + 32] = stor19[_param1][s].field_256
                  idx = idx + 32
                  s = s + 1
                  continue 
          else:
              if stor19[_param1].field_0 == stor19[_param1].field_1 < 32:
                  revert with 'NH{q', 34
              if not stor19[_param1].field_1:
                  mem[(2 * ceil32(stor19[_param1].field_1)) + 160] = 32
                  mem[(2 * ceil32(stor19[_param1].field_1)) + 192] = stor19[_param1].field_1
                  mem[(2 * ceil32(stor19[_param1].field_1)) + 224 len ceil32(stor19[_param1].field_1)] = mem[ceil32(stor19[_param1].field_1) + 160 len ceil32(stor19[_param1].field_1)]
                  if ceil32(stor19[_param1].field_1) > stor19[_param1].field_1:
                      mem[stor19[_param1].field_1 + (2 * ceil32(stor19[_param1].field_1)) + 224] = 0
                  return memory
                    from (2 * ceil32(stor19[_param1].field_1)) + 160
                     len (6 * ceil32(stor19[_param1].field_1)) + 64
              if 31 >= stor19[_param1].field_1:
                  mem[ceil32(stor19[_param1].field_1) + 160] = 256 * stor19[_param1].field_8
                  mem[(2 * ceil32(stor19[_param1].field_1)) + 160] = 32
                  mem[(2 * ceil32(stor19[_param1].field_1)) + 192] = stor19[_param1].field_1
                  mem[(2 * ceil32(stor19[_param1].field_1)) + 224 len ceil32(stor19[_param1].field_1)] = mem[ceil32(stor19[_param1].field_1) + 160 len ceil32(stor19[_param1].field_1)]
                  if ceil32(stor19[_param1].field_1) > stor19[_param1].field_1:
                      mem[stor19[_param1].field_1 + (2 * ceil32(stor19[_param1].field_1)) + 224] = 0
                  return memory
                    from (2 * ceil32(stor19[_param1].field_1)) + 160
                     len (6 * ceil32(stor19[_param1].field_1)) + 64
              mem[ceil32(stor19[_param1].field_1) + 160] = stor19[_param1].field_0
              idx = ceil32(stor19[_param1].field_1) + 160
              s = 0
              while ceil32(stor19[_param1].field_1) + stor19[_param1].field_1 + 128 > idx:
                  mem[idx + 32] = stor19[_param1][s].field_256
                  idx = idx + 32
                  s = s + 1
                  continue 
          mem[(2 * ceil32(stor19[_param1].field_1)) + 160] = 32
          mem[(2 * ceil32(stor19[_param1].field_1)) + 192] = stor19[_param1].field_1
          mem[(2 * ceil32(stor19[_param1].field_1)) + 224 len ceil32(stor19[_param1].field_1)] = mem[ceil32(stor19[_param1].field_1) + 160 len ceil32(stor19[_param1].field_1)]
          if ceil32(stor19[_param1].field_1) > stor19[_param1].field_1:
              mem[stor19[_param1].field_1 + (2 * ceil32(stor19[_param1].field_1)) + 224] = 0
          return memory
            from (2 * ceil32(stor19[_param1].field_1)) + 160
             len (4 * ceil32(stor19[_param1].field_1)) + 64
      if 31 >= uint255(stor19[_param1].field_0) * 0.5:
          mem[128] = 256 * stor19[_param1].field_8
          if stor19[_param1].field_1:
              mem[ceil32(stor19[_param1].field_1) + 192 len ceil32(stor19[_param1].field_1)] = mem[128 len ceil32(stor19[_param1].field_1)]
              if ceil32(stor19[_param1].field_1) > stor19[_param1].field_1:
                  mem[stor19[_param1].field_1 + ceil32(stor19[_param1].field_1) + 192] = 0
              return Array(len=stor19[_param1].field_0, data=mem[128 len ceil32(stor19[_param1].field_1)], mem[(2 * ceil32(stor19[_param1].field_1)) + 192 len 2 * ceil32(stor19[_param1].field_1)]), 
          if not ownerOf[_param1]:
              revert with 0, 'URI query for nonexistent token'
          if stor19[_param1].field_0:
              if stor19[_param1].field_0 == uint255(stor19[_param1].field_0) * 0.5 < 32:
                  revert with 'NH{q', 34
              if stor19[_param1].field_0:
                  if stor19[_param1].field_0 == uint255(stor19[_param1].field_0) * 0.5 < 32:
                      revert with 'NH{q', 34
                  if Mask(256, -1, stor19[_param1].field_0):
                      if 31 < uint255(stor19[_param1].field_0) * 0.5:
                          mem[ceil32(stor19[_param1].field_1) + 160] = stor19[_param1].field_0
                          idx = ceil32(stor19[_param1].field_1) + 160
                          s = 0
                          while ceil32(stor19[_param1].field_1) + (uint255(stor19[_param1].field_0) * 0.5) + 128 > idx:
                              mem[idx + 32] = stor19[_param1][s].field_256
                              idx = idx + 32
                              s = s + 1
                              continue 
                          return Array(len=2 * Mask(256, -1, stor19[_param1].field_0), data=mem[ceil32(stor19[_param1].field_1) + 160 len ceil32(uint255(stor19[_param1].field_0) * 0.5)]), 
                      mem[ceil32(stor19[_param1].field_1) + 160] = 256 * stor19[_param1].field_8
              else:
                  if stor19[_param1].field_0 == stor19[_param1].field_1 < 32:
                      revert with 'NH{q', 34
                  if stor19[_param1].field_1:
                      if 31 < stor19[_param1].field_1:
                          mem[ceil32(stor19[_param1].field_1) + 160] = stor19[_param1].field_0
                          idx = ceil32(stor19[_param1].field_1) + 160
                          s = 0
                          while ceil32(stor19[_param1].field_1) + stor19[_param1].field_1 + 128 > idx:
                              mem[idx + 32] = stor19[_param1][s].field_256
                              idx = idx + 32
                              s = s + 1
                              continue 
                          return Array(len=2 * Mask(256, -1, stor19[_param1].field_0), data=mem[ceil32(stor19[_param1].field_1) + 160 len ceil32(uint255(stor19[_param1].field_0) * 0.5)]), 
                      mem[ceil32(stor19[_param1].field_1) + 160] = 256 * stor19[_param1].field_8
              mem[ceil32(stor19[_param1].field_1) + ceil32(uint255(stor19[_param1].field_0) * 0.5) + 224 len ceil32(uint255(stor19[_param1].field_0) * 0.5)] = mem[ceil32(stor19[_param1].field_1) + 160 len ceil32(uint255(stor19[_param1].field_0) * 0.5)]
              if ceil32(uint255(stor19[_param1].field_0) * 0.5) > uint255(stor19[_param1].field_0) * 0.5:
                  mem[(uint255(stor19[_param1].field_0) * 0.5) + ceil32(stor19[_param1].field_1) + ceil32(uint255(stor19[_param1].field_0) * 0.5) + 224] = 0
              return Array(len=2 * Mask(256, -1, stor19[_param1].field_0), data=mem[ceil32(stor19[_param1].field_1) + 160 len ceil32(uint255(stor19[_param1].field_0) * 0.5)], mem[ceil32(stor19[_param1].field_1) + (2 * ceil32(uint255(stor19[_param1].field_0) * 0.5)) + 224 len 2 * ceil32(uint255(stor19[_param1].field_0) * 0.5)]), 
          if stor19[_param1].field_0 == stor19[_param1].field_1 < 32:
              revert with 'NH{q', 34
          if stor19[_param1].field_0:
              if stor19[_param1].field_0 == uint255(stor19[_param1].field_0) * 0.5 < 32:
                  revert with 'NH{q', 34
              if not Mask(256, -1, stor19[_param1].field_0):
                  mem[(2 * ceil32(stor19[_param1].field_1)) + 160] = 32
                  mem[(2 * ceil32(stor19[_param1].field_1)) + 192] = stor19[_param1].field_1
                  mem[(2 * ceil32(stor19[_param1].field_1)) + 224 len ceil32(stor19[_param1].field_1)] = mem[ceil32(stor19[_param1].field_1) + 160 len ceil32(stor19[_param1].field_1)]
                  if ceil32(stor19[_param1].field_1) > stor19[_param1].field_1:
                      mem[stor19[_param1].field_1 + (2 * ceil32(stor19[_param1].field_1)) + 224] = 0
                  return memory
                    from (2 * ceil32(stor19[_param1].field_1)) + 160
                     len (6 * ceil32(stor19[_param1].field_1)) + 64
              if 31 >= uint255(stor19[_param1].field_0) * 0.5:
                  mem[ceil32(stor19[_param1].field_1) + 160] = 256 * stor19[_param1].field_8
                  mem[(2 * ceil32(stor19[_param1].field_1)) + 160] = 32
                  mem[(2 * ceil32(stor19[_param1].field_1)) + 192] = stor19[_param1].field_1
                  mem[(2 * ceil32(stor19[_param1].field_1)) + 224 len ceil32(stor19[_param1].field_1)] = mem[ceil32(stor19[_param1].field_1) + 160 len ceil32(stor19[_param1].field_1)]
                  if ceil32(stor19[_param1].field_1) > stor19[_param1].field_1:
                      mem[stor19[_param1].field_1 + (2 * ceil32(stor19[_param1].field_1)) + 224] = 0
                  return memory
                    from (2 * ceil32(stor19[_param1].field_1)) + 160
                     len (6 * ceil32(stor19[_param1].field_1)) + 64
              mem[ceil32(stor19[_param1].field_1) + 160] = stor19[_param1].field_0
              idx = ceil32(stor19[_param1].field_1) + 160
              s = 0
              while ceil32(stor19[_param1].field_1) + (uint255(stor19[_param1].field_0) * 0.5) + 128 > idx:
                  mem[idx + 32] = stor19[_param1][s].field_256
                  idx = idx + 32
                  s = s + 1
                  continue 
          else:
              if stor19[_param1].field_0 == stor19[_param1].field_1 < 32:
                  revert with 'NH{q', 34
              if not stor19[_param1].field_1:
                  mem[(2 * ceil32(stor19[_param1].field_1)) + 160] = 32
                  mem[(2 * ceil32(stor19[_param1].field_1)) + 192] = stor19[_param1].field_1
                  mem[(2 * ceil32(stor19[_param1].field_1)) + 224 len ceil32(stor19[_param1].field_1)] = mem[ceil32(stor19[_param1].field_1) + 160 len ceil32(stor19[_param1].field_1)]
                  if ceil32(stor19[_param1].field_1) > stor19[_param1].field_1:
                      mem[stor19[_param1].field_1 + (2 * ceil32(stor19[_param1].field_1)) + 224] = 0
                  return memory
                    from (2 * ceil32(stor19[_param1].field_1)) + 160
                     len (6 * ceil32(stor19[_param1].field_1)) + 64
              if 31 >= stor19[_param1].field_1:
                  mem[ceil32(stor19[_param1].field_1) + 160] = 256 * stor19[_param1].field_8
                  mem[(2 * ceil32(stor19[_param1].field_1)) + 160] = 32
                  mem[(2 * ceil32(stor19[_param1].field_1)) + 192] = stor19[_param1].field_1
                  mem[(2 * ceil32(stor19[_param1].field_1)) + 224 len ceil32(stor19[_param1].field_1)] = mem[ceil32(stor19[_param1].field_1) + 160 len ceil32(stor19[_param1].field_1)]
                  if ceil32(stor19[_param1].field_1) > stor19[_param1].field_1:
                      mem[stor19[_param1].field_1 + (2 * ceil32(stor19[_param1].field_1)) + 224] = 0
                  return memory
                    from (2 * ceil32(stor19[_param1].field_1)) + 160
                     len (6 * ceil32(stor19[_param1].field_1)) + 64
              mem[ceil32(stor19[_param1].field_1) + 160] = stor19[_param1].field_0
              idx = ceil32(stor19[_param1].field_1) + 160
              s = 0
              while ceil32(stor19[_param1].field_1) + stor19[_param1].field_1 + 128 > idx:
                  mem[idx + 32] = stor19[_param1][s].field_256
                  idx = idx + 32
                  s = s + 1
                  continue 
          mem[(2 * ceil32(stor19[_param1].field_1)) + 160] = 32
          mem[(2 * ceil32(stor19[_param1].field_1)) + 192] = stor19[_param1].field_1
          mem[(2 * ceil32(stor19[_param1].field_1)) + 224 len ceil32(stor19[_param1].field_1)] = mem[ceil32(stor19[_param1].field_1) + 160 len ceil32(stor19[_param1].field_1)]
          if ceil32(stor19[_param1].field_1) > stor19[_param1].field_1:
              mem[stor19[_param1].field_1 + (2 * ceil32(stor19[_param1].field_1)) + 224] = 0
          return memory
            from (2 * ceil32(stor19[_param1].field_1)) + 160
             len (4 * ceil32(stor19[_param1].field_1)) + 64
      mem[128] = stor19[_param1].field_0
      idx = 128
      s = 0
      while (uint255(stor19[_param1].field_0) * 0.5) + 96 > idx:
          mem[idx + 32] = stor19[_param1][s].field_256
          idx = idx + 32
          s = s + 1
          continue 
  else:
      if stor19[_param1].field_0 == stor19[_param1].field_1 < 32:
          revert with 'NH{q', 34
      if not stor19[_param1].field_1:
          if stor19[_param1].field_1:
              mem[ceil32(stor19[_param1].field_1) + 192 len ceil32(stor19[_param1].field_1)] = mem[128 len ceil32(stor19[_param1].field_1)]
              if ceil32(stor19[_param1].field_1) > stor19[_param1].field_1:
                  mem[stor19[_param1].field_1 + ceil32(stor19[_param1].field_1) + 192] = 0
              return Array(len=stor19[_param1].field_0, data=mem[128 len ceil32(stor19[_param1].field_1)], mem[(2 * ceil32(stor19[_param1].field_1)) + 192 len 2 * ceil32(stor19[_param1].field_1)]), 
          if not ownerOf[_param1]:
              revert with 0, 'URI query for nonexistent token'
          if stor19[_param1].field_0:
              if stor19[_param1].field_0 == uint255(stor19[_param1].field_0) * 0.5 < 32:
                  revert with 'NH{q', 34
              if stor19[_param1].field_0:
                  if stor19[_param1].field_0 == uint255(stor19[_param1].field_0) * 0.5 < 32:
                      revert with 'NH{q', 34
                  if Mask(256, -1, stor19[_param1].field_0):
                      if 31 < uint255(stor19[_param1].field_0) * 0.5:
                          mem[ceil32(stor19[_param1].field_1) + 160] = stor19[_param1].field_0
                          idx = ceil32(stor19[_param1].field_1) + 160
                          s = 0
                          while ceil32(stor19[_param1].field_1) + (uint255(stor19[_param1].field_0) * 0.5) + 128 > idx:
                              mem[idx + 32] = stor19[_param1][s].field_256
                              idx = idx + 32
                              s = s + 1
                              continue 
                          return Array(len=2 * Mask(256, -1, stor19[_param1].field_0), data=mem[ceil32(stor19[_param1].field_1) + 160 len ceil32(uint255(stor19[_param1].field_0) * 0.5)]), 
                      mem[ceil32(stor19[_param1].field_1) + 160] = 256 * stor19[_param1].field_8
              else:
                  if stor19[_param1].field_0 == stor19[_param1].field_1 < 32:
                      revert with 'NH{q', 34
                  if stor19[_param1].field_1:
                      if 31 < stor19[_param1].field_1:
                          mem[ceil32(stor19[_param1].field_1) + 160] = stor19[_param1].field_0
                          idx = ceil32(stor19[_param1].field_1) + 160
                          s = 0
                          while ceil32(stor19[_param1].field_1) + stor19[_param1].field_1 + 128 > idx:
                              mem[idx + 32] = stor19[_param1][s].field_256
                              idx = idx + 32
                              s = s + 1
                              continue 
                          return Array(len=2 * Mask(256, -1, stor19[_param1].field_0), data=mem[ceil32(stor19[_param1].field_1) + 160 len ceil32(uint255(stor19[_param1].field_0) * 0.5)]), 
                      mem[ceil32(stor19[_param1].field_1) + 160] = 256 * stor19[_param1].field_8
              mem[ceil32(stor19[_param1].field_1) + ceil32(uint255(stor19[_param1].field_0) * 0.5) + 224 len ceil32(uint255(stor19[_param1].field_0) * 0.5)] = mem[ceil32(stor19[_param1].field_1) + 160 len ceil32(uint255(stor19[_param1].field_0) * 0.5)]
              if ceil32(uint255(stor19[_param1].field_0) * 0.5) > uint255(stor19[_param1].field_0) * 0.5:
                  mem[(uint255(stor19[_param1].field_0) * 0.5) + ceil32(stor19[_param1].field_1) + ceil32(uint255(stor19[_param1].field_0) * 0.5) + 224] = 0
              return Array(len=2 * Mask(256, -1, stor19[_param1].field_0), data=mem[ceil32(stor19[_param1].field_1) + 160 len ceil32(uint255(stor19[_param1].field_0) * 0.5)], mem[ceil32(stor19[_param1].field_1) + (2 * ceil32(uint255(stor19[_param1].field_0) * 0.5)) + 224 len 2 * ceil32(uint255(stor19[_param1].field_0) * 0.5)]), 
          if stor19[_param1].field_0 == stor19[_param1].field_1 < 32:
              revert with 'NH{q', 34
          if stor19[_param1].field_0:
              if stor19[_param1].field_0 == uint255(stor19[_param1].field_0) * 0.5 < 32:
                  revert with 'NH{q', 34
              if not Mask(256, -1, stor19[_param1].field_0):
                  mem[(2 * ceil32(stor19[_param1].field_1)) + 160] = 32
                  mem[(2 * ceil32(stor19[_param1].field_1)) + 192] = stor19[_param1].field_1
                  mem[(2 * ceil32(stor19[_param1].field_1)) + 224 len ceil32(stor19[_param1].field_1)] = mem[ceil32(stor19[_param1].field_1) + 160 len ceil32(stor19[_param1].field_1)]
                  if ceil32(stor19[_param1].field_1) > stor19[_param1].field_1:
                      mem[stor19[_param1].field_1 + (2 * ceil32(stor19[_param1].field_1)) + 224] = 0
                  return memory
                    from (2 * ceil32(stor19[_param1].field_1)) + 160
                     len (6 * ceil32(stor19[_param1].field_1)) + 64
              if 31 >= uint255(stor19[_param1].field_0) * 0.5:
                  mem[ceil32(stor19[_param1].field_1) + 160] = 256 * stor19[_param1].field_8
                  mem[(2 * ceil32(stor19[_param1].field_1)) + 160] = 32
                  mem[(2 * ceil32(stor19[_param1].field_1)) + 192] = stor19[_param1].field_1
                  mem[(2 * ceil32(stor19[_param1].field_1)) + 224 len ceil32(stor19[_param1].field_1)] = mem[ceil32(stor19[_param1].field_1) + 160 len ceil32(stor19[_param1].field_1)]
                  if ceil32(stor19[_param1].field_1) > stor19[_param1].field_1:
                      mem[stor19[_param1].field_1 + (2 * ceil32(stor19[_param1].field_1)) + 224] = 0
                  return memory
                    from (2 * ceil32(stor19[_param1].field_1)) + 160
                     len (6 * ceil32(stor19[_param1].field_1)) + 64
              mem[ceil32(stor19[_param1].field_1) + 160] = stor19[_param1].field_0
              idx = ceil32(stor19[_param1].field_1) + 160
              s = 0
              while ceil32(stor19[_param1].field_1) + (uint255(stor19[_param1].field_0) * 0.5) + 128 > idx:
                  mem[idx + 32] = stor19[_param1][s].field_256
                  idx = idx + 32
                  s = s + 1
                  continue 
          else:
              if stor19[_param1].field_0 == stor19[_param1].field_1 < 32:
                  revert with 'NH{q', 34
              if not stor19[_param1].field_1:
                  mem[(2 * ceil32(stor19[_param1].field_1)) + 160] = 32
                  mem[(2 * ceil32(stor19[_param1].field_1)) + 192] = stor19[_param1].field_1
                  mem[(2 * ceil32(stor19[_param1].field_1)) + 224 len ceil32(stor19[_param1].field_1)] = mem[ceil32(stor19[_param1].field_1) + 160 len ceil32(stor19[_param1].field_1)]
                  if ceil32(stor19[_param1].field_1) > stor19[_param1].field_1:
                      mem[stor19[_param1].field_1 + (2 * ceil32(stor19[_param1].field_1)) + 224] = 0
                  return memory
                    from (2 * ceil32(stor19[_param1].field_1)) + 160
                     len (6 * ceil32(stor19[_param1].field_1)) + 64
              if 31 >= stor19[_param1].field_1:
                  mem[ceil32(stor19[_param1].field_1) + 160] = 256 * stor19[_param1].field_8
                  mem[(2 * ceil32(stor19[_param1].field_1)) + 160] = 32
                  mem[(2 * ceil32(stor19[_param1].field_1)) + 192] = stor19[_param1].field_1
                  mem[(2 * ceil32(stor19[_param1].field_1)) + 224 len ceil32(stor19[_param1].field_1)] = mem[ceil32(stor19[_param1].field_1) + 160 len ceil32(stor19[_param1].field_1)]
                  if ceil32(stor19[_param1].field_1) > stor19[_param1].field_1:
                      mem[stor19[_param1].field_1 + (2 * ceil32(stor19[_param1].field_1)) + 224] = 0
                  return memory
                    from (2 * ceil32(stor19[_param1].field_1)) + 160
                     len (6 * ceil32(stor19[_param1].field_1)) + 64
              mem[ceil32(stor19[_param1].field_1) + 160] = stor19[_param1].field_0
              idx = ceil32(stor19[_param1].field_1) + 160
              s = 0
              while ceil32(stor19[_param1].field_1) + stor19[_param1].field_1 + 128 > idx:
                  mem[idx + 32] = stor19[_param1][s].field_256
                  idx = idx + 32
                  s = s + 1
                  continue 
          mem[(2 * ceil32(stor19[_param1].field_1)) + 160] = 32
          mem[(2 * ceil32(stor19[_param1].field_1)) + 192] = stor19[_param1].field_1
          mem[(2 * ceil32(stor19[_param1].field_1)) + 224 len ceil32(stor19[_param1].field_1)] = mem[ceil32(stor19[_param1].field_1) + 160 len ceil32(stor19[_param1].field_1)]
          if ceil32(stor19[_param1].field_1) > stor19[_param1].field_1:
              mem[stor19[_param1].field_1 + (2 * ceil32(stor19[_param1].field_1)) + 224] = 0
          return memory
            from (2 * ceil32(stor19[_param1].field_1)) + 160
             len (4 * ceil32(stor19[_param1].field_1)) + 64
      if 31 >= stor19[_param1].field_1:
          mem[128] = 256 * stor19[_param1].field_8
          if stor19[_param1].field_1:
              mem[ceil32(stor19[_param1].field_1) + 192 len ceil32(stor19[_param1].field_1)] = mem[128 len ceil32(stor19[_param1].field_1)]
              if ceil32(stor19[_param1].field_1) > stor19[_param1].field_1:
                  mem[stor19[_param1].field_1 + ceil32(stor19[_param1].field_1) + 192] = 0
              return Array(len=stor19[_param1].field_0, data=mem[128 len ceil32(stor19[_param1].field_1)], mem[(2 * ceil32(stor19[_param1].field_1)) + 192 len 2 * ceil32(stor19[_param1].field_1)]), 
          if not ownerOf[_param1]:
              revert with 0, 'URI query for nonexistent token'
          if stor19[_param1].field_0:
              if stor19[_param1].field_0 == uint255(stor19[_param1].field_0) * 0.5 < 32:
                  revert with 'NH{q', 34
              if stor19[_param1].field_0:
                  if stor19[_param1].field_0 == uint255(stor19[_param1].field_0) * 0.5 < 32:
                      revert with 'NH{q', 34
                  if Mask(256, -1, stor19[_param1].field_0):
                      if 31 < uint255(stor19[_param1].field_0) * 0.5:
                          mem[ceil32(stor19[_param1].field_1) + 160] = stor19[_param1].field_0
                          idx = ceil32(stor19[_param1].field_1) + 160
                          s = 0
                          while ceil32(stor19[_param1].field_1) + (uint255(stor19[_param1].field_0) * 0.5) + 128 > idx:
                              mem[idx + 32] = stor19[_param1][s].field_256
                              idx = idx + 32
                              s = s + 1
                              continue 
                          return Array(len=2 * Mask(256, -1, stor19[_param1].field_0), data=mem[ceil32(stor19[_param1].field_1) + 160 len ceil32(uint255(stor19[_param1].field_0) * 0.5)]), 
                      mem[ceil32(stor19[_param1].field_1) + 160] = 256 * stor19[_param1].field_8
              else:
                  if stor19[_param1].field_0 == stor19[_param1].field_1 < 32:
                      revert with 'NH{q', 34
                  if stor19[_param1].field_1:
                      if 31 < stor19[_param1].field_1:
                          mem[ceil32(stor19[_param1].field_1) + 160] = stor19[_param1].field_0
                          idx = ceil32(stor19[_param1].field_1) + 160
                          s = 0
                          while ceil32(stor19[_param1].field_1) + stor19[_param1].field_1 + 128 > idx:
                              mem[idx + 32] = stor19[_param1][s].field_256
                              idx = idx + 32
                              s = s + 1
                              continue 
                          return Array(len=2 * Mask(256, -1, stor19[_param1].field_0), data=mem[ceil32(stor19[_param1].field_1) + 160 len ceil32(uint255(stor19[_param1].field_0) * 0.5)]), 
                      mem[ceil32(stor19[_param1].field_1) + 160] = 256 * stor19[_param1].field_8
              mem[ceil32(stor19[_param1].field_1) + ceil32(uint255(stor19[_param1].field_0) * 0.5) + 224 len ceil32(uint255(stor19[_param1].field_0) * 0.5)] = mem[ceil32(stor19[_param1].field_1) + 160 len ceil32(uint255(stor19[_param1].field_0) * 0.5)]
              if ceil32(uint255(stor19[_param1].field_0) * 0.5) > uint255(stor19[_param1].field_0) * 0.5:
                  mem[(uint255(stor19[_param1].field_0) * 0.5) + ceil32(stor19[_param1].field_1) + ceil32(uint255(stor19[_param1].field_0) * 0.5) + 224] = 0
              return Array(len=2 * Mask(256, -1, stor19[_param1].field_0), data=mem[ceil32(stor19[_param1].field_1) + 160 len ceil32(uint255(stor19[_param1].field_0) * 0.5)], mem[ceil32(stor19[_param1].field_1) + (2 * ceil32(uint255(stor19[_param1].field_0) * 0.5)) + 224 len 2 * ceil32(uint255(stor19[_param1].field_0) * 0.5)]), 
          if stor19[_param1].field_0 == stor19[_param1].field_1 < 32:
              revert with 'NH{q', 34
          if stor19[_param1].field_0:
              if stor19[_param1].field_0 == uint255(stor19[_param1].field_0) * 0.5 < 32:
                  revert with 'NH{q', 34
              if not Mask(256, -1, stor19[_param1].field_0):
                  mem[(2 * ceil32(stor19[_param1].field_1)) + 160] = 32
                  mem[(2 * ceil32(stor19[_param1].field_1)) + 192] = stor19[_param1].field_1
                  mem[(2 * ceil32(stor19[_param1].field_1)) + 224 len ceil32(stor19[_param1].field_1)] = mem[ceil32(stor19[_param1].field_1) + 160 len ceil32(stor19[_param1].field_1)]
                  if ceil32(stor19[_param1].field_1) > stor19[_param1].field_1:
                      mem[stor19[_param1].field_1 + (2 * ceil32(stor19[_param1].field_1)) + 224] = 0
                  return memory
                    from (2 * ceil32(stor19[_param1].field_1)) + 160
                     len (6 * ceil32(stor19[_param1].field_1)) + 64
              if 31 >= uint255(stor19[_param1].field_0) * 0.5:
                  mem[ceil32(stor19[_param1].field_1) + 160] = 256 * stor19[_param1].field_8
                  mem[(2 * ceil32(stor19[_param1].field_1)) + 160] = 32
                  mem[(2 * ceil32(stor19[_param1].field_1)) + 192] = stor19[_param1].field_1
                  mem[(2 * ceil32(stor19[_param1].field_1)) + 224 len ceil32(stor19[_param1].field_1)] = mem[ceil32(stor19[_param1].field_1) + 160 len ceil32(stor19[_param1].field_1)]
                  if ceil32(stor19[_param1].field_1) > stor19[_param1].field_1:
                      mem[stor19[_param1].field_1 + (2 * ceil32(stor19[_param1].field_1)) + 224] = 0
                  return memory
                    from (2 * ceil32(stor19[_param1].field_1)) + 160
                     len (6 * ceil32(stor19[_param1].field_1)) + 64
              mem[ceil32(stor19[_param1].field_1) + 160] = stor19[_param1].field_0
              idx = ceil32(stor19[_param1].field_1) + 160
              s = 0
              while ceil32(stor19[_param1].field_1) + (uint255(stor19[_param1].field_0) * 0.5) + 128 > idx:
                  mem[idx + 32] = stor19[_param1][s].field_256
                  idx = idx + 32
                  s = s + 1
                  continue 
          else:
              if stor19[_param1].field_0 == stor19[_param1].field_1 < 32:
                  revert with 'NH{q', 34
              if not stor19[_param1].field_1:
                  mem[(2 * ceil32(stor19[_param1].field_1)) + 160] = 32
                  mem[(2 * ceil32(stor19[_param1].field_1)) + 192] = stor19[_param1].field_1
                  mem[(2 * ceil32(stor19[_param1].field_1)) + 224 len ceil32(stor19[_param1].field_1)] = mem[ceil32(stor19[_param1].field_1) + 160 len ceil32(stor19[_param1].field_1)]
                  if ceil32(stor19[_param1].field_1) > stor19[_param1].field_1:
                      mem[stor19[_param1].field_1 + (2 * ceil32(stor19[_param1].field_1)) + 224] = 0
                  return memory
                    from (2 * ceil32(stor19[_param1].field_1)) + 160
                     len (6 * ceil32(stor19[_param1].field_1)) + 64
              if 31 >= stor19[_param1].field_1:
                  mem[ceil32(stor19[_param1].field_1) + 160] = 256 * stor19[_param1].field_8
                  mem[(2 * ceil32(stor19[_param1].field_1)) + 160] = 32
                  mem[(2 * ceil32(stor19[_param1].field_1)) + 192] = stor19[_param1].field_1
                  mem[(2 * ceil32(stor19[_param1].field_1)) + 224 len ceil32(stor19[_param1].field_1)] = mem[ceil32(stor19[_param1].field_1) + 160 len ceil32(stor19[_param1].field_1)]
                  if ceil32(stor19[_param1].field_1) > stor19[_param1].field_1:
                      mem[stor19[_param1].field_1 + (2 * ceil32(stor19[_param1].field_1)) + 224] = 0
                  return memory
                    from (2 * ceil32(stor19[_param1].field_1)) + 160
                     len (6 * ceil32(stor19[_param1].field_1)) + 64
              mem[ceil32(stor19[_param1].field_1) + 160] = stor19[_param1].field_0
              idx = ceil32(stor19[_param1].field_1) + 160
              s = 0
              while ceil32(stor19[_param1].field_1) + stor19[_param1].field_1 + 128 > idx:
                  mem[idx + 32] = stor19[_param1][s].field_256
                  idx = idx + 32
                  s = s + 1
                  continue 
          mem[(2 * ceil32(stor19[_param1].field_1)) + 160] = 32
          mem[(2 * ceil32(stor19[_param1].field_1)) + 192] = stor19[_param1].field_1
          mem[(2 * ceil32(stor19[_param1].field_1)) + 224 len ceil32(stor19[_param1].field_1)] = mem[ceil32(stor19[_param1].field_1) + 160 len ceil32(stor19[_param1].field_1)]
          if ceil32(stor19[_param1].field_1) > stor19[_param1].field_1:
              mem[stor19[_param1].field_1 + (2 * ceil32(stor19[_param1].field_1)) + 224] = 0
          return memory
            from (2 * ceil32(stor19[_param1].field_1)) + 160
             len (4 * ceil32(stor19[_param1].field_1)) + 64
      mem[128] = stor19[_param1].field_0
      idx = 128
      s = 0
      while stor19[_param1].field_1 + 96 > idx:
          mem[idx + 32] = stor19[_param1][s].field_256
          idx = idx + 32
          s = s + 1
          continue 
  if stor19[_param1].field_1:
      return Array(len=stor19[_param1].field_0, data=mem[128 len ceil32(stor19[_param1].field_1)])
  if not ownerOf[_param1]:
      revert with 0, 'URI query for nonexistent token'
  if stor19[_param1].field_0:
      if stor19[_param1].field_0 == uint255(stor19[_param1].field_0) * 0.5 < 32:
          revert with 'NH{q', 34
      if stor19[_param1].field_0:
          if stor19[_param1].field_0 == uint255(stor19[_param1].field_0) * 0.5 < 32:
              revert with 'NH{q', 34
          if Mask(256, -1, stor19[_param1].field_0):
              if 31 >= uint255(stor19[_param1].field_0) * 0.5:
                  mem[ceil32(stor19[_param1].field_1) + 160] = 256 * stor19[_param1].field_8
              else:
                  mem[ceil32(stor19[_param1].field_1) + 160] = stor19[_param1].field_0
                  idx = ceil32(stor19[_param1].field_1) + 160
                  s = 0
                  while ceil32(stor19[_param1].field_1) + (uint255(stor19[_param1].field_0) * 0.5) + 128 > idx:
                      mem[idx + 32] = stor19[_param1][s].field_256
                      idx = idx + 32
                      s = s + 1
                      continue 
      else:
          if stor19[_param1].field_0 == stor19[_param1].field_1 < 32:
              revert with 'NH{q', 34
          if stor19[_param1].field_1:
              if 31 >= stor19[_param1].field_1:
                  mem[ceil32(stor19[_param1].field_1) + 160] = 256 * stor19[_param1].field_8
              else:
                  mem[ceil32(stor19[_param1].field_1) + 160] = stor19[_param1].field_0
                  idx = ceil32(stor19[_param1].field_1) + 160
                  s = 0
                  while ceil32(stor19[_param1].field_1) + stor19[_param1].field_1 + 128 > idx:
                      mem[idx + 32] = stor19[_param1][s].field_256
                      idx = idx + 32
                      s = s + 1
                      continue 
      return Array(len=2 * Mask(256, -1, stor19[_param1].field_0), data=mem[ceil32(stor19[_param1].field_1) + 160 len ceil32(uint255(stor19[_param1].field_0) * 0.5)]), 
  if stor19[_param1].field_0 == stor19[_param1].field_1 < 32:
      revert with 'NH{q', 34
  if stor19[_param1].field_0:
      if stor19[_param1].field_0 == uint255(stor19[_param1].field_0) * 0.5 < 32:
          revert with 'NH{q', 34
      if not Mask(256, -1, stor19[_param1].field_0):
          mem[(2 * ceil32(stor19[_param1].field_1)) + 160] = 32
          mem[(2 * ceil32(stor19[_param1].field_1)) + 192] = stor19[_param1].field_1
          mem[(2 * ceil32(stor19[_param1].field_1)) + 224 len ceil32(stor19[_param1].field_1)] = mem[ceil32(stor19[_param1].field_1) + 160 len ceil32(stor19[_param1].field_1)]
          if ceil32(stor19[_param1].field_1) > stor19[_param1].field_1:
              mem[stor19[_param1].field_1 + (2 * ceil32(stor19[_param1].field_1)) + 224] = 0
          return memory
            from (2 * ceil32(stor19[_param1].field_1)) + 160
             len (4 * ceil32(stor19[_param1].field_1)) + 64
      if 31 >= uint255(stor19[_param1].field_0) * 0.5:
          mem[ceil32(stor19[_param1].field_1) + 160] = 256 * stor19[_param1].field_8
          mem[(2 * ceil32(stor19[_param1].field_1)) + 160] = 32
          mem[(2 * ceil32(stor19[_param1].field_1)) + 192] = stor19[_param1].field_1
          mem[(2 * ceil32(stor19[_param1].field_1)) + 224 len ceil32(stor19[_param1].field_1)] = mem[ceil32(stor19[_param1].field_1) + 160 len ceil32(stor19[_param1].field_1)]
          if ceil32(stor19[_param1].field_1) > stor19[_param1].field_1:
              mem[stor19[_param1].field_1 + (2 * ceil32(stor19[_param1].field_1)) + 224] = 0
          return memory
            from (2 * ceil32(stor19[_param1].field_1)) + 160
             len (4 * ceil32(stor19[_param1].field_1)) + 64
      mem[ceil32(stor19[_param1].field_1) + 160] = stor19[_param1].field_0
      idx = ceil32(stor19[_param1].field_1) + 160
      s = 0
      while ceil32(stor19[_param1].field_1) + (uint255(stor19[_param1].field_0) * 0.5) + 128 > idx:
          mem[idx + 32] = stor19[_param1][s].field_256
          idx = idx + 32
          s = s + 1
          continue 
  else:
      if stor19[_param1].field_0 == stor19[_param1].field_1 < 32:
          revert with 'NH{q', 34
      if not stor19[_param1].field_1:
          mem[(2 * ceil32(stor19[_param1].field_1)) + 160] = 32
          mem[(2 * ceil32(stor19[_param1].field_1)) + 192] = stor19[_param1].field_1
          mem[(2 * ceil32(stor19[_param1].field_1)) + 224 len ceil32(stor19[_param1].field_1)] = mem[ceil32(stor19[_param1].field_1) + 160 len ceil32(stor19[_param1].field_1)]
          if ceil32(stor19[_param1].field_1) > stor19[_param1].field_1:
              mem[stor19[_param1].field_1 + (2 * ceil32(stor19[_param1].field_1)) + 224] = 0
          return memory
            from (2 * ceil32(stor19[_param1].field_1)) + 160
             len (4 * ceil32(stor19[_param1].field_1)) + 64
      if 31 >= stor19[_param1].field_1:
          mem[ceil32(stor19[_param1].field_1) + 160] = 256 * stor19[_param1].field_8
          mem[(2 * ceil32(stor19[_param1].field_1)) + 160] = 32
          mem[(2 * ceil32(stor19[_param1].field_1)) + 192] = stor19[_param1].field_1
          mem[(2 * ceil32(stor19[_param1].field_1)) + 224 len ceil32(stor19[_param1].field_1)] = mem[ceil32(stor19[_param1].field_1) + 160 len ceil32(stor19[_param1].field_1)]
          if ceil32(stor19[_param1].field_1) > stor19[_param1].field_1:
              mem[stor19[_param1].field_1 + (2 * ceil32(stor19[_param1].field_1)) + 224] = 0
          return memory
            from (2 * ceil32(stor19[_param1].field_1)) + 160
             len (4 * ceil32(stor19[_param1].field_1)) + 64
      mem[ceil32(stor19[_param1].field_1) + 160] = stor19[_param1].field_0
      idx = ceil32(stor19[_param1].field_1) + 160
      s = 0
      while ceil32(stor19[_param1].field_1) + stor19[_param1].field_1 + 128 > idx:
          mem[idx + 32] = stor19[_param1][s].field_256
          idx = idx + 32
          s = s + 1
          continue 
  mem[(2 * ceil32(stor19[_param1].field_1)) + 160] = 32
  mem[(2 * ceil32(stor19[_param1].field_1)) + 192] = stor19[_param1].field_1
  mem[(2 * ceil32(stor19[_param1].field_1)) + 224 len ceil32(stor19[_param1].field_1)] = mem[ceil32(stor19[_param1].field_1) + 160 len ceil32(stor19[_param1].field_1)]
  if ceil32(stor19[_param1].field_1) <= stor19[_param1].field_1:
      return memory
        from (2 * ceil32(stor19[_param1].field_1)) + 160
         len ceil32(stor19[_param1].field_1) + 64
  mem[stor19[_param1].field_1 + (2 * ceil32(stor19[_param1].field_1)) + 224] = 0
  return memory
    from (2 * ceil32(stor19[_param1].field_1)) + 160
     len (5 * ceil32(stor19[_param1].field_1)) + 64

