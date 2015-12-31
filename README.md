# iOS-Password-Entropy
It’s a basic implementation of the Password Entropy, that allows to evaluate how much secure and strong is a password evaluating also an hypothetical hacking attack.

#What is the password entropy?

Password entropy predicts how difficult a given password would be to crack through guessing, brute force cracking, dictionary attacks or other common methods.
<br/>
Password entropy is based on the  pool of characters used  (lowercase, uppercase, numbers as well as symbols) as well as password length. 

<h5>Pool of characters example</h5>

Type                      | Pool of characters possible 
--------------------------|-------------------------------------------------------------------------------------
Lowercase                 | 26            
Uppercase                 | 26     
Numbers                   | 10
Symbols                   | 32     

Password entropy is usually expressed in terms of bits and is calculated by using the formula 

<b>H=L*log2(N)</b> 

where
<br/>
<b>L</b> is the password length
<br/>
<b>N</b> is the pool of characters used

For instance a password that only use lowercase characters (as mypassword) would be represented as log2(26) ≈ 4.7 bits of entropy per character.
<br/>
See below some example:

Type                       | Password      | Pool of characters used | Entropy per char     | Entropy
---------------------------|---------------|-------------------------|----------------------|------------------
Lowercase                  | mypassword    | 26                      | log2(26) ~ 4.7 bits  | 10*4.7 ~ 47 bits
Lower & Upper Case         | Mypassword    | 26 + 26                 | log2(52) ~ 5.7 bits  | 10*5.7 ~ 57 bits
Alphanumeric               | mypassword1   | 26 + 10                 | log2(36) ~ 5.17 bits | 11*5.17 ~ 57 bits
Alphanumeric & Upper Case  | Mypassword    | 26 + 26 + 10            | log2(62) ~ 5.95 bits | 11*5.95 ~ 65.5 bits

Approximately we can assume that a password with entropy:

< 28 bits is <b>Very Weak</b>
<br/>
28 - 35 bits is <b>Weak</b>
<br/>
36 - 59 bits is <b>Reasonable</b>
<br/>
60 - 127 bits is <b>Strong</b>
<br/>
128+ bits is <b>Very Strong</b>
<br/>

For a given password, we can also calculate:
<br/>
a) the <b>Search Space Size</b> that represents the number of all possible passwords with the pool of characters used, given as:
<br/>
S = N^L + N^L-1 + N^L-2...+ N
<br/>
where
<br/>
<b>L</b> is the password length
<br/>
<b>N</b> is the pool of characters used
<br/>

b) the <b>Time Required to Exhaustively Search the Password's Space</b> (Time to attack the password), given as: 
<br/>
T = S/G
<br/>
where
<br/>
<b>S</b> is the search space size
<br/>
<b>G</b> is the guesses per second
<br/>
<br/>
For instance, for the given password "myp", assuming one thousand guesses per second we will have:
<br/>
S = 26^3+26^2+26=18278
<br/>
T = 18278/1000 ~ 18 seconds (time to attack the password))
<br/>
<b>Useful links:</b>
<br/>
http://csrc.nist.gov/publications/nistpubs/800-63/SP800-63V1_0_2.pdf
<br/>
https://en.wikipedia.org/wiki/Password_strength#Entropy_as_a_measure_of_password_strength
<br/>
https://ritcyberselfdefense.wordpress.com/2011/09/24/how-to-calculate-password-entropy/
<br/>

#How to use

To evaluate the password entropry, in order you have:
- to create an instance of the class L3SDKPasswordEntropy 
- to setup the pool of characters through the charactersPool array property
- to call the method analyzePassword passing the password that you want to analyze.

Note that into this project you can find the <b>L3SDKDefaultCharacterPools</b> class that defines a basic pool of characters used with the password entropy calculation.
<br/>
You can customize this class by adding other pool of charactes.
<br/>
Here as example a code snippet:

```objectivec
 //L3SDKPasswordEntropy instance used for the entropy calcuation
  let passwordEntropy:L3SDKPasswordEntropy=L3SDKPasswordEntropy();

 //init the L3SDKPasswordEntropy instance and sets the char set
  passwordEntropy.charactersPool=L3SDKDefaultCharacterPools();
  
  //analyze the password
  passwordEntropy.analyzePassword("mypassword");

```


<h5>methods</h5>
  name                    |     type        |   description    
--------------------------| ----------------|-------------------------------------------------------------------
analyzePassword        		| void            | use this method to analyze your password


<h5>properties</h5>
  name                      |     type        |   description    
----------------------------| ----------------|-------------------------------------------------------------------
passwordCharactersPoolUsed  | string array    | gets the pool of characters used over the password
searchSpaceSize             | Double          | gets the number of all possible passwords for the size of the pool of character (passwordCharacterSetSize)
passwordLength              | Int             | gets the password length
passwordCharacterSetSize    | Int             | gets the size of the pool of character used with the password
bitsOfEntropy               | Double          | gets the password entropry
bitsOfEntropyPerChar        | Double          | gets the entropry per char
charactersPool              | NSArray         | gets/sets the current pool of characters used to calculate the entropy


<br/>
![ScreenShot](https://raw.github.com/alchimya/iOS-Password-Entropy/master/screenshots/iOS-Password-Entropy.gif)
