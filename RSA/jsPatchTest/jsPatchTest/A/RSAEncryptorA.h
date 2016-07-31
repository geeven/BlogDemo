#import <Foundation/Foundation.h>

@interface RSAEncryptorA : NSObject


#pragma mark - Instance Methods

-(void) loadPublicKeyFromFile: (NSString*) derFilePath;
-(void) loadPublicKeyFromData: (NSData*) derData;

-(void) loadPrivateKeyFromFile: (NSString*) p12FilePath password:(NSString*)p12Password;
-(void) loadPrivateKeyFromData: (NSData*) p12Data password:(NSString*)p12Password;



//利用私钥加密
-(NSString*) rsaEncryptString:(NSString*)string;
-(NSData*) rsaEncryptData:(NSData*)data ;

//利用公钥解密
-(NSString*) rsaDecryptString:(NSString*)string;
-(NSData*) rsaDecryptData:(NSData*)data;

-(BOOL) rsaSHA1VerifyData:(NSData *) plainData
            withSignature:(NSData *) signature;



#pragma mark - Class Methods

+(void) setSharedInstance: (RSAEncryptorA*)instance;
+(RSAEncryptorA*) sharedInstance;

@end