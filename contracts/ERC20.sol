// SPDX-License-Identifier: MIT

pragma solidity ^0.8.17;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/token/ERC20/extensions/ERC20Burnable.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract NoOwnerFixedNoMintNoBurnNoPause is ERC20 {

    uint8 immutable s_decimals;

    constructor(string memory name, string memory symbol, uint256 initialSupply, address owner, uint8 _decimals
                ) ERC20(name, symbol) {
         s_decimals =  _decimals; 
        _mint(owner, initialSupply * (10 ** decimals()));
    }

    function decimals() public view override returns (uint8) {
        return s_decimals;
    }
}

contract FactoryNoOwnerFixedNoMintNoBurnNoPause{
    function create(string memory name, string memory symbol, uint256 initialSupply, address owner, uint8 decimals) public returns (NoOwnerFixedNoMintNoBurnNoPause) {
        return new NoOwnerFixedNoMintNoBurnNoPause(name,symbol,initialSupply,owner,decimals);
    }
}

// Can't derive from Basic as if deriving from Basic and something that is ERC20 would need 
// to impelement the method that appears in both bases so same affect as just implementing the method 
// manually, although it does cause a little bit of duplication

contract NoOwnerFixedNoMintCanBurnNoPause is ERC20Burnable {

    uint8 immutable s_decimals;

    constructor(string memory name, string memory symbol, uint256 initialSupply, address owner, uint8 _decimals
                ) ERC20(name, symbol){
                    s_decimals =  _decimals; 
                    _mint(owner, initialSupply * (10 ** decimals()));
                }

    function decimals() public view override returns (uint8) {
        return s_decimals;
    }            


}

contract FactoryNoOwnerFixedNoMintCanBurnNoPause{
    function create(string memory name, string memory symbol, uint256 initialSupply, address owner, uint8 decimals) public returns (NoOwnerFixedNoMintCanBurnNoPause) {
        return new NoOwnerFixedNoMintCanBurnNoPause(name,symbol,initialSupply,owner,decimals);
    }
}

contract OwnedFixedNoMintNoBurnNoPause is ERC20, Ownable {

    uint8 immutable s_decimals;

    constructor(string memory name, string memory symbol, uint256 initialSupply, address owner, uint8 _decimals
                ) ERC20(name, symbol) {
                    transferOwnership(owner);
                    s_decimals =  _decimals; 
                    _mint(owner, initialSupply * (10 ** decimals()));
                }

    function decimals() public view override returns (uint8) {
        return s_decimals;
    }            


}

contract FactoryOwnedFixedNoMintNoBurnNoPause{
    function create(string memory name, string memory symbol, uint256 initialSupply, address owner, uint8 decimals) public returns (OwnedFixedNoMintNoBurnNoPause) {
        return new OwnedFixedNoMintNoBurnNoPause(name,symbol,initialSupply,owner,decimals);
    }
}
/////
contract RoleFixedNoMintNoBurnNoPause is ERC20, AccessControl {

    uint8 immutable s_decimals;

    constructor(string memory name, string memory symbol, uint256 initialSupply, address owner, uint8 _decimals
                ) ERC20(name, symbol) {
                    _grantRole(DEFAULT_ADMIN_ROLE, owner);
                    s_decimals =  _decimals; 
                    _mint(owner, initialSupply * (10 ** decimals()));
                }

    function decimals() public view override returns (uint8) {
        return s_decimals;
    }            


}

contract FactoryRoleFixedNoMintNoBurnNoPause{
    function create(string memory name, string memory symbol, uint256 initialSupply, address owner, uint8 decimals) public returns (RoleFixedNoMintNoBurnNoPause) {
        return new RoleFixedNoMintNoBurnNoPause(name,symbol,initialSupply,owner,decimals);
    }
}

/////

contract OwnedFixedNoMintCanBurnNoPause is ERC20, Ownable, ERC20Burnable {

    uint8 immutable s_decimals;

    constructor(string memory name, string memory symbol, uint256 initialSupply, address owner, uint8 _decimals
                ) ERC20(name, symbol) {
                    transferOwnership(owner);
                    s_decimals =  _decimals; 
                    _mint(owner, initialSupply * (10 ** decimals()));
                }

    function decimals() public view override returns (uint8) {
        return s_decimals;
    }            


}

contract FactoryOwnedFixedNoMintCanBurnNoPause{
    function create(string memory name, string memory symbol, uint256 initialSupply, address owner, uint8 decimals) public returns (OwnedFixedNoMintCanBurnNoPause) {
        return new OwnedFixedNoMintCanBurnNoPause(name,symbol,initialSupply,owner,decimals);
    }
}




















contract RoleFixedNoMintCanBurnNoPause is ERC20, AccessControl, ERC20Burnable {

    uint8 immutable s_decimals;

    constructor(string memory name, string memory symbol, uint256 initialSupply, address owner, uint8 _decimals
                ) ERC20(name, symbol) {
                    _grantRole(DEFAULT_ADMIN_ROLE, owner);
                    s_decimals =  _decimals; 
                    _mint(owner, initialSupply * (10 ** decimals()));
                }

    function decimals() public view override returns (uint8) {
        return s_decimals;
    }            


}

contract FactoryRoleFixedNoMintCanBurnNoPause{
    function create(string memory name, string memory symbol, uint256 initialSupply, address owner, uint8 decimals) public returns (RoleFixedNoMintCanBurnNoPause) {
        return new RoleFixedNoMintCanBurnNoPause(name,symbol,initialSupply,owner,decimals);
    }
}









contract OwnedFixedNoMintNoBurnCanPause is ERC20, Pausable, Ownable {
    
    uint8 immutable s_decimals;

    constructor(string memory name, string memory symbol, uint256 initialSupply, address owner, uint8 _decimals
                ) ERC20(name, symbol) {
                    transferOwnership(owner);
                    s_decimals =  _decimals; 
                    _mint(owner, initialSupply * (10 ** decimals()));
                }

    function decimals() public view override returns (uint8) {
        return s_decimals;
    }

    function pause() public onlyOwner {
        _pause();
    }

    function unpause() public onlyOwner {
        _unpause();
    }

    function _beforeTokenTransfer(address from, address to, uint256 amount)
        internal
        whenNotPaused
        override
    {
        super._beforeTokenTransfer(from, to, amount);
    }
}

