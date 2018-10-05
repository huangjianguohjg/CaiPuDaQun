//
//  HJGTabBarController.m
//  ChilEducation
//
//  Created by DH on 2017/7/26.
//  Copyright © 2017年 DH. All rights reserved.
//

#import "HJGTabBarController.h"
#import "HJGNavgationController.h"
#import "HJGHomeController.h"
#import "HJGMineController.h"
#import "MineTableViewController.h"
@interface HJGTabBarController ()<UITabBarControllerDelegate>

@property(nonatomic,assign) NSInteger lastSelectedIndex;

@end

@implementation HJGTabBarController
- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.delegate = self;
    
    [self setShenheApp];
    
}



+ (void)initialize{
    UITabBarItem *appearance = [UITabBarItem appearance];
    NSMutableDictionary *attrs = [NSMutableDictionary dictionary];
    attrs[NSForegroundColorAttributeName] = [UIColor darkGrayColor];
    [appearance setTitleTextAttributes:attrs forState:UIControlStateSelected];
    [[UITabBar appearance] setBackgroundColor:[UIColor whiteColor]];
    
}


- (void)setShenheApp{
    
    HJGHomeController *vc = [[HJGHomeController alloc]init];
    [self setOneChildController:vc title:@"首页" nomarlImage:@"home_tabbarhome_normal" selectedImage:@"home_tabbarhome_selected"];
    
    UIStoryboard * sb = [UIStoryboard storyboardWithName:@"MineTableViewController" bundle:nil];
    [self setOneChildController:[sb instantiateInitialViewController] title:@"我的" nomarlImage:@"home_set_normal" selectedImage:@"home_set_selected"];

}



- (void)setOneChildController:(UIViewController *)vc title:(NSString *)title nomarlImage:(NSString *)nomarlImage selectedImage:(NSString *)selectedImage{
    vc.tabBarItem.title = title;
    vc.tabBarItem.image = [[UIImage imageNamed:nomarlImage] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    vc.tabBarItem.selectedImage = [[UIImage imageNamed:selectedImage] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    [self addChildViewController:[[HJGNavgationController alloc]initWithRootViewController:vc]];
    
}

#pragma mark -- UITarBarDelegate
-(void)tabBarController:(UITabBarController *)tabBarController didSelectViewController:(UIViewController *)viewController{
    
}



@end
