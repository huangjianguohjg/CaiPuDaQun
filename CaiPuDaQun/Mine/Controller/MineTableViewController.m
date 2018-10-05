//
//  MineTableViewController.m
//  cc
//
//  Created by mac on 2018/9/27.
//  Copyright © 2018年 zz. All rights reserved.
//

#import "MineTableViewController.h"
#import "AboutViewController.h"
#import "SuggestionViewController.h"
#import "NetViewController.h"
#import "MineViewController.h"
#import <AXWebViewController.h>

@interface MineTableViewController ()

@property (nonatomic, strong) UIButton *xieyiBut;

@end

@implementation MineTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.title = @"我的";
    
    [self xieyiBut];
    
    [self.view bringSubviewToFront:self.xieyiBut];
}

- (UIButton *)xieyiBut
{
    if (!_xieyiBut) {
        UIButton * theView = [[UIButton alloc] init];
        [theView setTitle:@"驾考试题《隐私政策协议》" forState:0];
        [theView setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
        [theView addTarget:self action:@selector(xieyiButClick) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:theView];
        [theView makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(self.view);
            make.top.equalTo(self.view).offset(HEIGHT - kMarginTopHeight - H(200));
            make.size.equalTo(CGSizeMake(W(270), H(40)));
        }];
        _xieyiBut = theView;
    }
    return _xieyiBut;
}

- (void)xieyiButClick{
    
    AXWebViewController *vc = [[AXWebViewController alloc]initWithURL:[NSURL URLWithString:@"https://huangjianguohjg.github.io/yinsi/yin.html"]];
    
    [self.navigationController pushViewController:vc animated:YES];
    
}


-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{    
    if (indexPath.section == 1) {
        if (indexPath.row == 0) {
            //关于
            AboutViewController * vc = [[AboutViewController alloc]init];
            vc.hidesBottomBarWhenPushed = YES;
            [self.navigationController pushViewController:vc animated:YES];
        }
        else if (indexPath.row == 1)
        {
            //意见反馈
            SuggestionViewController * vc = [[SuggestionViewController alloc]init];
            vc.hidesBottomBarWhenPushed = YES;
            [self.navigationController pushViewController:vc animated:YES];
        }
        else if (indexPath.row == 2)
        {
            //网络诊断
            NetViewController * vc = [[NetViewController alloc]init];
            vc.hidesBottomBarWhenPushed = YES;
            [self.navigationController pushViewController:vc animated:YES];
        }
        else if (indexPath.row == 3)
        {
            //业务合作
            MineViewController * vc = [[MineViewController alloc]init];
            vc.hidesBottomBarWhenPushed = YES;
            [self.navigationController pushViewController:vc animated:YES];
        }
        
    }
}



@end
