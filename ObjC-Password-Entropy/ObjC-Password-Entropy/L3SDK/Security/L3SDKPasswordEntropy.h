//
//  L3SDKPasswordEntropy.h
//  ObjC-Password-Entropy
//
//  Created by Domenico Vacchiano on 31/12/15.
//  Copyright © 2015 DomenicoVacchiano. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface L3SDKPasswordEntropy : NSObject
//gets the pool of characters used over the password
@property (nonatomic,strong,readonly)NSMutableArray*passwordCharactersPoolUsed;
//gets the number of all possible passwords for the passwordCharacterSetSize
@property (nonatomic,assign,readonly)double searchSpaceSize;
//gets the password length
@property (nonatomic,assign,readonly)int passwordLength;
//gets the size of the pool of character used with the password
@property (nonatomic,assign,readonly)int passwordCharactersPoolSize;
//gets the password entropry
@property (nonatomic,assign,readonly)double bitsOfEntropy;
//gets the entropry per char
@property (nonatomic,assign,readonly)double bitsOfEntropyPerChar;
//gets/sets the current pool of characters used to calculate the entropy
@property (nonatomic,strong) NSArray*charactersPool;

-(void) analyzePassword:(NSString*)password;

@end
