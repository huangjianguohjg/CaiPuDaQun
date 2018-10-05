//
//  HJGHomeDetailController.m
//  JiaKaoBaoDian
//
//  Created by Developer on 2018/10/1.
//  Copyright © 2018年 Developer. All rights reserved.
//

#import "HJGHomeDetailController.h"
#import "HJGShiTiTableViewCell.h"
#import "HJGShiTiModel.h"
#import "TableViewAnimationKitHeaders.h"
#import "CKAlertViewController.h"

@interface HJGHomeDetailController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, strong) UITableView *rootTableView;

@property (nonatomic, strong) NSMutableArray *modelArr;

@property (nonatomic, assign) NSInteger begin;

@property (nonatomic, assign) NSInteger size;

@property (nonatomic, strong) NSMutableArray *stateArr;

@end

@implementation HJGHomeDetailController

- (NSMutableArray *)stateArr{
    
    if (!_stateArr) {
        _stateArr = [NSMutableArray array];
    }
    
    return _stateArr;
    
    
}


- (NSMutableArray *)modelArr{
    
    if (!_modelArr) {
        _modelArr = [NSMutableArray array];
    }
    
    return _modelArr;
    
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self configBaseData];
    
    [self configNav];
    
    [self configView];
    
    [self getShiTiData];
}

- (void)configBaseData{
    
    [self.stateArr removeAllObjects];
    for (int i = 0; i < 2000; i ++ ) {
        [self.stateArr addObject:@"5"];
    }
    
    
    self.begin = 1;
    
    self.size = 20;
    
    @weakify_self;
    self.rootTableView.mj_header = [MJRefreshHeader headerWithRefreshingBlock:^{
        @strongify_self;
        
        self.begin = 1;
        
        [self.modelArr removeAllObjects];
        
        [self getShiTiData];
        
        
    }];
    
    self.rootTableView.mj_footer = [MJRefreshAutoFooter footerWithRefreshingBlock:^{
        @strongify_self;
        
        self.begin = self.begin + 1;
        
        [self getShiTiData];
        
    }];
    
    
    
}

#pragma mark - configNav
- (void)configNav{
    self.automaticallyAdjustsScrollViewInsets = NO;
    self.title = self.title_str;
    
}

#pragma mark - configView
- (void)configView{
    
    [self rootTableView];
}

- (UITableView *)rootTableView
{
    if (!_rootTableView) {
        UITableView * theView = [[UITableView alloc] initWithFrame:CGRectMake(0, kMarginTopHeight, WIDTH , HEIGHT - kMarginTopHeight)];
        theView.delegate = self;
        theView.dataSource = self;
        [theView registerClass:[HJGShiTiTableViewCell class] forCellReuseIdentifier:[HJGShiTiTableViewCell getCellIdentifier]];
        [self.view addSubview:theView];

        _rootTableView = theView;
    }
    return _rootTableView;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{

    return self.modelArr.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    HJGShiTiTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:[HJGShiTiTableViewCell getCellIdentifier]];
    cell.model = [self.modelArr safeObjectAtIndex:indexPath.row];
    cell.titleLab.text = [NSString stringWithFormat:@"第%ld道:%@",indexPath.row + 1,cell.model.title];
    [cell.jieshiBut addTarget:self action:@selector(jieshiButClick:) forControlEvents:UIControlEventTouchUpInside];
    int lala = [[self.stateArr safeObjectAtIndex:indexPath.row] intValue];
    switch (lala) {
        case 1:
            cell.ASelectLab.textColor= [UIColor greenColor];
            cell.BSelectLab.textColor = [UIColor redColor];
            cell.CSelectLab.textColor = [UIColor redColor];
            cell.DSelectLab.textColor = [UIColor redColor];
            break;
        case 2:
            cell.ASelectLab.textColor= [UIColor redColor];
            cell.BSelectLab.textColor = [UIColor greenColor];
            cell.CSelectLab.textColor = [UIColor redColor];
            cell.DSelectLab.textColor = [UIColor redColor];
            break;
        case 3:
            cell.ASelectLab.textColor= [UIColor redColor];
            cell.BSelectLab.textColor = [UIColor redColor];
            cell.CSelectLab.textColor = [UIColor greenColor];
            cell.DSelectLab.textColor = [UIColor redColor];
            break;
        case 4:
            cell.ASelectLab.textColor= [UIColor redColor];
            cell.BSelectLab.textColor = [UIColor redColor];
            cell.CSelectLab.textColor = [UIColor redColor];
            cell.DSelectLab.textColor = [UIColor greenColor];
            break;
        case 5:
            cell.ASelectLab.textColor= [UIColor darkGrayColor];
            cell.BSelectLab.textColor = [UIColor darkGrayColor];
            cell.CSelectLab.textColor = [UIColor darkGrayColor];
            cell.DSelectLab.textColor = [UIColor darkGrayColor];
            break;
        default:
            break;
    }
    return cell;
}

