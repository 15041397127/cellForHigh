//
//  ViewController.m
//  cellForHigh
//
//  Created by zhang xu on 15/11/27.
//  Copyright © 2015年 zhang xu. All rights reserved.
//

#import "ViewController.h"
#import "MyTableViewCell.h"
#import "RequestData.h"
#import "UrlMode.h"
#define keyUrl @"http://api.3g.ifeng.com/ipadtestdoc?imgwidth=460&aid=89374195"
@interface ViewController ()<UITableViewDataSource,UITableViewDelegate>
@property(nonatomic,strong)MyTableViewCell *cell;
@property(nonatomic,strong)UITableView *myTableView;
@property(nonatomic,strong)NSMutableArray *dataArray;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self addTabelView];
    [self getData];
    // Do any additional setup after loading the view, typically from a nib.
}

-(void)addTabelView{
    self.myTableView.delegate=self;
    self.myTableView.dataSource=self;
    

    [self.view addSubview:self.myTableView];
}


#pragma mark 懒加载 tableView

-(UITableView *)myTableView{
    
    if (!_myTableView) {
        self.myTableView=[[UITableView alloc]initWithFrame:self.view.frame style:UITableViewStylePlain];
        [self.myTableView registerClass:[MyTableViewCell class] forCellReuseIdentifier:@"cell"];
    }
    
    return _myTableView;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return 1;
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    
    return self.dataArray.count;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return [self.cell hightForImage:self.cell.picImage.image]+self.cell.descriptionLabel.frame.size.height;
}

-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 10;
}


-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 10;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    self.cell=[tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    
    NSLog(@"%@",self.dataArray);
    UrlMode *model=self.dataArray[indexPath.section];
    
    
    CGRect rect=self.cell.descriptionLabel.frame;
    rect.size.height=[self.cell hightForLabel:self.cell.descriptionLabel.text];
    self.cell.descriptionLabel.frame=rect;
    self.cell.descriptionLabel.text=model.descre;
    
    
    NSLog(@"%@",model.descre);
    [self.cell congrigeCellWithImage:model.image label:self.cell.descriptionLabel.text];
    
    
    
    return self.cell;
    
    
}


#pragma mark 请求数据
-(void)getData{
    
    __weak typeof(self)weakSelf=self;
    self.dataArray=[NSMutableArray array];
    [RequestData  requestDate: keyUrl block:^(id data) {
//        NSLog(@"%@",data);
        
        NSArray *arr=[[data valueForKey:@"body"]valueForKey:@"slides"];
        
        for (NSDictionary *dic in arr   ) {
            UrlMode *modle=[[UrlMode alloc]init];
            [modle setValuesForKeysWithDictionary:dic];
            
            [weakSelf.dataArray addObject:modle];
        }
        NSLog(@"%@",weakSelf.dataArray); 
        
        [weakSelf.myTableView reloadData];

    }];
 
}





- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
