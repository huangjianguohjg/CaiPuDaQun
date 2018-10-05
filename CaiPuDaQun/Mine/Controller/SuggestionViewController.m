//
//  SuggestionViewController.m
//  cc
//
//  Created by mac on 2018/9/27.
//  Copyright © 2018年 zz. All rights reserved.
//

#import "SuggestionViewController.h"
#import "XXJLeftRightButton.h"
#import "JJPopoverTool.h"
#import "IdeaTableViewCell.h"
#import <BADataEntity.h>
@interface SuggestionViewController ()<UITextViewDelegate,UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, weak) UIView * topView;

@property (nonatomic, weak) XXJLeftRightButton * ideaButton;

//建议内容View
@property (nonatomic, weak) UIView * contentView;

@property (nonatomic, weak) UITextView * textView;

@property (nonatomic, weak) UILabel * placeholderLable;

//联系方式view
@property (nonatomic, weak) UIView * contactView;

@property (nonatomic, weak) UITextField * detailField;

@property (nonatomic, weak) UIButton * commitButton;

@end

@implementation SuggestionViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.navigationItem.title = @"意见反馈";
    
    [self setUpUI];
    
}

-(void)setUpUI
{
    //顶部view
    UIView * topView = [[UIView alloc]init];
    topView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:topView];
    [topView makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view).offset(kMarginTopHeight);
        make.left.equalTo(self.view);
        make.right.equalTo(self.view);
        make.height.equalTo(H(40));
    }];
    self.topView = topView;
    
    //问题类型
    UILabel * questionLable = [UILabel lableWithTextColor:[UIColor blackColor] textFont:W(15) text:@"问题类型"];
    [self.topView addSubview:questionLable];
    [questionLable makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.topView);
        make.left.equalTo(self.topView).offset(W(15));
        make.size.equalTo(CGSizeMake(W(100), H(15)));
    }];
    
    //新需求建议
    XXJLeftRightButton * newIdeaButton = [[XXJLeftRightButton alloc]init];
    [newIdeaButton addTarget:self action:@selector(ideaClick) forControlEvents:UIControlEventTouchUpInside];
    [newIdeaButton setTitle:@"新需求建议" forState:UIControlStateNormal];
    [newIdeaButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    newIdeaButton.titleLabel.font = [UIFont systemFontOfSize:15];
    [newIdeaButton setImage:[UIImage imageNamed:@"意见反馈_下拉箭头_right"] forState:UIControlStateNormal];
    [newIdeaButton sizeToFit];
    [self.topView addSubview:newIdeaButton];
    [newIdeaButton makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.topView);
        make.right.equalTo(self.topView).offset(W(-25));
    }];
    self.ideaButton = newIdeaButton;
    
    
    UIImageView * lineImageView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"意见反馈_分割线_center"]];
    [self.topView addSubview:lineImageView];
    [lineImageView makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.topView);
        make.right.equalTo(self.topView);
        make.bottom.equalTo(self.topView);
        make.height.equalTo(H(1));
    }];
    
    
    //需求建议
    //内容View
    UIView * contentView = [[UIView alloc]init];
    contentView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:contentView];
    [contentView makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(lineImageView.bottom);
        make.left.equalTo(self.view);
        make.right.equalTo(self.view);
        make.height.equalTo(H(141));
    }];
    self.contentView = contentView;
    
    
    UITextView * textView = [[UITextView alloc]init];
    textView.delegate = self;
//    [textView addDoneOnKeyboardWithTarget:self action:@selector(startSearch)];
    [textView setFont:[UIFont systemFontOfSize:15]];
    [self.contentView addSubview:textView];
    [textView makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.contentView.top).offset(H(15));
        make.left.equalTo(self.contentView).offset(W(21));
        make.right.equalTo(self.contentView).offset(W(-21));
        make.bottom.equalTo(self.contentView.bottom).offset(H(-15));
    }];
    self.textView = textView;
    
    UILabel * placeholderLable = [UILabel lableWithTextColor:[UIColor colorWithHexRGB:0xc3c3c3] textFont:14 text:@"请输入您的宝贵建议和问题"];
    placeholderLable.numberOfLines = 0;
    [self.textView addSubview:placeholderLable];
    [placeholderLable makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.textView).offset(H(5));
        make.left.equalTo(self.textView);
        make.right.equalTo(self.textView);
        make.height.equalTo(H(14));
    }];
    self.placeholderLable = placeholderLable;
    
    UIImageView * lineImageContentView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"意见反馈_分割线_center"]];
    [self.contentView addSubview:lineImageContentView];
    [lineImageContentView makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.contentView);
        make.right.equalTo(self.contentView);
        make.bottom.equalTo(self.contentView);
        make.height.equalTo(H(1));
    }];
    
    
    
    //联系方式View
    UIView * contactView = [[UIView alloc]init];
    contactView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:contactView];
    [contactView makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.contentView.bottom);
        make.left.equalTo(self.contentView.left);
        make.right.equalTo(self.contentView.right);
        make.height.equalTo(H(31));
    }];
    self.contactView = contactView;
    
    
    UILabel * contactLable = [UILabel lableWithTextColor:[UIColor blackColor] textFont:15 text:@"联系方式:"];
    [self.contactView addSubview:contactLable];
    [contactLable makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.contactView).offset(W(15));
        make.centerY.equalTo(self.contactView);
        make.size.equalTo(CGSizeMake(W(70), H(15)));
    }];
    
    UITextField * detailField = [[UITextField alloc]init];
    detailField.placeholder = @"必填";
    detailField.font = [UIFont systemFontOfSize:14];
    [self.contactView addSubview:detailField];
    [detailField makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(contactLable.right);
        make.centerY.equalTo(self.contactView);
        make.size.equalTo(CGSizeMake(W(200), H(15)));
    }];
    self.detailField = detailField;
    
    
    UIImageView * lineImageContactView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"意见反馈_分割线_center"]];
    [self.contactView addSubview:lineImageContactView];
    [lineImageContactView makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.contactView);
        make.right.equalTo(self.contactView);
        make.bottom.equalTo(self.contactView);
        make.height.equalTo(H(1));
    }];
    
    
    
    
    //提交反馈
    UIButton * commitButton = [[UIButton alloc]init];
    [commitButton setTitle:@"提交反馈" forState:UIControlStateNormal];
    [commitButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    commitButton.titleLabel.font = [UIFont systemFontOfSize:17.5];
//    [commitButton setBackgroundImage:[UIImage imageNamed:@"意见反馈_提交反馈_center"] forState:UIControlStateNormal];
    [commitButton setBackgroundColor:[UIColor blueColor]];
    [commitButton addTarget:self action:@selector(suggestRequest) forControlEvents:UIControlEventTouchUpInside];
    commitButton.layer.cornerRadius = 5;
    commitButton.clipsToBounds = YES;
    [self.view addSubview:commitButton];
    [commitButton makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(lineImageContactView.bottom).offset(H(43.5));
        make.centerX.equalTo(self.view);
        make.size.equalTo(CGSizeMake(W(260), H(41)));
    }];
    self.commitButton = commitButton;
    
}





