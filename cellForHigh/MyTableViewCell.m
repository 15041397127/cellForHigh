//
//  MyTableViewCell.m
//  cellForHigh
//
//  Created by zhang xu on 15/11/27.
//  Copyright © 2015年 zhang xu. All rights reserved.
//

#import "MyTableViewCell.h"
#import "UIImageView+WebCache.h"
#define KWith [UIScreen mainScreen].bounds.size.width
@implementation MyTableViewCell
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self=[super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self addViews];
    }
    return self;
}

-(void)addViews{
    self.picImage=[[UIImageView alloc]initWithFrame:CGRectMake(0, 0, KWith ,30)];
//    self.picImage.backgroundColor=[UIColor redColor];
    [self addSubview:self.picImage];
    
    self.descriptionLabel=[[UILabel alloc]init];
    self.descriptionLabel.frame=CGRectMake(0, CGRectGetMaxY(self.picImage.frame), KWith,20);
    self.descriptionLabel.numberOfLines=0;
//    self.descriptionLabel.backgroundColor=[UIColor cyanColor];
    self.descriptionLabel.font=[UIFont systemFontOfSize:18];
    [self addSubview:self.descriptionLabel];

}

-(void)congrigeCellWithImage:(NSString *)image label:(NSString *)hight{
    
      //image
    
    NSURL *url = [NSURL URLWithString:image];
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
    NSData *imageData = [NSURLConnection sendSynchronousRequest:request returningResponse:nil error:nil];
    
    UIImage *imageRequest = [UIImage imageWithData:imageData];
    
    self.picImage.image = imageRequest;
    
//    self.picImage 
    self.descriptionLabel.text=hight;
    
    CGFloat imageNewHight =[self hightForImage:imageRequest];
    CGFloat labelNewHight =[self hightForLabel:hight];
    
    self.picImage.frame=CGRectMake(0, 0, KWith ,imageNewHight);
    self.descriptionLabel.frame=CGRectMake(0, CGRectGetMaxY(self.picImage.frame), KWith,labelNewHight);
    
    
}

#pragma mark 计算label高度
- (CGFloat)hightForLabel:(NSString *)height{
    CGSize size=CGSizeMake(KWith, 100000);
    NSDictionary *dic=@{NSFontAttributeName:[UIFont systemFontOfSize:18]};
    
    CGRect rect=[height boundingRectWithSize:size options:NSStringDrawingUsesLineFragmentOrigin attributes:dic context:nil];
    
    
    
    return rect.size.height;
}

#pragma mark 计算图片高度

-(CGFloat)hightForImage:(UIImage *)image{
    CGFloat  newHight =image.size.height / image.size.width *KWith;
    
    return newHight;
    
    
}






- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
