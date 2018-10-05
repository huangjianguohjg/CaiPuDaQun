//
//  XXJLeftRightButton.m
//  lineroad
//
//  Created by gagakj on 2017/7/29.
//  Copyright © 2017年 田宇. All rights reserved.
//

#import "XXJLeftRightButton.h"
#import "UIView+LayoutMethods.h"

@implementation XXJLeftRightButton

-(void)layoutSubviews
{
    [super layoutSubviews];
//    self.imageView.xxj_y = H(20);
//    
//    self.imageView.xxj_centerX = self.xxj_width * 0.5;
//    
//    self.titleLabel.xxj_y = self.imageView.xxj_height + H(14) + H(20);
//    
//    [self.titleLabel sizeToFit];
//    
//    self.titleLabel.xxj_centerX = self.xxj_width * 0.5;
//    
    
    
    self.titleLabel.x = W(-5);
    
    [self.titleLabel sizeToFit];
    
    self.imageView.x = self.titleLabel.width;
    
    
    
    
    
}

@end
