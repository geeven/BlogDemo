#import <Foundation/Foundation.h>

/******字符串转base64（包括DES加密）******/
#define __BASE64( text )        [Base64codeFunc base64StringFromText:text]

/******base64（通过DES解密）转字符串******/
#define __TEXT( base64 )        [Base64codeFunc textFromBase64String:base64]

@interface Base64codeFunc : NSObject

/************************************************************
 函数名称 : + (NSString *)base64StringFromText:(NSString *)text
 函数描述 : 将文本转换为base64格式字符串
 输入参数 : (NSString *)text    文本
 输出参数 : N/A
 返回参数 : (NSString *)    base64格式字符串
 备注信息 :
 **********************************************************/
+ (NSString *)base64StringFromText:(NSString *)text;

/**
 *  DES+BASE64 加密后字符串
 *
 *  @param text 原始字符串
 *  @param key  DES加密key
 *
 *  @return 先经过DES加密后再base64加密得最终字符串
 */
+ (NSString *)base64StringFromText:(NSString *)text WithDESKey:(NSString*)key;

/************************************************************
 函数名称 : + (NSString *)textFromBase64String:(NSString *)base64
 函数描述 : 将base64格式字符串转换为文本
 输入参数 : (NSString *)base64  base64格式字符串
 输出参数 : N/A
 返回参数 : (NSString *)    文本
 备注信息 :
 **********************************************************/
+ (NSString *)textFromBase64String:(NSString *)base64;

/**
 *  DES+BASE64 解密后字符串
 *
 *  @param base64 加密后的字符串
 *  @param key    DES解密key
 *
 *  @return 原始数据
 */
+ (NSString *)textFromBase64String:(NSString *)base64 WithDESKey:(NSString*)key;

@end