contract FactoryOwnedFixedNoMintNoBurnCanPause{
    function create(string memory name, string memory symbol, uint256 initialSupply, address owner, uint8 decimals) public returns (OwnedFixedNoMintNoBurnCanPause) {
        return new OwnedFixedNoMintNoBurnCanPause(name,symbol,initialSupply,owner,decimals);
    }
}











contract RoleFixedNoMintNoBurnCanPause is ERC20, Pausable, AccessControl {

    bytes32 public constant PAUSER_ROLE = keccak256("PAUSER_ROLE");
    
    uint8 immutable s_decimals;

    constructor(string memory name, string memory symbol, uint256 initialSupply, address owner, uint8 _decimals
                ) ERC20(name, symbol) {
                    _grantRole(DEFAULT_ADMIN_ROLE, owner);
                    _grantRole(PAUSER_ROLE, owner);
                    s_decimals =  _decimals; 
                    _mint(owner, initialSupply * (10 ** decimals()));
                }

    function decimals() public view override returns (uint8) {
        return s_decimals;
    }

    function pause() public onlyRole(PAUSER_ROLE) {
        _pause();
    }

    function unpause() public onlyRole(PAUSER_ROLE) {
        _unpause();
    }

    function _beforeTokenTransfer(address from, address to, uint256 amount)
        internal
        whenNotPaused
        override
    {
        super._beforeTokenTransfer(from, to, amount);
    }
}

contract FactoryRoleFixedNoMintNoBurnCanPause{
    function create(string memory name, string memory symbol, uint256 initialSupply, address owner, uint8 decimals) public returns (RoleFixedNoMintNoBurnCanPause) {
        return new RoleFixedNoMintNoBurnCanPause(name,symbol,initialSupply,owner,decimals);
    }
}













contract OwnedFixedNoMintCanBurnCanPause is ERC20, Pausable, Ownable, ERC20Burnable {
    
    uint8 immutable s_decimals;

    constructor(string memory name, string memory symbol, uint256 initialSupply, address owner, uint8 _decimals
                ) ERC20(name, symbol) {
                    transferOwnership(owner);
                    s_decimals =  _decimals; 
                    _mint(owner, initialSupply * (10 ** decimals()));
                }

    function decimals() public view override returns (uint8) {
        return s_decimals;
    }

    function pause() public onlyOwner {
        _pause();
    }

    function unpause() public onlyOwner {
        _unpause();
    }

    function _beforeTokenTransfer(address from, address to, uint256 amount)
        internal
        whenNotPaused
        override
    {
        super._beforeTokenTransfer(from, to, amount);
    }
}

contract FactoryOwnedFixedNoMintCanBurnCanPause{
    function create(string memory name, string memory symbol, uint256 initialSupply, address owner, uint8 decimals) public returns (OwnedFixedNoMintCanBurnCanPause) {
        return new OwnedFixedNoMintCanBurnCanPause(name,symbol,initialSupply,owner,decimals);
    }
}






contract RoleFixedNoMintCanBurnCanPause is ERC20, Pausable, AccessControl, ERC20Burnable {

    bytes32 public constant PAUSER_ROLE = keccak256("PAUSER_ROLE");
    
    uint8 immutable s_decimals;

    constructor(string memory name, string memory symbol, uint256 initialSupply, address owner, uint8 _decimals
                ) ERC20(name, symbol) {
                    _grantRole(DEFAULT_ADMIN_ROLE, owner);
                    _grantRole(PAUSER_ROLE, owner);
                    s_decimals =  _decimals; 
                    _mint(owner, initialSupply * (10 ** decimals()));
                }

    function decimals() public view override returns (uint8) {
        return s_decimals;
    }

    function pause() public onlyRole(PAUSER_ROLE) {
        _pause();
    }

    function unpause() public onlyRole(PAUSER_ROLE) {
        _unpause();
    }

    function _beforeTokenTransfer(address from, address to, uint256 amount)
        internal
        whenNotPaused
        override
    {
        super._beforeTokenTransfer(from, to, amount);
    }
}

contract FactoryRoleFixedNoMintCanBurnCanPause{
    function create(string memory name, string memory symbol, uint256 initialSupply, address owner, uint8 decimals) public returns (RoleFixedNoMintCanBurnCanPause) {
        return new RoleFixedNoMintCanBurnCanPause(name,symbol,initialSupply,owner,decimals);
    }
}








contract OwnedUnlimitCanMintCanBurnCanPause is ERC20, Pausable, Ownable, ERC20Burnable {
    
    uint8 immutable s_decimals;

    constructor(string memory name, string memory symbol, uint256 initialSupply, address owner, uint8 _decimals
                ) ERC20(name, symbol) {
                    transferOwnership(owner);
                    s_decimals =  _decimals; 
                    _mint(owner, initialSupply * (10 ** decimals()));
                }

    function decimals() public view override returns (uint8) {
        return s_decimals;
    }

    function mint(address to, uint256 amount) public onlyOwner {
        _mint(to, amount);
    }

    function pause() public onlyOwner {
        _pause();
    }

    function unpause() public onlyOwner {
        _unpause();
    }

    function _beforeTokenTransfer(address from, address to, uint256 amount)
        internal
        whenNotPaused
        override
    {
        super._beforeTokenTransfer(from, to, amount);
    }
}

contract FactoryOwnedUnlimitCanMintCanBurnCanPause{
    function create(string memory name, string memory symbol, uint256 initialSupply, address owner, uint8 decimals) public returns (OwnedUnlimitCanMintCanBurnCanPause) {
        return new OwnedUnlimitCanMintCanBurnCanPause(name,symbol,initialSupply,owner,decimals);
    }
}








contract RoleUnlimitCanMintCanBurnCanPause is ERC20, Pausable, AccessControl, ERC20Burnable {

    bytes32 public constant PAUSER_ROLE = keccak256("PAUSER_ROLE");

    bytes32 public constant MINTER_ROLE = keccak256("MINTER_ROLE");
    
    uint8 immutable s_decimals;

    constructor(string memory name, string memory symbol, uint256 initialSupply, address owner, uint8 _decimals
                ) ERC20(name, symbol) {
                    _grantRole(DEFAULT_ADMIN_ROLE, owner);
                    _grantRole(PAUSER_ROLE, owner);
                    _grantRole(MINTER_ROLE, owner);
                    s_decimals =  _decimals; 
                    _mint(owner, initialSupply * (10 ** decimals()));
                }

    function decimals() public view override returns (uint8) {
        return s_decimals;
    }

    function mint(address to, uint256 amount) public onlyRole(MINTER_ROLE) {
        _mint(to, amount);
    }

    function pause() public onlyRole(PAUSER_ROLE) {
        _pause();
    }

    function unpause() public onlyRole(PAUSER_ROLE) {
        _unpause();
    }

    function _beforeTokenTransfer(address from, address to, uint256 amount)
        internal
        whenNotPaused
        override
    {
        super._beforeTokenTransfer(from, to, amount);
    }
}

