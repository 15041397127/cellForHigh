//
//  RequestData.m
//  cellForHigh
//
//  Created by zhang xu on 15/11/27.
//  Copyright © 2015年 zhang xu. All rights reserved.
//

#import "RequestData.h"
#import "UrlMode.h"
#define keyUrl @"http://api.3g.ifeng.com/ipadtestdoc?imgwidth=460&aid=89374195"
@implementation RequestData

+ (void)requestDate:(NSString *)url block:(void (^)(id))Block{
    
    RequestData *request=[[RequestData alloc]init];
    
    [request fetchDataWithUrl:url bloc:^(id data) {
        Block(data);
    }];
    
    
}


-(void)fetchDataWithUrl:(NSString *)url bloc:(void(^)(id data))block{
  
    NSMutableArray *array=[NSMutableArray array];
    
    
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
      NSURLSessionDataTask *dataTask=[[NSURLSession sharedSession]dataTaskWithURL:[NSURL URLWithString:keyUrl] completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
         
          self.dic=[NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
          NSArray *arr=[[self.dic valueForKey:@"body"]valueForKey:@"slides"];
          for (NSDictionary *dict in arr) {
              UrlMode *model=[[UrlMode alloc]init];
              [model setValuesForKeysWithDictionary:dict];
              
              [array addObject:model];
          }
          dispatch_async(dispatch_get_main_queue(), ^{
              block(self.dic);
          });
          
          
      }];
        
        [dataTask resume];
        

            });
    
    
    
    
}


@end
