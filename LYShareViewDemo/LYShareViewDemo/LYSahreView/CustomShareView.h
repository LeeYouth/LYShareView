//
//  CustomShareView.h
//  Finance
//
//  Created by LYoung on 15/9/1.
//  Copyright (c) 2015年 LYoung. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol CustomShareViewDelegate <NSObject>

@optional
-(void)shareButtonActionWithTag:(NSInteger)btnTag;
@end

@interface CustomShareView : UIView


- (void)showInView:(UIView *) view;

@property (nonatomic ,weak) id<CustomShareViewDelegate>delegate;

@end
