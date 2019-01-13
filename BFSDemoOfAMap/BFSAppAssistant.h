//
//  BFSAppAssistant.h
//  BFSDemoOfAMap
//
//  Created by Alex BF on 2019/1/13.
//  Copyright © 2019年 Alex BF. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BFSAppAssistant : NSObject

+ (instancetype)sharedAssistant;
+ (void)destoryAssistant;

#pragma mark - AMap
- (void)registerAMap;

@end
