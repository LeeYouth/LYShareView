//
//  CustomShareView.m
//  Finance
//
//  Created by LYoung on 15/9/1.
//  Copyright (c) 2015年 LYoung. All rights reserved.
//

#import "CustomShareView.h"
#import "CustomButton.h"
#define     SCREEN_HEIGHT                   ([[UIScreen mainScreen] bounds].size.height)
#define     SCREEN_WIDTH                    ([[UIScreen mainScreen] bounds].size.width)
#define WINDOW_COLOR [UIColor colorWithRed:0 green:0 blue:0 alpha:0.4]

@interface CustomShareView()
{
    NSString *_urlString;
    NSString *_titleString;
    NSString *_contentString;
}
@property (nonatomic ,strong) UIView *toolbar;
@end

@implementation CustomShareView

-(id)init{
    self = [super init];
    if (self) {
        
        //初始化背景视图，添加手势
        self.frame = CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height);
        self.userInteractionEnabled = YES;
        self.backgroundColor = WINDOW_COLOR;
        
        UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(cancelShare)];
        [self addGestureRecognizer:tapGesture];
        
        [self setupBlur];
        
        [self initOtherUI];
        
    }
    return self;
}

#pragma mark - 取消操作
-(void)cancelSelectedShareBtnClick{
    [self cancelShare];
}
#pragma mark - 设置模糊化
- (void)setupBlur {
    [self setClipsToBounds:YES];
    if (![self toolbar]) {
        self.toolbar = [[UIView alloc] init];
        self.toolbar.backgroundColor = [UIColor whiteColor];
        [self addSubview:self.toolbar];
        self.toolbar.frame = CGRectMake(0, SCREEN_HEIGHT, SCREEN_WIDTH, 0);
    }
    [UIView animateWithDuration:0.3 animations:^{
        self.toolbar.frame = CGRectMake(0, SCREEN_HEIGHT - 130, SCREEN_WIDTH, 130);
    } completion:^(BOOL finished) {
    }];
}

-(void)initOtherUI{
    UILabel *waitL = [[UILabel alloc] initWithFrame:CGRectMake((SCREEN_WIDTH - 120)/2, 10, 120, 20)];
    waitL.text = @"分享到";
    waitL.backgroundColor = [UIColor clearColor];
    waitL.font = [UIFont systemFontOfSize:18.0];
    waitL.textAlignment = NSTextAlignmentCenter;
    [self.toolbar addSubview:waitL];
    
    UIView *lineView = [[UILabel alloc] initWithFrame:CGRectMake(10, 40, SCREEN_WIDTH - 20, 0.4)];
    lineView.backgroundColor = [UIColor lightGrayColor];
    lineView.alpha = 0.6;
    [self.toolbar addSubview:lineView];
    
    CGFloat buttonH = 50;
    CGFloat boardW = (SCREEN_WIDTH - 250)/6;
    
    NSArray *imgsArray = [NSArray arrayWithObjects:@"shareIcon_weixin",@"shareIcon_pengyouquan",@"shareIcon_weibo",@"shareIcon_qq",@"shareIcon_kongjian", nil];
    NSArray *nameArray = [NSArray arrayWithObjects:@"微信",@"朋友圈",@"新浪微博",@"QQ好友",@"QQ空间", nil];
    
    for (int i = 0; i <= 4; i ++) {
        CustomButton *okBtn = [[CustomButton alloc] initWithFrame:CGRectMake((boardW + buttonH)*i + boardW, 40 + 20, buttonH, buttonH)];
        okBtn.tag = i;
        [okBtn setTitle:nameArray[i] forState:UIControlStateNormal];
        [okBtn setImage:[UIImage imageNamed:imgsArray[i]] forState:UIControlStateNormal];
        [okBtn addTarget:self action:@selector(renwenAction:) forControlEvents:UIControlEventTouchUpInside];
        [self.toolbar addSubview:okBtn];
    }
}

#pragma mark - 确定操作
-(void)renwenAction:(UIButton *)sender{
    
    if (_delegate && [_delegate respondsToSelector:@selector(shareButtonActionWithTag:)]) {
        [_delegate shareButtonActionWithTag:sender.tag];
    }
    
    [self cancelShare];
}

#pragma mark - 显示操作
- (void)showInView:(UIView *) view{
    [[UIApplication sharedApplication].delegate.window  addSubview:self];
}

#pragma mark - 取消操作
- (void)cancelShare{
    [UIView animateWithDuration:0.3 animations:^{
        [self.toolbar setFrame:CGRectMake(0, SCREEN_HEIGHT, SCREEN_WIDTH, 0)];
    }completion:^(BOOL finished){
        [self removeFromSuperview];
    }];
}

- (UIImage *)imageWithColor:(UIColor *)color
{
    CGRect rect = CGRectMake(0, 0, 1, 1);
    UIGraphicsBeginImageContextWithOptions(rect.size, NO, 0);
    [color setFill];
    UIRectFill(rect);
    
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return image;
}
@end
