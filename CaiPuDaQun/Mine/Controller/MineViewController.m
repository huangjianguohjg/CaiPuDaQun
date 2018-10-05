//
//  MineViewController.m
//  cc
//
//  Created by mac on 2018/9/27.
//  Copyright © 2018年 zz. All rights reserved.
//

#import "MineViewController.h"
#import "AddNameAccountView.h"
#import <BADataEntity.h>
@interface MineViewController ()<UITextViewDelegate>

@property (nonatomic, weak) UITextView * textView;
@property (nonatomic, weak) UILabel * placeholderLable;
@property (nonatomic, weak) UIView * separateLine;
/** 姓名 */
@property (nonatomic, weak) AddNameAccountView * nameView;
/** 手机号 */
@property (nonatomic, weak) AddNameAccountView * phoneNumView;
/** 所在城市 */
@property (nonatomic, weak) AddNameAccountView * cityView;
/** 合作意向 */
@property (nonatomic, weak) UITextView * teamworkTextView;

@property (nonatomic, weak) UILabel * teamPlaceholderLable;
/** 下划线 */
@property (nonatomic, weak) UIView * teamSeparateLine;

/** 提交反馈 */
@property (nonatomic, weak) UIButton * commitButton;

@end

@implementation MineViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.navigationItem.title = @"业务合作";
    
    //界面初始化
    [self setUpUI];
    
}

#pragma mark -- 界面初始化
-(void)setUpUI
{
    
    
    
    
    //顶部textView
    UITextView * textView = [[UITextView alloc]init];
    textView.delegate = self;
    
    
    [textView setFont:[UIFont systemFontOfSize:15]];
    [self.view addSubview:textView];
    [textView makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view.top).offset(H(15) + kMarginTopHeight);
        make.left.equalTo(self.view.left).offset(W(22.5));
        make.right.equalTo(self.view.right).offset(W(-22.5));
        make.height.equalTo(H(100));
    }];
    self.textView = textView;
    
    UILabel * placeholderLable = [UILabel lableWithTextColor:[UIColor colorWithHexRGB:0x898989] textFont:15 text:@"合作软件的相关事宜"];
    placeholderLable.numberOfLines = 0;
    [self.textView addSubview:placeholderLable];
    [placeholderLable makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.textView).offset(H(10));
        make.left.equalTo(self.textView);
        make.right.equalTo(self.textView);
        make.height.equalTo(H(15));
    }];
    self.placeholderLable = placeholderLable;
    
    UIView * separateLine = [[UIView alloc]init];
    separateLine.backgroundColor = [UIColor colorWithHexRGB:0xeeeeee];
    [self.view addSubview:separateLine];
    [separateLine makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.textView.bottom);
        make.left.equalTo(self.view);
        make.right.equalTo(self.view);
        make.height.equalTo(H(1));
    }];
    
    //姓名
    AddNameAccountView * nameview = [[AddNameAccountView alloc]init];
    nameview.nameLable.text = @"姓名";
    nameview.textField.placeholder = @"您希望我们怎么称呼您";
    [self.view addSubview: nameview];
    [nameview makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(separateLine.bottom);
        make.left.equalTo(self.view);
        make.right.equalTo(self.view);
        make.height.equalTo(H(40));
    }];
    self.nameView = nameview;
    
    //手机号
    AddNameAccountView * phoneNumView = [[AddNameAccountView alloc]init];
    phoneNumView.nameLable.text = @"手机号";
    phoneNumView.textField.placeholder = @"方便我们联系您";
    [self.view addSubview: phoneNumView];
    [phoneNumView makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.nameView.bottom);
        make.left.equalTo(self.view);
        make.right.equalTo(self.view);
        make.height.equalTo(H(40));
    }];
    self.phoneNumView = phoneNumView;
    
    //所在城市
    AddNameAccountView * cityView = [[AddNameAccountView alloc]init];
    cityView.nameLable.text = @"所在城市";
    cityView.textField.placeholder = @"您的业务所在城市";
    [self.view addSubview: cityView];
    [cityView makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.phoneNumView.bottom);
        make.left.equalTo(self.view);
        make.right.equalTo(self.view);
        make.height.equalTo(H(40));
    }];
    self.cityView = cityView;
    
    //合作意向
    UILabel * teamworkLable = [UILabel lableWithTextColor:[UIColor blackColor] textFont:15 text:@"合作意向"];
    [self.view addSubview:teamworkLable];
    [teamworkLable makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view).offset(W(13));
        make.top.equalTo(self.cityView.bottom).offset(H(10));
        make.size.equalTo(CGSizeMake(W(75), H(15)));
    }];
    
    UITextView * teamworkTextView = [[UITextView alloc]init];
    teamworkTextView.delegate = self;
    
    [teamworkTextView setFont:[UIFont systemFontOfSize:15]];
    [self.view addSubview:teamworkTextView];
    [teamworkTextView makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.cityView.bottom).offset(H(2));
        make.left.equalTo(teamworkLable.right).offset(W(18));
        make.right.equalTo(self.cityView.right).offset(W(-15));
        make.height.equalTo(H(80));
    }];
    self.teamworkTextView = teamworkTextView;
    
    UILabel * teamPlaceholderLable = [UILabel lableWithTextColor:RGB(199, 199, 205) textFont:15 text:@"介绍您的产品以及希望的合作方式"];
    teamPlaceholderLable.numberOfLines = 0;
    [self.teamworkTextView addSubview:teamPlaceholderLable];
    [teamPlaceholderLable makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.teamworkTextView).offset(H(8));
        make.left.equalTo(self.teamworkTextView);
        make.right.equalTo(self.cityView.right).offset(W(-15));
        make.height.equalTo(H(15));
    }];
    self.teamPlaceholderLable = teamPlaceholderLable;
    
    UIView * teamSeparateLine = [[UIView alloc]init];
    teamSeparateLine.backgroundColor = [UIColor colorWithHexRGB:0xeeeeee];
    [self.view addSubview:teamSeparateLine];
    [teamSeparateLine makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.teamworkTextView.bottom);
        make.left.equalTo(self.view);
        make.right.equalTo(self.view);
        make.height.equalTo(H(1));
    }];
    self.teamSeparateLine = teamSeparateLine;
    
    //提交反馈
    UIButton * commitButton = [[UIButton alloc]init];
    [commitButton setTitle:@"提交反馈" forState:UIControlStateNormal];
    commitButton.titleLabel.font = [UIFont systemFontOfSize:17.5];
    [commitButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [commitButton setBackgroundImage:[UIImage imageNamed:@"卡包_保存按钮"] forState:UIControlStateNormal];
    [commitButton addTarget:self action:@selector(commitClick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:commitButton];
    [commitButton makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.teamSeparateLine.bottom).offset(H(20));
        make.centerX.equalTo(self.view);
        make.size.equalTo(CGSizeMake(W(260.5), H(35)));
    }];
    self.commitButton = commitButton;
    
    
}

