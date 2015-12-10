//
//  RequestData.h
//  cellForHigh
//
//  Created by zhang xu on 15/11/27.
//  Copyright © 2015年 zhang xu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface RequestData : NSObject

@property(nonatomic ,strong)NSDictionary *dic;
+(void)requestDate:(NSString *)url block:(void(^)(id data))Block;



@end
