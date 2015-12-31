//
//  ViewController.swift
//  Swift-Password-Entropy
//
//  Created by Domenico Vacchiano on 31/12/15.
//  Copyright © 2015 DomenicoVacchiano. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    //IBOulet labels
    @IBOutlet weak var characterSetSizeLabel: UILabel!;
    @IBOutlet weak var passwordEntropyLabel: UILabel!;
    @IBOutlet weak var charEntropylabel: UILabel!
    @IBOutlet weak var searchSpaceSizeLabel: UILabel!
    
    @IBOutlet weak var onlineAttackLabel: UILabel!
    @IBOutlet weak var offlineFastAttackLabel: UILabel!
    @IBOutlet weak var massiveCrackingArray: UILabel!
    
    //L3SDKPasswordEntropy instance used for the entropy calcuation
    let passwordEntropy:L3SDKPasswordEntropy=L3SDKPasswordEntropy();
    
    
    @IBAction func onPasswordchanged(sender: AnyObject) {
        let txt:UITextField=sender as! UITextField;
        
        //analyze the password
        passwordEntropy.analyzePassword(txt.text!);
        
        //shows the password entropy
        self.passwordEntropyLabel.text = String(format: "%.2f bits", passwordEntropy.bitsOfEntropy);
        //shows the entropy per char
        self.charEntropylabel.text=String(format: "%.2f bits", passwordEntropy.bitsOfEntropyPerChar);
        
        //shows the pool of characters size
        self.characterSetSizeLabel.text="";
        for charSet   in passwordEntropy.passwordCharactersPoolUsed{
            self.characterSetSizeLabel.text = self.characterSetSizeLabel.text!  + "\(charSet.characters.count) +";
        }
        
        if self.characterSetSizeLabel.text?.characters.count>0 {
            self.characterSetSizeLabel.text =  "\(self.characterSetSizeLabel.text!.substringToIndex(self.characterSetSizeLabel.text!.endIndex.advancedBy(-1)))=\(passwordEntropy.passwordCharactersPoolSize)" ;
        }
        
        
        //count of all possible passwords with this alphabet size and up to this password's length
        self.searchSpaceSizeLabel.text=String(format: "%g", passwordEntropy.searchSpaceSize);
        
        //attack scenario
        self.onlineAttackLabel.text=String(format: "%g seconds", passwordEntropy.searchSpaceSize/1000);
        self.offlineFastAttackLabel.text=String(format: "%g seconds", passwordEntropy.searchSpaceSize/100000000000);
        self.massiveCrackingArray.text=String(format: "%g seconds", passwordEntropy.searchSpaceSize/100000000000000);
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
        //Sets the pool of characters.
        //with this property you can customize the char set that you want
        // to use with the password entropy calculation
        passwordEntropy.charactersPool=L3SDKDefaultCharacterPools();
        
        
    }
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func factorial(n: Float) -> Float{
        var i=n;
        return tgammaf(Float(++i));
    }
}


