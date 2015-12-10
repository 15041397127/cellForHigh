//
//  UrlMode.m
//  cellForHigh
//
//  Created by zhang xu on 15/11/27.
//  Copyright © 2015年 zhang xu. All rights reserved.
//

#import "UrlMode.h"

@implementation UrlMode
-(void)setValue:(id)value forUndefinedKey:(NSString *)key{
    
    if ([key isEqualToString:@"description"]) {
        self.descre=value;
    }else{

    }
}
@end
