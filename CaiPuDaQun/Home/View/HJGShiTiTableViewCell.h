//
//  HJGShiTiTableViewCell.h
//  JiaKaoBaoDian
//
//  Created by Developer on 2018/10/1.
//  Copyright © 2018年 Developer. All rights reserved.
//

#import "HJGBaseTableViewCell.h"
#import "HJGShiTiModel.h"
@interface HJGShiTiTableViewCell : HJGBaseTableViewCell

@property (nonatomic, weak) UILabel *titleLab;

@property (nonatomic, weak) UILabel *ASelectLab;

@property (nonatomic, weak) UILabel *BSelectLab;

@property (nonatomic, weak) UILabel *CSelectLab;

@property (nonatomic, weak) UILabel *DSelectLab;

@property (nonatomic, weak) UILabel *zhengqueLab;

@property (nonatomic, weak) UILabel *jieshiLab;

@property (nonatomic, weak) UIImageView *gouA;

@property (nonatomic, weak) UIImageView *gouB;

@property (nonatomic, weak) UIImageView *gouC;

@property (nonatomic, weak) UIImageView *gouD;

@property (nonatomic, strong) HJGShiTiModel *model;

@property (nonatomic, weak) UIButton *jieshiBut;

@end
