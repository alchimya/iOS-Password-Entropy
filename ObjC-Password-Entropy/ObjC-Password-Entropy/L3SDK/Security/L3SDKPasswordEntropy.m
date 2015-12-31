//
//  L3SDKPasswordEntropy.m
//  ObjC-Password-Entropy
//
//  Created by Domenico Vacchiano on 31/12/15.
//  Copyright © 2015 DomenicoVacchiano. All rights reserved.
//

#import "L3SDKPasswordEntropy.h"

@interface L3SDKPasswordEntropy ()
-(void)setSearchSpaceSize;
@end


@implementation L3SDKPasswordEntropy

@synthesize passwordCharactersPoolUsed;
@synthesize searchSpaceSize;
@synthesize passwordLength;
@synthesize passwordCharactersPoolSize;
@synthesize bitsOfEntropy;
@synthesize bitsOfEntropyPerChar;
@synthesize charactersPool;

-(void) analyzePassword:(NSString*)password{
    
    //init all properties
    searchSpaceSize=0;
    passwordLength=0;
    passwordCharactersPoolSize=0;
    passwordCharactersPoolUsed=[[NSMutableArray alloc]initWithCapacity:5];
    bitsOfEntropyPerChar=0;
    bitsOfEntropy=0;
    
    
    if (!password || [password isEqualToString:@""]) {
        return;
    }
    
    //loop throughout the char set and check all the
    //char set used over the password
    for (NSString*charSet in self.charactersPool) {
        NSRange range=[password rangeOfCharacterFromSet:[NSCharacterSet characterSetWithCharactersInString:charSet]];
        if (range.length) {
            passwordCharactersPoolSize+=charSet.length;
            [passwordCharactersPoolUsed addObject:charSet];
        }
    }
    
    //password entropy calculation
    //password entropy formula
    //H=L*(ln(N)/ln(2))
    //where:
    //H= password entropy
    //L= password length
    //N=charset size
    passwordLength = [password length];
    bitsOfEntropyPerChar = log2(passwordCharactersPoolSize);
    bitsOfEntropy = passwordLength * bitsOfEntropyPerChar;
    
    //seta the search space size
    [self setSearchSpaceSize];
    
}

-(void)setSearchSpaceSize{
    
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
    
    for (int i=1; i<=passwordLength; i++) {
        searchSpaceSize = searchSpaceSize + (double)pow(passwordCharactersPoolSize,i);
    }
    
}

@end

