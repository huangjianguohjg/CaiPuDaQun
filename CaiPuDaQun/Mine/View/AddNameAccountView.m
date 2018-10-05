//
//  AddNameAccountView.m
//  lineroad
//
//  Created by gagakj on 2017/8/1.
//  Copyright © 2017年 田宇. All rights reserved.
//

#import "AddNameAccountView.h"

@implementation AddNameAccountView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        //界面初始化
        [self setUpUI];
    }
    return self;
}

-(void)setUpUI
{
    UILabel * nameLable = [UILabel lableWithTextColor:[UIColor blackColor] textFont:15 text:@"姓名"];
    nameLable.textAlignment = NSTextAlignmentLeft;
    [self addSubview:nameLable];
    [nameLable makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self).offset(W(13));
        make.centerY.equalTo(self);
        make.size.equalTo(CGSizeMake(W(75), H(15)));
    }];
    self.nameLable = nameLable;
    
    UITextField * textField = [[UITextField alloc]init];
    textField.placeholder = @"请输入您的姓名";
    textField.font = [UIFont systemFontOfSize:15];
    [self addSubview:textField];
    [textField makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.nameLable.right).offset(W(18));
        make.centerY.equalTo(self);
        make.size.equalTo(CGSizeMake(W(200), H(15)));
    }];
    self.textField = textField;
    
    UIView * lineView = [[UIView alloc]init];
    lineView.alpha = 0.3;
    lineView.backgroundColor = [UIColor lightGrayColor];
    [self addSubview:lineView];
    [lineView makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(self);
        make.left.equalTo(self);
        make.right.equalTo(self);
        make.height.equalTo(H(1));
        
    }];
    
  
}




@end
