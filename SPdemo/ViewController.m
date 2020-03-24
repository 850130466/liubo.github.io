//
//  ViewController.m
//  SPdemo
//
//  Created by liubo on 2020/3/24.
//  Copyright © 2020 刘波. All rights reserved.
//

#import "ViewController.h"
#import "YGColorManager.h"
#define Screen_W   [UIScreen mainScreen].bounds.size.width
#define screen_H   [UIScreen mainScreen].bounds.size.height

@interface ViewController ()
@property(nonatomic,strong)UILabel *titleLab;
@property(nonatomic,strong)UILabel *detailLab;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view setBackgroundColor:[UIColor systemBackgroundColor]];
    self.titleLab=[UILabel new];
    self.detailLab=[UILabel new];
    self.titleLab.frame=CGRectMake(10, 100, [UIScreen mainScreen].bounds.size.width-20, 50);
    
    self.detailLab.frame=CGRectMake(10, 180, [UIScreen mainScreen].bounds.size.width-20, 50);
    self.titleLab.text=@"titleLab";
    self.detailLab.text=@"detailLab";
    
    [self.titleLab setTextColor:[UIColor labelColor]];
    [self.detailLab setTextColor:[UIColor placeholderTextColor]];
    
    [self.view addSubview:self.titleLab];
    [self.view addSubview:self.detailLab];
    
    UIView *firstView=[[UIView alloc]initWithFrame:CGRectMake(10, 250, Screen_W-20, 100)];
    firstView.backgroundColor=[YGColorManager sharedInstance].YGTextWhite;
    [self.view addSubview:firstView];
    
    UIImageView *lg=[[UIImageView alloc]initWithFrame:CGRectMake(10, 360, 100, 100)];
    lg.image=[UIImage imageNamed:@"bg"];
    [self.view addSubview:lg];
    
    
    // Do any additional setup after loading the view.
}


@end