-(void)textViewDidChange:(UITextView *)textView
{
    if (self.textView.text.length > 0) {
        self.placeholderLable.alpha = 0;
    }
    else
    {
        self.placeholderLable.alpha = 1;
    }
    
    if (self.teamworkTextView.text.length > 0) {
        self.teamPlaceholderLable.alpha = 0;
    }
    else
    {
        self.teamPlaceholderLable.alpha = 1;
    }
}

-(void)commitClick
{
    if (self.textView.text.length == 0 || self.nameView.textField.text.length == 0 || self.phoneNumView.textField.text.length == 0 || self.cityView.textField.text.length == 0 || self.teamworkTextView.text.length == 0) {
        [self.view makeToast:@"请将信息填写完整" duration:1.0 position:CSToastPositionCenter];
    }
    else
    {
        NSDictionary * dict = @{
                                @"city":self.cityView.textField.text,
                                @"description":self.teamworkTextView.text,
                                @"mobile":self.phoneNumView.textField.text,
                                @"name":self.nameView.textField.text
                                };
        
        // 自定义超时设置
        BANetManagerShare.timeoutInterval = 15;
        
        
        BADataEntity *entity = [BADataEntity new];
        entity.urlString = @"http://47.94.139.0/index.php?app=api&act=submit_cooperation";
        entity.needCache = NO;
        entity.parameters = dict;
        
        [SVProgressHUD show];
        
        
        [BANetManager ba_request_POSTWithEntity:entity successBlock:^(id response) {
            
            [SVProgressHUD dismiss];
            
            
            if ([response[@"status"] boolValue]) {
                self.teamworkTextView.text = @"";
                self.nameView.textField.text = @"";
                self.phoneNumView.textField.text = @"";
                self.cityView.textField.text = @"";
                self.textView.text = @"";
                self.placeholderLable.alpha = 1;
                self.teamPlaceholderLable.alpha = 1;
                
                [self.view makeToast:@"提交成功" duration:1.0 position:CSToastPositionCenter];
                
                
            }
            else
            {
                [self.view makeToast:response[@"reason"] duration:1.0 position:CSToastPositionCenter];
            }
            
            
            
        } failureBlock:^(NSError *error) {
            [SVProgressHUD dismiss];
            [self.view makeToast:@"网络异常" duration:1.0 position:CSToastPositionCenter];
        } progressBlock:^(int64_t bytesProgress, int64_t totalBytesProgress) {
            
        }];
        
        
    }
}


@end
