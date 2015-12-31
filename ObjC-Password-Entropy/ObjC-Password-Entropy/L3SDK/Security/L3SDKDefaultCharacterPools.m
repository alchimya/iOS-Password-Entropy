//
//  L3SDKDefaultCharacterPools.m
//  ObjC-Password-Entropy
//
//  Created by Domenico Vacchiano on 31/12/15.
//  Copyright © 2015 DomenicoVacchiano. All rights reserved.
//

#import "L3SDKDefaultCharacterPools.h"

@interface L3SDKDefaultCharacterPools ()
@property (nonatomic,strong)NSArray*defaultCharacterSet;
@end

//it represents the standard pool of characters used to evaluate the password entropy
@implementation L3SDKDefaultCharacterPools

-(instancetype) init{
    
    self=[super init];
    
    if (self) {
        self.defaultCharacterSet=[[NSArray alloc]initWithObjects:
                                  //lowercase letters
                                  @"abcdefghijklmnopqrstuvwxyz",
                                  //uppercase letters
                                  @"ABCDEFGHIJKLMNOPQRSTUVWXYZ",
                                  //numbers
                                  @"0123456789",
                                  //symbols above numbers
                                  @"!@#$%^&*()",
                                  //other symbols
                                  @"`~-_=+[{]}\\|;:'\",<.>/?",
                                  //space
                                  @" ",
                                  nil];
    }
    return self;
}



-(NSUInteger) count {
    return [self.defaultCharacterSet count];
}
-(id)objectAtIndex:(NSUInteger)index{
    NSAssert(index < self.count, @"The index is out of bounds");
    return [self.defaultCharacterSet objectAtIndex:index];
}
@end

