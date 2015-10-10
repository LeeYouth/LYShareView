//
//  ViewController.m
//  ShareViewDemo
//
//  Created by LYoung on 15/10/10.
//  Copyright (c) 2015年 LYoung. All rights reserved.
//

#import "ViewController.h"
#import "CustomShareView.h"


@interface ViewController ()<CustomShareViewDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    
    UIButton *tapAction = [UIButton buttonWithType:UIButtonTypeCustom];
    [tapAction setBackgroundColor:[UIColor redColor]];
    tapAction.frame = CGRectMake((self.view.frame.size.width - 100)/2, 100, 100, 40);
    [tapAction setTitle:@"show" forState:UIControlStateNormal];
    [tapAction addTarget:self action:@selector(tapAction) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:tapAction];
    
}

-(void)tapAction
{
    CustomShareView *shareView = [[CustomShareView alloc] init];
    shareView.delegate = self;
    [shareView showInView:self.view];
}

-(void)shareButtonActionWithTag:(NSInteger)btnTag
{
    NSLog(@"the button tag is %ld",btnTag);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
