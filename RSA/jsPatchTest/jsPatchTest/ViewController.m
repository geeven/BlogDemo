//
//  ViewController.m
//  jsPatchTest
//
//  Created by Geeven on 16/7/4.
//  Copyright © 2016年 Hi-WiFi. All rights reserved.
//

#import "ViewController.h"
#import "GDNetworkTool.h"
#import <Security/Security.h>
#import <JSPatch/JPEngine.h>
#import <Base64.h>
#import "RSAEncryptor.h"
#import "Base64codeFunc.h"
//#import "XYRSACryption.h"
#import "RSAEncryptorA.h"

@interface ViewController ()

@property (nonatomic,copy)NSString * keyRsa;


@end
#define Key_desKeyUrlString         @"http://XXX.XXXX.cn/ios/des_key"
#define Key_fetchJspatchUrlString   @"http:/XXX.XXXX.cn/ios/jspatch"
@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSString * tmp = @"HUgPEA@U";
    

//    NSString * privatePath1 = [[NSBundle mainBundle] pathForResource:@"1.plist" ofType:nil];
//    NSLog(@"%@",privatePath1);
    
    RSAEncryptor *rsa = [[RSAEncryptor alloc] init];
    NSString * privatePath = [[NSBundle mainBundle] pathForResource:@"private_key" ofType:@"p12"];
    //NSLog(@"%@",privatePath);
    [rsa loadPrivateKeyFromFile:privatePath password:@"123456"];
    
    
    NSString *publicKeyPath = [[NSBundle mainBundle] pathForResource:@"public_key" ofType:@"der"];
    [rsa loadPublicKeyFromFile:publicKeyPath];
    
    
    NSString * str = [rsa rsaEncryptString:tmp];
    NSLog(@"%@",str);
    
    NSString * oriStr = [rsa rsaDecryptString:str];
    NSLog(@"%@",oriStr);

    
    /*
    [[GDNetworkTool shareTools] GET:Key_desKeyUrlString parameters:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        NSLog(@"%@",responseObject);
        NSDictionary * dic = (NSDictionary*)responseObject;
        NSString * js_patch_key = dic[@"des_key"];
        NSLog(@"%@",js_patch_key);
        NSData * tmpData = [[NSData alloc]initWithBase64EncodedString:js_patch_key options:0];

      
        
        RSAEncryptor *rsa = [[RSAEncryptor alloc] init];
        NSString *publicKeyPath = [[NSBundle mainBundle] pathForResource:@"public_key" ofType:@"der"];
        [rsa loadPublicKeyFromFile:publicKeyPath];
        
        NSData *encryptedData = [rsa rsaDecryptData:tmpData];
        NSString * tmpString = [[NSString alloc]initWithData:encryptedData encoding:NSUTF8StringEncoding];
        NSLog(@"%@",tmpString);
        self.keyRsa = tmpString;
        
        
        //    NSString *encryptedString = [rsa rsaEncryptString:self.jsKey];
        //    NSLog(@"encrypted data: %@", encryptedString);

    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        //
    }];
     
     */

}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    
    if (self.keyRsa) {
        
        [[GDNetworkTool shareTools] GET:Key_fetchJspatchUrlString parameters:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
            
            NSDictionary * dic = (NSDictionary*)responseObject;
            NSString * js_patch_key = dic[@"js_patch"];
            NSLog(@"%@",js_patch_key);
            
            
            NSString * jsString = [Base64codeFunc textFromBase64String:js_patch_key WithDESKey:self.keyRsa];
            NSLog(@"%@",jsString);
            
        } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
            
        }];
    }
    
}

@end
