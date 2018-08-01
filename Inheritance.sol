pragma solidity ^0.4.24;

interface Regulator {
    function checkValue(uint amount) external returns (bool);
    function loan() external returns (bool);
}

contract Bank is Regulator {
    uint private value;
    
    constructor(uint amount) public {
        value = amount;
    }
    
    function deposit(uint amount) public {
        value += amount;
    }
    
    function withdraw(uint amount) public {
        if (checkValue(amount)) {
            value -= amount;
        }
    }
    
    function balance() view public returns (uint) {
        return value;
    }
    
    function checkValue(uint amount) view public returns (bool) {
        // Classic mistake in the tutorial value should be above the amount
        return value >= amount;
    }
    
    function loan() view public returns (bool) {
        return value > 0;
    }
}

contract MyFirstContract is Bank(10) {
    string private nombre;
    uint private edad;
    
    function setName(string _nombre) public{
        nombre = _nombre;
    }
    
    function getName() view public returns (string) {
        return nombre;
    }
    
    function setAge(uint _edad) public {
        edad = _edad;
    }
    
    function getAge() view public returns (uint) {
        return edad;
    }
}