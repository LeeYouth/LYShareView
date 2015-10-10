# LYShareView
    弹出效果的分享动画

## 需要显示分享视图的地方添加
    CustomShareView *shareView = [[CustomShareView alloc] init];
    shareView.delegate = self;
    [shareView showInView:self.view];
## 实现代理方法
    -(void)shareButtonActionWithTag:(NSInteger)btnTag
    {
        NSLog(@"the button tag is %ld",btnTag);
    }
## 见截图
![image](https://github.com/YourAcountName/ProjectName/blob/master/GIFName.gif )