contract FactoryRoleUnlimitCanMintCanBurnCanPause{
    function create(string memory name, string memory symbol, uint256 initialSupply, address owner, uint8 decimals) public returns (RoleUnlimitCanMintCanBurnCanPause) {
        return new RoleUnlimitCanMintCanBurnCanPause(name,symbol,initialSupply,owner,decimals);
    }
}






contract OwnedUnlimitCanMintNoBurnCanPause is ERC20, Pausable, Ownable {
    
    uint8 immutable s_decimals;

    constructor(string memory name, string memory symbol, uint256 initialSupply, address owner, uint8 _decimals
                ) ERC20(name, symbol) {
                    transferOwnership(owner);
                    s_decimals =  _decimals; 
                    _mint(owner, initialSupply * (10 ** decimals()));
                }

    function decimals() public view override returns (uint8) {
        return s_decimals;
    }

    function mint(address to, uint256 amount) public onlyOwner {
        _mint(to, amount);
    }

    function pause() public onlyOwner {
        _pause();
    }

    function unpause() public onlyOwner {
        _unpause();
    }

    function _beforeTokenTransfer(address from, address to, uint256 amount)
        internal
        whenNotPaused
        override
    {
        super._beforeTokenTransfer(from, to, amount);
    }
}

contract FactoryOwnedUnlimitCanMintNoBurnCanPause{
    function create(string memory name, string memory symbol, uint256 initialSupply, address owner, uint8 decimals) public returns (OwnedUnlimitCanMintNoBurnCanPause) {
        return new OwnedUnlimitCanMintNoBurnCanPause(name,symbol,initialSupply,owner,decimals);
    }
}









contract RoleUnlimitCanMintNoBurnCanPause is ERC20, Pausable, AccessControl {

    bytes32 public constant PAUSER_ROLE = keccak256("PAUSER_ROLE");
    bytes32 public constant MINTER_ROLE = keccak256("MINTER_ROLE");
    
    uint8 immutable s_decimals;

    constructor(string memory name, string memory symbol, uint256 initialSupply, address owner, uint8 _decimals
                ) ERC20(name, symbol) {
                    _grantRole(DEFAULT_ADMIN_ROLE, owner);
                    _grantRole(PAUSER_ROLE, owner);
                    _grantRole(MINTER_ROLE, owner);
                    s_decimals =  _decimals; 
                    _mint(owner, initialSupply * (10 ** decimals()));
                }

    function decimals() public view override returns (uint8) {
        return s_decimals;
    }

    function mint(address to, uint256 amount) public onlyRole(MINTER_ROLE) {
        _mint(to, amount);
    }

    function pause() public onlyRole(PAUSER_ROLE) {
        _pause();
    }

    function unpause() public onlyRole(PAUSER_ROLE) {
        _unpause();
    }

    function _beforeTokenTransfer(address from, address to, uint256 amount)
        internal
        whenNotPaused
        override
    {
        super._beforeTokenTransfer(from, to, amount);
    }
}

contract FactoryRoleUnlimitCanMintNoBurnCanPause{
    function create(string memory name, string memory symbol, uint256 initialSupply, address owner, uint8 decimals) public returns (RoleUnlimitCanMintNoBurnCanPause) {
        return new RoleUnlimitCanMintNoBurnCanPause(name,symbol,initialSupply,owner,decimals);
    }
}









contract OwnedUnlimitCanMintNoBurnNoPause is ERC20, Ownable {
    
    uint8 immutable s_decimals;

    constructor(string memory name, string memory symbol, uint256 initialSupply, address owner, uint8 _decimals
                ) ERC20(name, symbol) {
                    transferOwnership(owner);
                    s_decimals =  _decimals; 
                    _mint(owner, initialSupply * (10 ** decimals()));
                }

    function decimals() public view override returns (uint8) {
        return s_decimals;
    }

    function mint(address to, uint256 amount) public onlyOwner {
        _mint(to, amount);
    }


}

contract FactoryOwnedUnlimitCanMintNoBurnNoPause{
    function create(string memory name, string memory symbol, uint256 initialSupply, address owner, uint8 decimals) public returns (OwnedUnlimitCanMintNoBurnNoPause) {
        return new OwnedUnlimitCanMintNoBurnNoPause(name,symbol,initialSupply,owner,decimals);
    }
}






contract RoleUnlimitCanMintNoBurnNoPause is ERC20, AccessControl {

    bytes32 public constant MINTER_ROLE = keccak256("MINTER_ROLE");
    
    uint8 immutable s_decimals;

    constructor(string memory name, string memory symbol, uint256 initialSupply, address owner, uint8 _decimals
                ) ERC20(name, symbol) {
                    _grantRole(DEFAULT_ADMIN_ROLE, owner);
                    _grantRole(MINTER_ROLE, owner);
                    s_decimals =  _decimals; 
                    _mint(owner, initialSupply * (10 ** decimals()));
                }

    function decimals() public view override returns (uint8) {
        return s_decimals;
    }

    function mint(address to, uint256 amount) public onlyRole(MINTER_ROLE) {
        _mint(to, amount);
    }


}

contract FactoryRoleUnlimitCanMintNoBurnNoPause{
    function create(string memory name, string memory symbol, uint256 initialSupply, address owner, uint8 decimals) public returns (RoleUnlimitCanMintNoBurnNoPause) {
        return new RoleUnlimitCanMintNoBurnNoPause(name,symbol,initialSupply,owner,decimals);
    }
}







contract OwnedUnlimitCanMintCanBurnNoPause is ERC20, Ownable, ERC20Burnable {
    
    uint8 immutable s_decimals;

    constructor(string memory name, string memory symbol, uint256 initialSupply, address owner, uint8 _decimals
                ) ERC20(name, symbol) {
                    transferOwnership(owner);
                    s_decimals =  _decimals; 
                    _mint(owner, initialSupply * (10 ** decimals()));
                }

    function decimals() public view override returns (uint8) {
        return s_decimals;
    }

    function mint(address to, uint256 amount) public onlyOwner {
        _mint(to, amount);
    }


}

