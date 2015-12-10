//
//  MyTableViewCell.h
//  cellForHigh
//
//  Created by zhang xu on 15/11/27.
//  Copyright © 2015年 zhang xu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MyTableViewCell : UITableViewCell

@property(nonatomic, strong)UIImageView *picImage;
@property(nonatomic, strong)UILabel *descriptionLabel;

-(CGFloat)hightForLabel:(NSString *)height;

-(CGFloat)hightForImage:(UIImage *)image;

-(void)congrigeCellWithImage:(NSString *)image label:(NSString *)hight;

@end
