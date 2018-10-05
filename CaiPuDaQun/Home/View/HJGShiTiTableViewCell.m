//
//  HJGShiTiTableViewCell.m
//  JiaKaoBaoDian
//
//  Created by Developer on 2018/10/1.
//  Copyright © 2018年 Developer. All rights reserved.
//

#import "HJGShiTiTableViewCell.h"

@implementation HJGShiTiTableViewCell


- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self setupUI];
    }
    return self;
}

- (void)setModel:(HJGShiTiModel *)model{
    
    _model = model;
    
    self.titleLab.text = model.title;
    
    self.ASelectLab.text = [NSString stringWithFormat:@"A:%@",model.a];
    
    self.BSelectLab.text = [NSString stringWithFormat:@"B:%@",model.b];
    
    if (model.c.length == 0) {
        self.CSelectLab.alpha = 0.f;
    }else{
        self.CSelectLab.alpha = 1.f;
    }
    
    if (model.d.length == 0) {
        self.DSelectLab.alpha = 0.f;
        
    }else{
        self.DSelectLab.alpha = 1.f;
    }
        
    
    self.CSelectLab.text = [NSString stringWithFormat:@"C:%@",model.c];
    
    self.DSelectLab.text = [NSString stringWithFormat:@"D:%@",model.d];
}

#pragma mark - setupUI
- (void)setupUI{
    self.contentView.backgroundColor = RGB(211, 211, 211);
    self.contentView.layer.cornerRadius = W(10);
    
    self.contentView.clipsToBounds = YES;

    [self.contentView makeConstraints:^(MASConstraintMaker *make) {
    
        make.left.equalTo(self).offset(W(10));
        make.top.equalTo(self).offset(H(10));
        make.bottom.equalTo(self).offset(-H(10));
        make.right.equalTo(self).offset(-W(10));
        
    }];
    
    [self titleLab];
    
    [self ASelectLab];
    
    [self BSelectLab];
    
    [self CSelectLab];
    
    [self DSelectLab];
    
    [self zhengqueLab];
    
    [self jieshiLab];
    
    [self gouA];
    
    [self gouB];
    
    [self gouC];
    
    [self gouD];
    
    [self jieshiBut];
    
    
}


- (UILabel *)titleLab
{
    if (!_titleLab) {
        UILabel * theView = [[UILabel alloc] init];
        theView.text = @"请问开口了卡卡卡斤斤计较军军军军军军军";
        theView.font = [UIFont systemFontOfSize:W(17) weight:UIFontWeightBold];
        theView.textColor = [UIColor darkGrayColor];
        theView.textAlignment = NSTextAlignmentLeft;
        theView.numberOfLines = 0;
        [self.contentView addSubview:theView];
        [theView makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.contentView).offset(W(10));
            make.top.equalTo(self.contentView).offset(H(10));
            make.right.equalTo(self.contentView).offset(-W(10));
        }];
        _titleLab = theView;
    }
    return _titleLab;
}

- (UILabel *)ASelectLab
{
    if (!_ASelectLab) {
        UILabel * theView = [[UILabel alloc] init];
        theView.text = @"请问开口了卡卡卡斤斤计较军军军军军军军";
        theView.font = [UIFont systemFontOfSize:W(15)];
        theView.textColor = [UIColor darkGrayColor];
        theView.textAlignment = NSTextAlignmentLeft;
        theView.numberOfLines = 0;
        [self.contentView addSubview:theView];
        [theView makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.contentView).offset(W(10));
            make.top.equalTo(self.titleLab.bottom).offset(H(15));
            make.right.equalTo(self.contentView).offset(-W(10));
        }];
        _ASelectLab = theView;
    }
    return _ASelectLab;
}


- (UILabel *)BSelectLab
{
    if (!_BSelectLab) {
        UILabel * theView = [[UILabel alloc] init];
        theView.text = @"请问开口了卡卡卡斤斤计较军军军军军军军";
        theView.font = [UIFont systemFontOfSize:W(15)];
        theView.textColor = [UIColor darkGrayColor];
        theView.textAlignment = NSTextAlignmentLeft;
        theView.numberOfLines = 0;
        [self.contentView addSubview:theView];
        [theView makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.contentView).offset(W(10));
            make.top.equalTo(self.ASelectLab.bottom).offset(H(15));
            make.right.equalTo(self.contentView).offset(-W(10));
        }];
        _BSelectLab = theView;
    }
    return _BSelectLab;
}