- (void)jieshiButClick:(UIButton *)but{
    
    
    HJGShiTiTableViewCell *cell = (HJGShiTiTableViewCell *)[[but superview] superview];
    NSIndexPath *indexP = [self.rootTableView indexPathForCell:cell];

    
    HJGShiTiModel *model = [self.modelArr safeObjectAtIndex:indexP.row];
    int lala = [model.val intValue];
    switch (lala) {
        case 1:
            cell.ASelectLab.textColor= [UIColor greenColor];
            cell.BSelectLab.textColor = [UIColor redColor];
            cell.CSelectLab.textColor = [UIColor redColor];
            cell.DSelectLab.textColor = [UIColor redColor];
            break;
        case 2:
            cell.ASelectLab.textColor= [UIColor redColor];
            cell.BSelectLab.textColor = [UIColor greenColor];
            cell.CSelectLab.textColor = [UIColor redColor];
            cell.DSelectLab.textColor = [UIColor redColor];
            break;
        case 3:
            cell.ASelectLab.textColor= [UIColor redColor];
            cell.BSelectLab.textColor = [UIColor redColor];
            cell.CSelectLab.textColor = [UIColor greenColor];
            cell.DSelectLab.textColor = [UIColor redColor];
            break;
        case 4:
            cell.ASelectLab.textColor= [UIColor redColor];
            cell.BSelectLab.textColor = [UIColor redColor];
            cell.CSelectLab.textColor = [UIColor redColor];
            cell.DSelectLab.textColor = [UIColor greenColor];
            break;
            
        default:
            break;
    }
    
    [self.stateArr replaceObjectAtIndex:indexP.row withObject:model.val];
    NSString *jieshi = model.explainText;
    CKAlertViewController *alertVC = [CKAlertViewController alertControllerWithTitle:@"试题解释" message:jieshi];
    
    CKAlertAction *cancel = [CKAlertAction actionWithTitle:@"确定" handler:^(CKAlertAction *action) {

    }];
    
    [alertVC addAction:cancel];
    [self presentViewController:alertVC animated:NO completion:nil];
    
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return H(290);
    
}

- (void)getShiTiData{

    
    NSString *str = [NSString stringWithFormat:@"http://apicloud.mob.com/tiku/kemu1/query?key=27e98bbb155b8&page=%ld&size=20",self.begin];
    
    if (self.isKemusi) {
        str = [NSString stringWithFormat:@"http://apicloud.mob.com/tiku/kemu4/query?key=27e98bbb155b8&page=%ld&size=20",self.begin];
    }
    
    [HJGNetManger getUrl:str IsNeedCashe:NO dic:@{} responseSuccess:^(id response) {
        
        DLog(@"%@",response);
        
        if (((NSArray *)response[@"result"][@"list"]).count ==0) {
            [SVProgressHUD setMinimumDismissTimeInterval:2.f];
            [SVProgressHUD showErrorWithStatus:@"暂无更多数据"];
            return;
        }
        
        [response[@"result"][@"list"] enumerateObjectsUsingBlock:^(NSDictionary* obj, NSUInteger idx, BOOL * _Nonnull stop) {
            
            HJGShiTiModel *model = [HJGShiTiModel mj_objectWithKeyValues:obj];
            [self.modelArr addObject:model];
        }];
        
        [self.rootTableView reloadData];
//        [TableViewAnimationKit toTopAnimationWithTableView:self.rootTableView];
        [TableViewAnimationKit shakeAnimationWithTableView:self.rootTableView];
        [self.rootTableView.mj_header endRefreshing];
        [self.rootTableView.mj_footer endRefreshing];
    } responseFail:^(NSError *error) {
        [self.rootTableView.mj_header endRefreshing];
        [self.rootTableView.mj_footer endRefreshing];
    }];

    
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{

    HJGShiTiTableViewCell *cell = [self.rootTableView cellForRowAtIndexPath:indexPath];
    HJGShiTiModel *model = [self.modelArr safeObjectAtIndex:indexPath.row];
    int lala = [model.val intValue];
    switch (lala) {
        case 1:
            cell.ASelectLab.textColor= [UIColor greenColor];
            cell.BSelectLab.textColor = [UIColor redColor];
            cell.CSelectLab.textColor = [UIColor redColor];
            cell.DSelectLab.textColor = [UIColor redColor];
            break;
        case 2:
            cell.ASelectLab.textColor= [UIColor redColor];
            cell.BSelectLab.textColor = [UIColor greenColor];
            cell.CSelectLab.textColor = [UIColor redColor];
            cell.DSelectLab.textColor = [UIColor redColor];
            break;
        case 3:
            cell.ASelectLab.textColor= [UIColor redColor];
            cell.BSelectLab.textColor = [UIColor redColor];
            cell.CSelectLab.textColor = [UIColor greenColor];
            cell.DSelectLab.textColor = [UIColor redColor];
            break;
        case 4:
            cell.ASelectLab.textColor= [UIColor redColor];
            cell.BSelectLab.textColor = [UIColor redColor];
            cell.CSelectLab.textColor = [UIColor redColor];
            cell.DSelectLab.textColor = [UIColor greenColor];
            break;
            
        default:
            break;
    }
    
    [self.stateArr replaceObjectAtIndex:indexPath.row withObject:model.val];
    NSString *jieshi = model.explainText;
    CKAlertViewController *alertVC = [CKAlertViewController alertControllerWithTitle:@"试题解释" message:jieshi];
    
    CKAlertAction *cancel = [CKAlertAction actionWithTitle:@"确定" handler:^(CKAlertAction *action) {
        
    }];
    
    [alertVC addAction:cancel];
    [self presentViewController:alertVC animated:NO completion:nil];
}

@end
