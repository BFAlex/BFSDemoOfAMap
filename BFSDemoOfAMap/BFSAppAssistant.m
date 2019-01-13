//
//  BFSAppAssistant.m
//  BFSDemoOfAMap
//
//  Created by Alex BF on 2019/1/13.
//  Copyright © 2019年 Alex BF. All rights reserved.
//

#import "BFSAppAssistant.h"
#import <AMapFoundationKit/AMapFoundationKit.h>
#import <AMapNaviKit/AMapNaviKit.h>

#define kAMapKey @"a301514f69b1ecd191dd2f516b9f3b61"

@interface BFSAppAssistant ()

@end

@implementation BFSAppAssistant

static BFSAppAssistant *assistant;
static dispatch_once_t onceToken;

#pragma mark -

+ (instancetype)sharedAssistant {
    
    dispatch_once(&onceToken, ^{
        assistant = [[BFSAppAssistant alloc] init];
    });
    
    return assistant;
}

+ (void)destoryAssistant {
    
    if (assistant) {
        assistant = nil;
        onceToken = 0;
    }
}

#pragma mark - AMap

- (void)registerAMap {
    
    [AMapServices sharedServices].apiKey = kAMapKey;
    [[AMapServices sharedServices] setEnableHTTPS:YES];
}

@end
