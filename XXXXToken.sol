pragma solidity ^0.4.11;

import './IERC20.sol';
import './SafeMath.sol';

contract XXXXToken is IERC20 {

using SafeMath for uint256;

uint public _totalSupply = 0;

string public constant symbol = "XXXX";
string public constant name = "XXXX Token";
uint8 public constant decimals = 18;

// 1 eth = 420 XXXX
uint256 public constant rate = 420;

address public owner;

mapping(address => uin256) balances;
mapping(address => mapping(address => uint256)) allowed;

function () payable {
    createTokens();
}

function XXXXToken(){
    owner = msg.sender;
}

function createTokens() payable {
    require(msg.value > 0);
    
    uint256 tokens = msg.value.mul(rate);
    balances[msg.sender] = balances[msg.sender].add(tokens);
    _totalSupply = _totalSupply.add(tokens);
    
    owner.transfer(msg.value);
}

function XXXXToken() {
    balances[msg.sender] = _totalSupply;
}

function totalSupply() constant returns (uint256 totalSupply) {
    return _totalSupply;
}

function transfer(address _to, uint256 _value) returns (bool success) {
    reqiure(
        balances[msg.sender] >= _value
        && _value > 0
    );
    balances[msg.sender] = balances[msg.sender].sub(_value);
    balances[_to] = balances[_to].add(_value);
    Transfer(msg.sender, _to, _value);
    return true;
}

function transferFrom(address _from, address _ti, uint256 _value) returns (bool success){
    require(
        allowed[_from][msg.sender] >= _value
        && balances[_from] >= _value;
        && _value > 0
    );
    balances[_from] = balances[_from].sub(_value);
    balances[_to] = balances[_to].add(_value);
    allowed[_from][msg.sender] = allowed[_from][msg.sender].sub(_value);
    Transfer(_from, _to, value);
    return true;
    }
    
function approve(address _spender, uint256 _value) returns (bool success){
    approved[msg.sender][_spender] = _value;
    Approved(msg.sender, _spender, _value);
    return true;
}

function allowance(address _owner, address _spender) constant returns (uint256 remaining) {
  return allowed[_owner][_spender];
}

event Transfer(address indexed _from, address indexed _to, uint256 _value);
event Approval(address indexed _owner, address indexed _spender, uint256 _value);

}