contract FactoryOwnedUnlimitCanMintCanBurnNoPause{
    function create(string memory name, string memory symbol, uint256 initialSupply, address owner, uint8 decimals) public returns (OwnedUnlimitCanMintCanBurnNoPause) {
        return new OwnedUnlimitCanMintCanBurnNoPause(name,symbol,initialSupply,owner,decimals);
    }
}








contract RoleUnlimitCanMintCanBurnNoPause is ERC20, AccessControl, ERC20Burnable {

    bytes32 public constant MINTER_ROLE = keccak256("MINTER_ROLE");
    
    uint8 immutable s_decimals;

    constructor(string memory name, string memory symbol, uint256 initialSupply, address owner, uint8 _decimals
                ) ERC20(name, symbol) {
                    _grantRole(DEFAULT_ADMIN_ROLE, owner);
                    _grantRole(MINTER_ROLE, owner);
                    s_decimals =  _decimals; 
                    _mint(owner, initialSupply * (10 ** decimals()));
                }

    function decimals() public view override returns (uint8) {
        return s_decimals;
    }

    function mint(address to, uint256 amount) public onlyRole(MINTER_ROLE) {
        _mint(to, amount);
    }


}

contract FactoryRoleUnlimitCanMintCanBurnNoPause{
    function create(string memory name, string memory symbol, uint256 initialSupply, address owner, uint8 decimals) public returns (RoleUnlimitCanMintCanBurnNoPause) {
        return new RoleUnlimitCanMintCanBurnNoPause(name,symbol,initialSupply,owner,decimals);
    }
}








contract OwnedCappedCanMintCanBurnCanPause is ERC20, Pausable, Ownable, ERC20Burnable {
    
    uint8 immutable s_decimals;
    uint256 private immutable s_cap;

    constructor(string memory name, string memory symbol, uint256 initialSupply, address owner, uint8 _decimals, uint256 _cap
                ) ERC20(name, symbol) {
                    transferOwnership(owner);
                    s_decimals =  _decimals;
                    require(_cap > 0, "ERC20Capped: cap is 0");
                    s_cap = _cap;
                    _mint(owner, initialSupply * (10 ** decimals()));
                }

                            
    function cap() public view returns (uint256) {
        return s_cap;
    }

    function mint(address to, uint256 amount) public onlyOwner {
        require(ERC20.totalSupply() + amount <= cap(), "ERC20Capped: cap exceeded");
        _mint(to, amount);
    }
    
    function pause() public onlyOwner {
        _pause();
    }

    function unpause() public onlyOwner {
        _unpause();
    }

    function _beforeTokenTransfer(address from, address to, uint256 amount)
        internal
        whenNotPaused
        override
    {
        super._beforeTokenTransfer(from, to, amount);
    }
}

contract FactoryOwnedCappedCanMintCanBurnCanPause{
    function create(string memory name, string memory symbol, uint256 initialSupply, address owner, uint8 decimals, uint256 _cap) public returns (OwnedCappedCanMintCanBurnCanPause) {
        return new OwnedCappedCanMintCanBurnCanPause(name,symbol,initialSupply,owner,decimals,_cap);
    }
}











contract RoleCappedCanMintCanBurnCanPause is ERC20, Pausable, AccessControl, ERC20Burnable {

    bytes32 public constant PAUSER_ROLE = keccak256("PAUSER_ROLE");
    bytes32 public constant MINTER_ROLE = keccak256("MINTER_ROLE");
    
    uint8 immutable s_decimals;
    uint256 private immutable s_cap;

    constructor(string memory name, string memory symbol, uint256 initialSupply, address owner, uint8 _decimals, uint256 _cap
                ) ERC20(name, symbol) {
                    _grantRole(DEFAULT_ADMIN_ROLE, owner);
                    _grantRole(PAUSER_ROLE, owner);
                    _grantRole(MINTER_ROLE, owner);
                    s_decimals =  _decimals;
                    require(_cap > 0, "ERC20Capped: cap is 0");
                    s_cap = _cap;
                    _mint(owner, initialSupply * (10 ** decimals()));
                }

                            
    function cap() public view returns (uint256) {
        return s_cap;
    }

    function mint(address to, uint256 amount) public onlyRole(MINTER_ROLE) {
        require(ERC20.totalSupply() + amount <= cap(), "ERC20Capped: cap exceeded");
        _mint(to, amount);
    }
    
    function pause() public onlyRole(PAUSER_ROLE) {
        _pause();
    }

    function unpause() public onlyRole(PAUSER_ROLE) {
        _unpause();
    }

    function _beforeTokenTransfer(address from, address to, uint256 amount)
        internal
        whenNotPaused
        override
    {
        super._beforeTokenTransfer(from, to, amount);
    }
}

contract FactoryRoleCappedCanMintCanBurnCanPause{
    function create(string memory name, string memory symbol, uint256 initialSupply, address owner, uint8 decimals, uint256 _cap) public returns (RoleCappedCanMintCanBurnCanPause) {
        return new RoleCappedCanMintCanBurnCanPause(name,symbol,initialSupply,owner,decimals,_cap);
    }
}









contract OwnedCappedCanMintNoBurnCanPause is ERC20, Pausable, Ownable {
    
    uint8 immutable s_decimals;
    uint256 private immutable s_cap;

    constructor(string memory name, string memory symbol, uint256 initialSupply, address owner, uint8 _decimals, uint256 _cap
                ) ERC20(name, symbol) {
                    transferOwnership(owner);
                    s_decimals =  _decimals;
                    require(_cap > 0, "ERC20Capped: cap is 0");
                    s_cap = _cap;
                    _mint(owner, initialSupply * (10 ** decimals()));
                }

                            
    function cap() public view returns (uint256) {
        return s_cap;
    }

    function mint(address to, uint256 amount) public onlyOwner {
        require(ERC20.totalSupply() + amount <= cap(), "ERC20Capped: cap exceeded");
        _mint(to, amount);
    }
    
    function pause() public onlyOwner {
        _pause();
    }

    function unpause() public onlyOwner {
        _unpause();
    }

    function _beforeTokenTransfer(address from, address to, uint256 amount)
        internal
        whenNotPaused
        override
    {
        super._beforeTokenTransfer(from, to, amount);
    }
}

contract FactoryOwnedCappedCanMintNoBurnCanPause{
    function create(string memory name, string memory symbol, uint256 initialSupply, address owner, uint8 decimals, uint256 _cap) public returns (OwnedCappedCanMintNoBurnCanPause) {
        return new OwnedCappedCanMintNoBurnCanPause(name,symbol,initialSupply,owner,decimals,_cap);
    }
}










