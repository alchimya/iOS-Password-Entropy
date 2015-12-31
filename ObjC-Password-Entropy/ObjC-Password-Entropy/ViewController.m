//
//  ViewController.m
//  ObjC-Password-Entropy
//
//  Created by Domenico Vacchiano on 31/12/15.
//  Copyright © 2015 DomenicoVacchiano. All rights reserved.
//

#import "ViewController.h"
#import "L3SDKDefaultCharacterPools.h"
#import "L3SDKPasswordEntropy.h"


@interface ViewController ()

@property (weak, nonatomic) IBOutlet UILabel *characterSetSizeLabel;
@property (weak, nonatomic) IBOutlet UILabel *charEntropylabel;
@property (weak, nonatomic) IBOutlet UILabel *passwordEntropyLabel;
@property (weak, nonatomic) IBOutlet UILabel *searchSpaceSizeLabel;
@property (weak, nonatomic) IBOutlet UILabel *onlineAttackLabel;
@property (weak, nonatomic) IBOutlet UILabel *offlineFastAttackLabel;
@property (weak, nonatomic) IBOutlet UILabel *massiveCrackingArray;
@property (nonatomic,strong)L3SDKPasswordEntropy*passwordEntropy;
-(IBAction)onPasswordchanged:(id)sender;

@end

@implementation ViewController


-(void)onPasswordchanged:(id)sender{
    
    UITextField*txt=(UITextField*)sender;
    
    //analyze the password
    [self.passwordEntropy analyzePassword:txt.text];
    
    //shows the password entropy
    self.passwordEntropyLabel.text =[NSString stringWithFormat:@"%.2f bits", self.passwordEntropy.bitsOfEntropy];
    //shows the entropy per char
    self.self.charEntropylabel.text =[NSString stringWithFormat:@"%.2f bits", self.passwordEntropy.bitsOfEntropyPerChar];
    //shows the pool of characters size
    self.characterSetSizeLabel.text=@"";
    for (NSString*charSet in self.passwordEntropy.passwordCharactersPoolUsed) {
        self.characterSetSizeLabel.text = [NSString stringWithFormat:@"%@%lu +", self.characterSetSizeLabel.text , (unsigned long)charSet.length];
    }
    
    if (![self.characterSetSizeLabel.text isEqualToString:@""]) {
        self.characterSetSizeLabel.text=[NSString stringWithFormat:@"%@ = %d",
                                         [self.characterSetSizeLabel.text substringToIndex:self.characterSetSizeLabel.text.length-1],
                                         self.passwordEntropy.passwordCharactersPoolSize];
    }
    
    //count of all possible passwords with this alphabet size and up to this password's length
    self.searchSpaceSizeLabel.text=[NSString stringWithFormat:@"%g", self.passwordEntropy.searchSpaceSize];
    
    //attack scenario
    self.onlineAttackLabel.text=[NSString stringWithFormat:@"%g seconds", self.passwordEntropy.searchSpaceSize/1000];
    self.offlineFastAttackLabel.text=[NSString stringWithFormat:@"%g seconds", self.passwordEntropy.searchSpaceSize/100000000000];
    self.massiveCrackingArray.text=[NSString stringWithFormat:@"%g seconds", self.passwordEntropy.searchSpaceSize/100000000000000];
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //init the L3SDKPasswordEntropy instance and sets the pool of characters
    //with this property you can customize the char set that you want
    // to use with the password entropy calculation
    self.passwordEntropy=[[L3SDKPasswordEntropy alloc]init];
    self.passwordEntropy.charactersPool=[[L3SDKDefaultCharacterPools alloc]init];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
