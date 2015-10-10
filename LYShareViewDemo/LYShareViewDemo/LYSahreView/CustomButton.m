//
//  CustomButton.m
//  Finance
//
//  Created by LYoung on 15/9/1.
//  Copyright (c) 2015年 LYoung. All rights reserved.
//

#import "CustomButton.h"
#define iOS7        ([[UIDevice currentDevice].systemVersion doubleValue] >= 7.0)

@implementation CustomButton

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        //1.图片居中
        //        self.imageView.contentMode = UIViewContentModeCenter;
        self.imageEdgeInsets = UIEdgeInsetsMake(0,8,16,8);
        //2.文字居中
        self.titleLabel.textAlignment = NSTextAlignmentCenter;
        if (iOS7) {
            [self setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
            [self setTitleColor:[UIColor blackColor] forState:UIControlStateHighlighted];
        }
        self.titleLabel.font = [UIFont systemFontOfSize:12];
        
    }
    return self;
}
#pragma mark -覆盖父类的两个方法
#pragma mark 设置按钮标题的frame
- (CGRect)titleRectForContentRect:(CGRect)contentRect
{
    UIImage *image = [self imageForState:UIControlStateNormal];
    CGFloat titleY = image.size.height;
    CGFloat titleH = self.bounds.size.height - titleY;
    return CGRectMake(0, titleY , self.bounds.size.width, titleH + 4);
}
@end
