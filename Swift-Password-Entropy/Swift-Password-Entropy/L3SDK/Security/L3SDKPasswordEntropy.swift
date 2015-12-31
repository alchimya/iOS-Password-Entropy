//
//  L3SDKPasswordEntropy.swift
//  Swift-Password-Entropy
//
//  Created by Domenico Vacchiano on 31/12/15.
//  Copyright © 2015 DomenicoVacchiano. All rights reserved.
//

import UIKit

class L3SDKPasswordEntropy: NSObject {
    
    //readonly properties
    
    //gets the pool of characters used over the password
    private var _passwordCharactersPoolUsed=[String]();
    var passwordCharactersPoolUsed:[String]{
        get{
            return _passwordCharactersPoolUsed;
        }
    }
    
    //gets the number of all possible passwords for the passwordCharacterSetSize
    private var _searchSpaceSize:Double=0;
    var searchSpaceSize:Double {
        get{
            return _searchSpaceSize;
        }
    }
    
    //gets the password length
    private var _passwordLength:Int=0;
    var passwordLength:Int {
        get{
            return _passwordLength;
        }
    }
    
    //gets the size of the pool of character used with the password
    private var _passwordCharactersPoolSize:Int=0;
    var passwordCharactersPoolSize:Int {
        get{
            return _passwordCharactersPoolSize;
        }
    }
    
    //gets the password entropry
    private var _bitsOfEntropy:Double=0;
    var bitsOfEntropy:Double{
        get{
            return _bitsOfEntropy;
        }
    }
    
    //gets the entropry per char
    private var _bitsOfEntropyPerChar:Double=0;
    var bitsOfEntropyPerChar:Double{
        get{
            return _bitsOfEntropyPerChar;
        }
    }
    
    //gets/sets the current pool of characters used to calculate the entropy
    var charactersPool=[];
    
    func analyzePassword (password:String){
        
        //init all properties
        _searchSpaceSize=0;
        _passwordLength=0;
        _passwordCharactersPoolSize=0;
        _passwordCharactersPoolUsed=Array();
        _bitsOfEntropyPerChar=0;
        _bitsOfEntropy=0
        
        if password.isEmpty{
            return;
        }
        
        //loop throughout the char set and check all the
        //char set used over the password
        for  charSet in self.charactersPool{
            if let _=password.rangeOfCharacterFromSet(NSCharacterSet(charactersInString: charSet as! String)){
                _passwordCharactersPoolSize+=charSet.length;
                _passwordCharactersPoolUsed.append(charSet as! String);
            }
        }
        
        //password entropy calculation
        //password entropy formula
        //H=L*(ln(N)/ln(2))
        //where:
        //H= password entropy
        //L= password length
        //N=charset size
        _passwordLength = password.characters.count;
        _bitsOfEntropyPerChar = log2(Double(_passwordCharactersPoolSize));
        _bitsOfEntropy = Double(_passwordLength) * _bitsOfEntropyPerChar;
        
        //seta the search space size
        setSearchSpaceSize();
        
        
        
    }
    private func setSearchSpaceSize(){
        
        //Exact Search Space Size: given from N^L + N^L-1 + N^L-2...+ N.
        //We will have  a set of N^L passwords of L chars to N passwords of one char
        //Where:
        //N = character set
        //L = password lenght
        //For instance:
        // - password: myP
        // - N:26+26=52
        // - L:3
        //C=52^3+52^2+52^1=143364
        
        for var i=1;i<=_passwordLength;++i{
            _searchSpaceSize = _searchSpaceSize + Double(pow(Double(_passwordCharactersPoolSize),Double(i)));
        }
        
    }
    
}
