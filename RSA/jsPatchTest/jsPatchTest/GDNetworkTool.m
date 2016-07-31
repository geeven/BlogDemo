//
//  GDNetworkTool.m
//  jsPatchTest
//
//  Created by Geeven on 16/7/4.
//  Copyright © 2016年 Hi-WiFi. All rights reserved.
//

#import "GDNetworkTool.h"



@implementation GDNetworkTool

+ (instancetype)shareTools {
    
    static id instance;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [[self alloc] init];
    });
    return instance;
}


@end