contract RoleCappedCanMintNoBurnCanPause is ERC20, Pausable, AccessControl {

    bytes32 public constant PAUSER_ROLE = keccak256("PAUSER_ROLE");
    bytes32 public constant MINTER_ROLE = keccak256("MINTER_ROLE");
    
    uint8 immutable s_decimals;
    uint256 private immutable s_cap;

    constructor(string memory name, string memory symbol, uint256 initialSupply, address owner, uint8 _decimals, uint256 _cap
                ) ERC20(name, symbol) {
                    _grantRole(DEFAULT_ADMIN_ROLE, owner);
                    _grantRole(PAUSER_ROLE, owner);
                    _grantRole(MINTER_ROLE, owner);
                    s_decimals =  _decimals;
                    require(_cap > 0, "ERC20Capped: cap is 0");
                    s_cap = _cap;
                    _mint(owner, initialSupply * (10 ** decimals()));
                }

                            
    function cap() public view returns (uint256) {
        return s_cap;
    }

    function mint(address to, uint256 amount) public onlyRole(MINTER_ROLE) {
        require(ERC20.totalSupply() + amount <= cap(), "ERC20Capped: cap exceeded");
        _mint(to, amount);
    }
    
    function pause() public onlyRole(PAUSER_ROLE) {
        _pause();
    }

    function unpause() public onlyRole(PAUSER_ROLE) {
        _unpause();
    }

    function _beforeTokenTransfer(address from, address to, uint256 amount)
        internal
        whenNotPaused
        override
    {
        super._beforeTokenTransfer(from, to, amount);
    }
}

contract FactoryRoleCappedCanMintNoBurnCanPause{
    function create(string memory name, string memory symbol, uint256 initialSupply, address owner, uint8 decimals, uint256 _cap) public returns (RoleCappedCanMintNoBurnCanPause) {
        return new RoleCappedCanMintNoBurnCanPause(name,symbol,initialSupply,owner,decimals,_cap);
    }
}








contract OwnedCappedCanMintCanBurnNoPause is ERC20, Ownable, ERC20Burnable {
    
    uint8 immutable s_decimals;
    uint256 private immutable s_cap;

    constructor(string memory name, string memory symbol, uint256 initialSupply, address owner, uint8 _decimals, uint256 _cap
                ) ERC20(name, symbol) {
                    transferOwnership(owner);
                    s_decimals =  _decimals;
                    require(_cap > 0, "ERC20Capped: cap is 0");
                    s_cap = _cap;
                    _mint(owner, initialSupply * (10 ** decimals()));
                }

                            
    function cap() public view returns (uint256) {
        return s_cap;
    }

    function mint(address to, uint256 amount) public onlyOwner {
        require(ERC20.totalSupply() + amount <= cap(), "ERC20Capped: cap exceeded");
        _mint(to, amount);
    }
    
}

contract FactoryOwnedCappedCanMintCanBurnNoPause{
    function create(string memory name, string memory symbol, uint256 initialSupply, address owner, uint8 decimals, uint256 _cap) public returns (OwnedCappedCanMintCanBurnNoPause) {
        return new OwnedCappedCanMintCanBurnNoPause(name,symbol,initialSupply,owner,decimals,_cap);
    }
}







contract RoleCappedCanMintCanBurnNoPause is ERC20, AccessControl, ERC20Burnable {

    bytes32 public constant MINTER_ROLE = keccak256("MINTER_ROLE");
    
    uint8 immutable s_decimals;
    uint256 private immutable s_cap;

    constructor(string memory name, string memory symbol, uint256 initialSupply, address owner, uint8 _decimals, uint256 _cap
                ) ERC20(name, symbol) {
                    _grantRole(DEFAULT_ADMIN_ROLE, owner);
                    _grantRole(MINTER_ROLE, owner);
                    s_decimals =  _decimals;
                    require(_cap > 0, "ERC20Capped: cap is 0");
                    s_cap = _cap;
                    _mint(owner, initialSupply * (10 ** decimals()));
                }

                            
    function cap() public view returns (uint256) {
        return s_cap;
    }

    function mint(address to, uint256 amount) public onlyRole(MINTER_ROLE) {
        require(ERC20.totalSupply() + amount <= cap(), "ERC20Capped: cap exceeded");
        _mint(to, amount);
    }
    
}

contract FactoryRoleCappedCanMintCanBurnNoPause{
    function create(string memory name, string memory symbol, uint256 initialSupply, address owner, uint8 decimals, uint256 _cap) public returns (RoleCappedCanMintCanBurnNoPause) {
        return new RoleCappedCanMintCanBurnNoPause(name,symbol,initialSupply,owner,decimals,_cap);
    }
}








contract OwnedCappedCanMintNoBurnNoPause is ERC20, Ownable {
    
    uint8 immutable s_decimals;
    uint256 private immutable s_cap;

    constructor(string memory name, string memory symbol, uint256 initialSupply, address owner, uint8 _decimals, uint256 _cap
                ) ERC20(name, symbol) {
                    transferOwnership(owner);
                    s_decimals =  _decimals;
                    require(_cap > 0, "ERC20Capped: cap is 0");
                    s_cap = _cap;
                    _mint(owner, initialSupply * (10 ** decimals()));
                }

                            
    function cap() public view returns (uint256) {
        return s_cap;
    }

    function mint(address to, uint256 amount) public onlyOwner {
        require(ERC20.totalSupply() + amount <= cap(), "ERC20Capped: cap exceeded");
        _mint(to, amount);
    }
    
}

contract FactoryOwnedCappedCanMintNoBurnNoPause{
    function create(string memory name, string memory symbol, uint256 initialSupply, address owner, uint8 decimals, uint256 _cap) public returns (OwnedCappedCanMintNoBurnNoPause) {
        return new OwnedCappedCanMintNoBurnNoPause(name,symbol,initialSupply,owner,decimals,_cap);
    }
}


contract RoleCappedCanMintNoBurnNoPause is ERC20, AccessControl {

    bytes32 public constant MINTER_ROLE = keccak256("MINTER_ROLE");
    
    uint8 immutable s_decimals;
    uint256 private immutable s_cap;

    constructor(string memory name, string memory symbol, uint256 initialSupply, address owner, uint8 _decimals, uint256 _cap
                ) ERC20(name, symbol) {
                    _grantRole(DEFAULT_ADMIN_ROLE, owner);
                    _grantRole(MINTER_ROLE, owner);
                    s_decimals =  _decimals;
                    require(_cap > 0, "ERC20Capped: cap is 0");
                    s_cap = _cap;
                    _mint(owner, initialSupply * (10 ** decimals()));
                }

                            
    function cap() public view returns (uint256) {
        return s_cap;
    }

    function mint(address to, uint256 amount) public onlyRole(MINTER_ROLE) {
        require(ERC20.totalSupply() + amount <= cap(), "ERC20Capped: cap exceeded");
        _mint(to, amount);
    }
    
}