- (UILabel *)CSelectLab
{
    if (!_CSelectLab) {
        UILabel * theView = [[UILabel alloc] init];
        theView.text = @"请问开口了卡卡卡斤斤计较军军军军军军军";
        theView.font = [UIFont systemFontOfSize:W(15)];
        theView.textColor = [UIColor darkGrayColor];
        theView.textAlignment = NSTextAlignmentLeft;
        theView.numberOfLines = 0;
        [self.contentView addSubview:theView];
        [theView makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.contentView).offset(W(10));
            make.top.equalTo(self.BSelectLab.bottom).offset(H(15));
            make.right.equalTo(self.contentView).offset(-W(10));
        }];
        _CSelectLab = theView;
    }
    return _CSelectLab;
}

- (UILabel *)DSelectLab
{
    if (!_DSelectLab) {
        UILabel * theView = [[UILabel alloc] init];
        theView.text = @"请问开口了卡卡卡斤斤计较军军军军军军军";
        theView.font = [UIFont systemFontOfSize:W(15)];
        theView.textColor = [UIColor darkGrayColor];
        theView.textAlignment = NSTextAlignmentLeft;
        theView.numberOfLines = 0;
        [self.contentView addSubview:theView];
        [theView makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.contentView).offset(W(10));
            make.top.equalTo(self.CSelectLab.bottom).offset(H(15));
            make.right.equalTo(self.contentView).offset(-W(10));
        }];
        _DSelectLab = theView;
    }
    return _DSelectLab;
}

- (UILabel *)zhengqueLab
{
    if (!_zhengqueLab) {
        UILabel * theView = [[UILabel alloc] init];
        [self.contentView addSubview:theView];
        _zhengqueLab = theView;
    }
    return _zhengqueLab;
}


- (UILabel *)jieshiLab
{
    if (!_jieshiLab) {
        UILabel * theView = [[UILabel alloc] init];
        [self.contentView addSubview:theView];
        _jieshiLab = theView;
    }
    return _jieshiLab;
}

- (UIImageView *)gouA
{
    if (!_gouA) {
        UIImageView * theView = [[UIImageView alloc] init];
        [self.contentView addSubview:theView];
        _gouA = theView;
    }
    return _gouA;
}

- (UIImageView *)gouB
{
    if (!_gouB) {
        UIImageView * theView = [[UIImageView alloc] init];
        [self.contentView addSubview:theView];
        _gouB = theView;
    }
    return _gouB;
}


- (UIImageView *)gouC
{
    if (!_gouC) {
        UIImageView * theView = [[UIImageView alloc] init];
        [self.contentView addSubview:theView];
        _gouC = theView;
    }
    return _gouC;
}

- (UIImageView *)gouD
{
    if (!_gouD) {
        UIImageView * theView = [[UIImageView alloc] init];
        [self.contentView addSubview:theView];
        _gouD = theView;
    }
    return _gouD;
}


- (UIButton *)jieshiBut
{
    if (!_jieshiBut) {
        UIButton * theView = [[UIButton alloc] init];
        [theView setTitle:@"解释" forState:0];
        [theView setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
        theView.layer.cornerRadius = H(10);
        theView.clipsToBounds = YES;
        theView.layer.borderColor = [UIColor redColor].CGColor;
        theView.layer.borderWidth = W(1);
        theView.titleLabel.font = [UIFont systemFontOfSize:W(16)];
        [self.contentView addSubview:theView];
        [theView makeConstraints:^(MASConstraintMaker *make) {
            make.bottom.equalTo(self.contentView).offset(-H(15));
            make.size.equalTo(CGSizeMake(W(100), H(40)));
            make.centerX.equalTo(self.contentView);
        }];
        _jieshiBut = theView;
    }
    return _jieshiBut;
}
@end

