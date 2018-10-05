//
//  AboutViewController.m
//  cc
//
//  Created by mac on 2018/9/27.
//  Copyright © 2018年 zz. All rights reserved.
//

#import "AboutViewController.h"

@interface AboutViewController ()

@end

@implementation AboutViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.navigationItem.title = @"关于";
    
    [self setUpUI];
    
}

-(void)setUpUI
{
    UILabel *content = [UILabel lableWithTextColor:[UIColor grayColor] textFont:W(26) text:@"一款可以给我带来最新的驾考题库以及可以和我们达成优质意向或创意合作的app。"];
    content.numberOfLines = 0;
    [content sizeToFit];
    [self.view addSubview:content];
    [content makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view).offset(H(40) + kStatusBarHeight + kNavigationBarHeight);
        make.left.equalTo(self.view).offset(W(20));
        make.right.equalTo(self.view).offset(W(-20));
//        make.bottom.equalTo(self.view);
    }];
}

@end