contract FactoryRoleCappedCanMintNoBurnNoPause{
    function create(string memory name, string memory symbol, uint256 initialSupply, address owner, uint8 decimals, uint256 _cap) public returns (RoleCappedCanMintNoBurnNoPause) {
        return new RoleCappedCanMintNoBurnNoPause(name,symbol,initialSupply,owner,decimals,_cap);
    }
}




contract Rator {
    FactoryNoOwnerFixedNoMintNoBurnNoPause immutable factoryNoOwnerFixedNoMintNoBurnNoPause;
    FactoryNoOwnerFixedNoMintCanBurnNoPause immutable factoryNoOwnerFixedNoMintCanBurnNoPause;
    FactoryOwnedFixedNoMintNoBurnNoPause immutable factoryOwnedFixedNoMintNoBurnNoPause;
    FactoryOwnedFixedNoMintCanBurnNoPause immutable factoryOwnedFixedNoMintCanBurnNoPause;
    FactoryOwnedFixedNoMintNoBurnCanPause immutable factoryOwnedFixedNoMintNoBurnCanPause;
    FactoryOwnedFixedNoMintCanBurnCanPause immutable factoryOwnedFixedNoMintCanBurnCanPause;
    FactoryOwnedUnlimitCanMintCanBurnCanPause immutable factoryOwnedUnlimitCanMintCanBurnCanPause;
    FactoryOwnedUnlimitCanMintNoBurnCanPause immutable factoryOwnedUnlimitCanMintNoBurnCanPause;
    FactoryOwnedUnlimitCanMintNoBurnNoPause immutable factoryOwnedUnlimitCanMintNoBurnNoPause;
    FactoryOwnedUnlimitCanMintCanBurnNoPause immutable factoryOwnedUnlimitCanMintCanBurnNoPause;
    FactoryOwnedCappedCanMintCanBurnCanPause immutable factoryOwnedCappedCanMintCanBurnCanPause;
    FactoryOwnedCappedCanMintNoBurnCanPause immutable factoryOwnedCappedCanMintNoBurnCanPause;
    FactoryOwnedCappedCanMintCanBurnNoPause immutable factoryOwnedCappedCanMintCanBurnNoPause;
    FactoryOwnedCappedCanMintNoBurnNoPause immutable factoryOwnedCappedCanMintNoBurnNoPause;
    

    FactoryRoleFixedNoMintNoBurnNoPause immutable factoryRoleFixedNoMintNoBurnNoPause;
    FactoryRoleFixedNoMintCanBurnNoPause immutable factoryRoleFixedNoMintCanBurnNoPause;
    FactoryRoleFixedNoMintNoBurnCanPause immutable factoryRoleFixedNoMintNoBurnCanPause;
    FactoryRoleFixedNoMintCanBurnCanPause immutable factoryRoleFixedNoMintCanBurnCanPause;
    FactoryRoleUnlimitCanMintCanBurnCanPause immutable factoryRoleUnlimitCanMintCanBurnCanPause;
    FactoryRoleUnlimitCanMintNoBurnCanPause immutable factoryRoleUnlimitCanMintNoBurnCanPause;
    FactoryRoleUnlimitCanMintNoBurnNoPause immutable factoryRoleUnlimitCanMintNoBurnNoPause;
    FactoryRoleUnlimitCanMintCanBurnNoPause immutable factoryRoleUnlimitCanMintCanBurnNoPause;
    FactoryRoleCappedCanMintCanBurnCanPause immutable factoryRoleCappedCanMintCanBurnCanPause;
    FactoryRoleCappedCanMintNoBurnCanPause immutable factoryRoleCappedCanMintNoBurnCanPause;
    FactoryRoleCappedCanMintCanBurnNoPause immutable factoryRoleCappedCanMintCanBurnNoPause;
    FactoryRoleCappedCanMintNoBurnNoPause immutable factoryRoleCappedCanMintNoBurnNoPause;

    constructor(){
        factoryNoOwnerFixedNoMintNoBurnNoPause = new FactoryNoOwnerFixedNoMintNoBurnNoPause();
        factoryNoOwnerFixedNoMintCanBurnNoPause = new FactoryNoOwnerFixedNoMintCanBurnNoPause();
        factoryOwnedFixedNoMintNoBurnNoPause = new FactoryOwnedFixedNoMintNoBurnNoPause();
        factoryOwnedFixedNoMintCanBurnNoPause = new FactoryOwnedFixedNoMintCanBurnNoPause();
        factoryOwnedFixedNoMintNoBurnCanPause = new FactoryOwnedFixedNoMintNoBurnCanPause();
        factoryOwnedFixedNoMintCanBurnCanPause = new FactoryOwnedFixedNoMintCanBurnCanPause();
        factoryOwnedUnlimitCanMintCanBurnCanPause = new FactoryOwnedUnlimitCanMintCanBurnCanPause();
        factoryOwnedUnlimitCanMintNoBurnCanPause = new FactoryOwnedUnlimitCanMintNoBurnCanPause();
        factoryOwnedUnlimitCanMintNoBurnNoPause = new FactoryOwnedUnlimitCanMintNoBurnNoPause();
        factoryOwnedUnlimitCanMintCanBurnNoPause = new FactoryOwnedUnlimitCanMintCanBurnNoPause();
        factoryOwnedCappedCanMintCanBurnCanPause = new FactoryOwnedCappedCanMintCanBurnCanPause();
        factoryOwnedCappedCanMintNoBurnCanPause = new FactoryOwnedCappedCanMintNoBurnCanPause();
        factoryOwnedCappedCanMintCanBurnNoPause = new FactoryOwnedCappedCanMintCanBurnNoPause();
        factoryOwnedCappedCanMintNoBurnNoPause = new FactoryOwnedCappedCanMintNoBurnNoPause();

        factoryRoleFixedNoMintNoBurnNoPause = new FactoryRoleFixedNoMintNoBurnNoPause();
        factoryRoleFixedNoMintCanBurnNoPause = new FactoryRoleFixedNoMintCanBurnNoPause();
        factoryRoleFixedNoMintNoBurnCanPause = new FactoryRoleFixedNoMintNoBurnCanPause();
        factoryRoleFixedNoMintCanBurnCanPause = new FactoryRoleFixedNoMintCanBurnCanPause();
        factoryRoleUnlimitCanMintCanBurnCanPause = new FactoryRoleUnlimitCanMintCanBurnCanPause();
        factoryRoleUnlimitCanMintNoBurnCanPause = new FactoryRoleUnlimitCanMintNoBurnCanPause();
        factoryRoleUnlimitCanMintNoBurnNoPause = new FactoryRoleUnlimitCanMintNoBurnNoPause();
        factoryRoleUnlimitCanMintCanBurnNoPause = new FactoryRoleUnlimitCanMintCanBurnNoPause();
        factoryRoleCappedCanMintCanBurnCanPause = new FactoryRoleCappedCanMintCanBurnCanPause();
        factoryRoleCappedCanMintNoBurnCanPause = new FactoryRoleCappedCanMintNoBurnCanPause();
        factoryRoleCappedCanMintCanBurnNoPause = new FactoryRoleCappedCanMintCanBurnNoPause();
        factoryRoleCappedCanMintNoBurnNoPause = new FactoryRoleCappedCanMintNoBurnNoPause();
    }

    mapping(address => address) public ownerToTokenTable;

    function CreateNoOwnerFixedNoMintNoBurnNoPause(string memory name, string memory symbol, uint256 initialSupply, address owner, uint8 decimals) public returns(address) {
                        
                        NoOwnerFixedNoMintNoBurnNoPause token = factoryNoOwnerFixedNoMintNoBurnNoPause.create(name,symbol,initialSupply,owner,decimals);
                        ownerToTokenTable[owner] = address(token);
                        return address(token);
    }

    function CreateNoOwnerFixedNoMintCanBurnNoPause(string memory name, string memory symbol, uint256 initialSupply, address owner, uint8 decimals) public returns(address) {
                        
                        NoOwnerFixedNoMintCanBurnNoPause token = factoryNoOwnerFixedNoMintCanBurnNoPause.create(name,symbol,initialSupply,owner,decimals);
                        ownerToTokenTable[owner] = address(token);
                        return address(token);
    }

    function CreateOwnedFixedNoMintNoBurnNoPause(string memory name, string memory symbol, uint256 initialSupply, address owner, uint8 decimals) public returns(address) {
                        
                        OwnedFixedNoMintNoBurnNoPause token = factoryOwnedFixedNoMintNoBurnNoPause.create(name,symbol,initialSupply,owner,decimals);
                        ownerToTokenTable[owner] = address(token);
                        return address(token);
    }

    function CreateOwnedFixedNoMintNoBurnCanPause(string memory name, string memory symbol, uint256 initialSupply, address owner, uint8 decimals) public returns(address) {
                        
                        OwnedFixedNoMintNoBurnCanPause token = factoryOwnedFixedNoMintNoBurnCanPause.create(name,symbol,initialSupply,owner,decimals);
                        ownerToTokenTable[owner] = address(token);
                        return address(token);
    }

    function CreateOwnedFixedNoMintCanBurnCanPause(string memory name, string memory symbol, uint256 initialSupply, address owner, uint8 decimals) public returns(address) {
                        
                        OwnedFixedNoMintCanBurnCanPause token = factoryOwnedFixedNoMintCanBurnCanPause.create(name,symbol,initialSupply,owner,decimals);
                        ownerToTokenTable[owner] = address(token);
                        return address(token);
    }

    function CreateOwnedFixedNoMintCanBurnNoPause(string memory name, string memory symbol, uint256 initialSupply, address owner, uint8 decimals) public returns(address) {
                        
                        OwnedFixedNoMintCanBurnNoPause token = factoryOwnedFixedNoMintCanBurnNoPause.create(name,symbol,initialSupply,owner,decimals);
                        ownerToTokenTable[owner] = address(token);
                        return address(token);
    }

    function CreateOwnedUnlimitCanMintCanBurnCanPause(string memory name, string memory symbol, uint256 initialSupply, address owner, uint8 decimals) public returns(address) {
                        
                        OwnedUnlimitCanMintCanBurnCanPause token = factoryOwnedUnlimitCanMintCanBurnCanPause.create(name,symbol,initialSupply,owner,decimals);
                        ownerToTokenTable[owner] = address(token);
                        return address(token);
    }

    function CreateOwnedUnlimitCanMintNoBurnCanPause(string memory name, string memory symbol, uint256 initialSupply, address owner, uint8 decimals) public returns(address) {
                        
                        OwnedUnlimitCanMintNoBurnCanPause token = factoryOwnedUnlimitCanMintNoBurnCanPause.create(name,symbol,initialSupply,owner,decimals);
                        ownerToTokenTable[owner] = address(token);
                        return address(token);
    }

    function CreateOwnedUnlimitCanMintNoBurnNoPause(string memory name, string memory symbol, uint256 initialSupply, address owner, uint8 decimals) public returns(address) {
                        
                        OwnedUnlimitCanMintNoBurnNoPause token = factoryOwnedUnlimitCanMintNoBurnNoPause.create(name,symbol,initialSupply,owner,decimals);
                        ownerToTokenTable[owner] = address(token);
                        return address(token);
    }

    function CreateOwnedUnlimitCanMintCanBurnNoPause(string memory name, string memory symbol, uint256 initialSupply, address owner, uint8 decimals) public returns(address) {
                        
                        OwnedUnlimitCanMintCanBurnNoPause token = factoryOwnedUnlimitCanMintCanBurnNoPause.create(name,symbol,initialSupply,owner,decimals);
                        ownerToTokenTable[owner] = address(token);
                        return address(token);
    }

    function CreateOwnedCappedCanMintCanBurnCanPause(string memory name, string memory symbol, uint256 initialSupply, address owner, uint8 decimals, uint256 _cap) public returns(address) {
                        
                        OwnedCappedCanMintCanBurnCanPause token = factoryOwnedCappedCanMintCanBurnCanPause.create(name,symbol,initialSupply,owner,decimals,_cap);
                        ownerToTokenTable[owner] = address(token);
                        return address(token);
    }

    function CreateOwnedCappedCanMintNoBurnCanPause(string memory name, string memory symbol, uint256 initialSupply, address owner, uint8 decimals, uint256 _cap) public returns(address) {
                        
                        OwnedCappedCanMintNoBurnCanPause token = factoryOwnedCappedCanMintNoBurnCanPause.create(name,symbol,initialSupply,owner,decimals,_cap);
                        ownerToTokenTable[owner] = address(token);
                        return address(token);
    }

    function CreateOwnedCappedCanMintCanBurnNoPause(string memory name, string memory symbol, uint256 initialSupply, address owner, uint8 decimals, uint256 _cap) public returns(address) {
                        
                        OwnedCappedCanMintCanBurnNoPause token = factoryOwnedCappedCanMintCanBurnNoPause.create(name,symbol,initialSupply,owner,decimals,_cap);
                        ownerToTokenTable[owner] = address(token);
                        return address(token);
    }

    function CreateOwnedCappedCanMintNoBurnNoPause(string memory name, string memory symbol, uint256 initialSupply, address owner, uint8 decimals, uint256 _cap) public returns(address) {
                        
                        OwnedCappedCanMintNoBurnNoPause token = factoryOwnedCappedCanMintNoBurnNoPause.create(name,symbol,initialSupply,owner,decimals,_cap);
                        ownerToTokenTable[owner] = address(token);
                        return address(token);
    }












    function CreateRoleFixedNoMintNoBurnNoPause(string memory name, string memory symbol, uint256 initialSupply, address owner, uint8 decimals) public returns(address) {
                        
                        RoleFixedNoMintNoBurnNoPause token = factoryRoleFixedNoMintNoBurnNoPause.create(name,symbol,initialSupply,owner,decimals);
                        ownerToTokenTable[owner] = address(token);
                        return address(token);
    }

    function CreateRoleFixedNoMintNoBurnCanPause(string memory name, string memory symbol, uint256 initialSupply, address owner, uint8 decimals) public returns(address) {
                        
                        RoleFixedNoMintNoBurnCanPause token = factoryRoleFixedNoMintNoBurnCanPause.create(name,symbol,initialSupply,owner,decimals);
                        ownerToTokenTable[owner] = address(token);
                        return address(token);
    }

    function CreateRoleFixedNoMintCanBurnCanPause(string memory name, string memory symbol, uint256 initialSupply, address owner, uint8 decimals) public returns(address) {
                        
                        RoleFixedNoMintCanBurnCanPause token = factoryRoleFixedNoMintCanBurnCanPause.create(name,symbol,initialSupply,owner,decimals);
                        ownerToTokenTable[owner] = address(token);
                        return address(token);
    }

    function CreateRoleFixedNoMintCanBurnNoPause(string memory name, string memory symbol, uint256 initialSupply, address owner, uint8 decimals) public returns(address) {
                        
                        RoleFixedNoMintCanBurnNoPause token = factoryRoleFixedNoMintCanBurnNoPause.create(name,symbol,initialSupply,owner,decimals);
                        ownerToTokenTable[owner] = address(token);
                        return address(token);
    }

    function CreateRoleUnlimitCanMintCanBurnCanPause(string memory name, string memory symbol, uint256 initialSupply, address owner, uint8 decimals) public returns(address) {
                        
                        RoleUnlimitCanMintCanBurnCanPause token = factoryRoleUnlimitCanMintCanBurnCanPause.create(name,symbol,initialSupply,owner,decimals);
                        ownerToTokenTable[owner] = address(token);
                        return address(token);
    }

    function CreateRoleUnlimitCanMintNoBurnCanPause(string memory name, string memory symbol, uint256 initialSupply, address owner, uint8 decimals) public returns(address) {
                        
                        RoleUnlimitCanMintNoBurnCanPause token = factoryRoleUnlimitCanMintNoBurnCanPause.create(name,symbol,initialSupply,owner,decimals);
                        ownerToTokenTable[owner] = address(token);
                        return address(token);
    }

    function CreateRoleUnlimitCanMintNoBurnNoPause(string memory name, string memory symbol, uint256 initialSupply, address owner, uint8 decimals) public returns(address) {
                        
                        RoleUnlimitCanMintNoBurnNoPause token = factoryRoleUnlimitCanMintNoBurnNoPause.create(name,symbol,initialSupply,owner,decimals);
                        ownerToTokenTable[owner] = address(token);
                        return address(token);
    }

    function CreateRoleUnlimitCanMintCanBurnNoPause(string memory name, string memory symbol, uint256 initialSupply, address owner, uint8 decimals) public returns(address) {
                        
                        RoleUnlimitCanMintCanBurnNoPause token = factoryRoleUnlimitCanMintCanBurnNoPause.create(name,symbol,initialSupply,owner,decimals);
                        ownerToTokenTable[owner] = address(token);
                        return address(token);
    }

    function CreateRoleCappedCanMintCanBurnCanPause(string memory name, string memory symbol, uint256 initialSupply, address owner, uint8 decimals, uint256 _cap) public returns(address) {
                        
                        RoleCappedCanMintCanBurnCanPause token = factoryRoleCappedCanMintCanBurnCanPause.create(name,symbol,initialSupply,owner,decimals,_cap);
                        ownerToTokenTable[owner] = address(token);
                        return address(token);
    }

    function CreateRoleCappedCanMintNoBurnCanPause(string memory name, string memory symbol, uint256 initialSupply, address owner, uint8 decimals, uint256 _cap) public returns(address) {
                        
                        RoleCappedCanMintNoBurnCanPause token = factoryRoleCappedCanMintNoBurnCanPause.create(name,symbol,initialSupply,owner,decimals,_cap);
                        ownerToTokenTable[owner] = address(token);
                        return address(token);
    }

    function CreateRoleCappedCanMintCanBurnNoPause(string memory name, string memory symbol, uint256 initialSupply, address owner, uint8 decimals, uint256 _cap) public returns(address) {
                        
                        RoleCappedCanMintCanBurnNoPause token = factoryRoleCappedCanMintCanBurnNoPause.create(name,symbol,initialSupply,owner,decimals,_cap);
                        ownerToTokenTable[owner] = address(token);
                        return address(token);
    }

    function CreateRoleCappedCanMintNoBurnNoPause(string memory name, string memory symbol, uint256 initialSupply, address owner, uint8 decimals, uint256 _cap) public returns(address) {
                        
                        RoleCappedCanMintNoBurnNoPause token = factoryRoleCappedCanMintNoBurnNoPause.create(name,symbol,initialSupply,owner,decimals,_cap);
                        ownerToTokenTable[owner] = address(token);
                        return address(token);
    }

    
                                                       
                        

}