-(void)startSearch
{
    [UIView animateWithDuration:0.25 animations:^{
        [self.textView resignFirstResponder];
    }];
}


- (void) textViewDidChange:(UITextView*)textView{
    if([textView.text length] ==0) {
        [self.placeholderLable setHidden:NO];
    }else{
        [self.placeholderLable setHidden:YES];
    }
}





-(void)ideaClick
{
    UITableView *tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, W(100), H(35) * 6)];
    tableView.dataSource =self;
    tableView.delegate = self;
    tableView.rowHeight = H(35);
    tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [JJPopoverTool presentContentView:tableView
                          pointToItem:self.ideaButton
                     passThroughViews:nil];
}



- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 6;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *ID = @"Cell";
    IdeaTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (cell == nil) {
        cell = [[IdeaTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
        //        cell.textLabel.textAlignment = NSTextAlignmentCenter;
    }
    NSArray * array = @[@"功能建议",@"界面建议",@"操作问题",@"质量问题",@"投诉",@"其他"];
    cell.titleLable.text = array[indexPath.row];
    cell.titleLable.font = [UIFont systemFontOfSize:14];
    return  cell;
}



- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    if ([JJPopoverTool isShowPopover]) {
        [JJPopoverTool dismiss];
    }
    
    IdeaTableViewCell * cell = [tableView cellForRowAtIndexPath:indexPath];
    
    [self.ideaButton setTitle:cell.titleLable.text forState:UIControlStateNormal];
    
}



-(void)suggestRequest
{
    
    if (self.textView.text.length == 0 || self.detailField.text.length == 0 ) {
        
        [self.view makeToast:@"请将信息填写完整" duration:1.0 position:CSToastPositionCenter];
        
    }
    else if ([self.ideaButton.currentTitle isEqualToString:@"新需求建议"])
    {
        [self.view makeToast:@"请选择建议类型" duration:1.0 position:CSToastPositionCenter];
    }
    else
    {
        [SVProgressHUD showWithStatus:@"正在提交反馈信息"];
        [SVProgressHUD setMinimumDismissTimeInterval:1.0];
        
        NSDictionary * dict = @{
                                @"description":self.textView.text,
                                @"mobile":self.detailField.text,
                                @"suggest_type":self.ideaButton.currentTitle
                                };
        
        
        // 自定义超时设置
        BANetManagerShare.timeoutInterval = 15;
        
        
        BADataEntity *entity = [BADataEntity new];
        entity.urlString = @"http://47.94.139.0/index.php?app=api&act=submit_suggest";
        entity.needCache = NO;
        entity.parameters = dict;
        
        [SVProgressHUD show];
        
        
        [BANetManager ba_request_POSTWithEntity:entity successBlock:^(id response) {
            
            [SVProgressHUD dismiss];
            
            
            if ([response[@"status"] boolValue]) {
                
                self.textView.text = nil;
                self.placeholderLable.hidden = NO;
                self.detailField.text = nil;
                [self.ideaButton setTitle:@"新需求建议" forState:UIControlStateNormal];
                
                
                [SVProgressHUD showSuccessWithStatus:@"意见反馈成功"];
                
            }
            else
            {
                [SVProgressHUD showErrorWithStatus:@"意见反馈失败"];
            }
            
            
            
        } failureBlock:^(NSError *error) {
            [SVProgressHUD dismiss];
            [self.view makeToast:@"网络异常" duration:1.0 position:CSToastPositionCenter];
        } progressBlock:^(int64_t bytesProgress, int64_t totalBytesProgress) {
            
        }];
        
    }
    
}




@end
