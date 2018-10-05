//
//  NetViewController.m
//  cc
//
//  Created by mac on 2018/9/27.
//  Copyright © 2018年 zz. All rights reserved.
//

#import "NetViewController.h"
#import <AFNetworking.h>
@interface NetViewController ()

@property (nonatomic, weak) UILabel * nameLable;

@property (nonatomic, weak) UIImageView * netImageView;

@end

@implementation NetViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.navigationItem.title = @"网络诊断";
    
    //界面初始化
    [self setUpUI];
    
}


-(void)setUpUI
{
    UIImageView * netImageView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"网络诊断_网络图标"]];
    [netImageView sizeToFit];
    [self.view addSubview:netImageView];
    [netImageView makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view).offset(H(77.5) + kMarginTopHeight);
        make.centerX.equalTo(self.view);
        //        make.size.equalTo(CGSizeMake(W(162), H(123)));
    }];
    self.netImageView = netImageView;
    
    UILabel * nameLable = [UILabel lableWithTextColor:[UIColor blackColor] textFont:19 text:@""];
    [self.view addSubview:nameLable];
    [nameLable makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(netImageView.bottom).offset(H(46));
        make.centerX.equalTo(self.view);
    }];
    self.nameLable = nameLable;
    
    
    UIButton * diagnoseButton = [[UIButton alloc]init];
    [diagnoseButton setTitle:@"开始诊断" forState:UIControlStateNormal];
    [diagnoseButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    diagnoseButton.titleLabel.font = [UIFont systemFontOfSize:19];
    [diagnoseButton setBackgroundImage:[UIImage imageNamed:@"网络诊断_开始诊断"] forState:UIControlStateNormal];
    [diagnoseButton addTarget:self action:@selector(diagnoseClick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:diagnoseButton];
    [diagnoseButton makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view);
        make.right.equalTo(self.view);
        make.bottom.equalTo(self.view);
        make.height.equalTo(H(44));
    }];
    
    
}

//开始诊断网络
-(void)diagnoseClick
{
    self.nameLable.text = @"网络诊断中...";
    
    [SVProgressHUD show];
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [[AFNetworkReachabilityManager sharedManager] startMonitoring];
        
        [[AFNetworkReachabilityManager sharedManager] setReachabilityStatusChangeBlock:^(AFNetworkReachabilityStatus status) {
            [SVProgressHUD dismiss];
            switch (status) {
                case -1:
                    NSLog(@"未知网络");
                    break;
                case 0:
                    NSLog(@"网络不可用");
                    break;
                case 1:
                    NSLog(@"GPRS网络");
                    break;
                case 2:
                    NSLog(@"wifi网络");
                    break;
                default:
                    break;
            }
            if(status ==AFNetworkReachabilityStatusReachableViaWWAN)
            {
                NSLog(@"有网");
                
                //                [SVProgressHUD showSuccessWithStatus:@"手机网络连接正常"];
                //
                //                [SVProgressHUD dismissWithDelay:1.0];
                [self.netImageView setImage:[UIImage imageNamed:@"手机WiFi"]];
                self.nameLable.text = @"手机网络连接正常";
                [self.view makeToast:@"手机网络连接正常" duration:1.0 position:CSToastPositionCenter];
            }
            else if (status == AFNetworkReachabilityStatusReachableViaWiFi)
            {
                //                [SVProgressHUD showSuccessWithStatus:@"WiFi连接正常"];
                //
                //                [SVProgressHUD dismissWithDelay:1.0];
                [self.netImageView setImage:[UIImage imageNamed:@"wifi"]];
                self.nameLable.text = @"WiFi连接正常";
                [self.view makeToast:@"WiFi连接正常" duration:1.0 position:CSToastPositionCenter];
            }
            else if (status == AFNetworkReachabilityStatusUnknown)
            {
                //                [SVProgressHUD showSuccessWithStatus:@"连接未知网络，注意安全"];
                //
                //                [SVProgressHUD dismissWithDelay:1.0];
                [self.netImageView setImage:[UIImage imageNamed:@"wifiX"]];
                self.nameLable.text = @"连接未知网络，注意安全";
                [self.view makeToast:@"连接未知网络，注意安全" duration:1.0 position:CSToastPositionCenter];
            }
            else
            {
                NSLog(@"没有网");
                
                //                [SVProgressHUD showErrorWithStatus:@"网络失去连接"];
                //
                //                [SVProgressHUD dismissWithDelay:1.0];
                [self.netImageView setImage:[UIImage imageNamed:@"网络诊断_网络图标"]];
                self.nameLable.text = @"网络失去连接";
                [self.view makeToast:@"网络失去连接" duration:1.0 position:CSToastPositionCenter];
                
                //                UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"网络失去连接" message:nil delegate:self cancelButtonTitle:@"取消" otherButtonTitles:nil, nil];
                //                alert.delegate = self;
                //                [alert show];
            }
        }];
    });
    
    
}



-(void)netCheck
{
    [[AFNetworkReachabilityManager sharedManager] setReachabilityStatusChangeBlock:^(AFNetworkReachabilityStatus status) {
        switch (status) {
            case -1:
                NSLog(@"未知网络");
                break;
            case 0:
                NSLog(@"网络不可用");
                break;
            case 1:
                NSLog(@"GPRS网络");
                break;
            case 2:
                NSLog(@"wifi网络");
                break;
            default:
                break;
        }
        if(status ==AFNetworkReachabilityStatusReachableViaWWAN || status == AFNetworkReachabilityStatusReachableViaWiFi)
        {
            NSLog(@"有网");
            [self.view makeToast:@"有网络" duration:1.0 position:CSToastPositionCenter];
        }
        else
        {
            NSLog(@"没有网");
            UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"网络失去连接" message:nil delegate:self cancelButtonTitle:@"取消" otherButtonTitles:nil, nil];
            alert.delegate = self;
            [alert show];
        }
    }];
}


@end
