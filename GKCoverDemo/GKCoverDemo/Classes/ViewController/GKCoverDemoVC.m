//
//  ViewController.m
//  GKCoverDemo
//
//  Created by 高坤 on 16/8/24.
//  Copyright © 2016年 高坤. All rights reserved.
//

#import "GKCoverDemoVC.h"
#import "UIView+GKExtension.h"
#import "GKCover.h"

@interface GKCoverDemoVC ()

// 自定义遮罩
@property (nonatomic, weak) GKCover *cover;
// 弹出的视图
@property (nonatomic, weak) UIView *customView;

@end

@implementation GKCoverDemoVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
}

// 半透明遮罩-底部弹窗
- (IBAction)translucentCover:(id)sender {
    UIView *redView = [UIView new];
    redView.backgroundColor = [UIColor redColor];
    redView.gk_size = CGSizeMake(self.view.frame.size.width, 200);
    
    [GKCover translucentCoverFrom:self.view content:redView animated:YES];
}
// 全透明遮罩-底部弹窗
- (IBAction)transparentCover:(id)sender {
    UIView *blueView = [UIView new];
    blueView.backgroundColor = [UIColor blueColor];
    blueView.gk_size = CGSizeMake(self.view.frame.size.width, 200);
    
    [GKCover transparentCoverFrom:self.view content:blueView animated:YES];
}

// 半透明遮罩-中间弹窗
- (IBAction)windowCenterTranslucentCover:(id)sender{
    UIView *greenView = [UIView new];
    greenView.backgroundColor = [UIColor greenColor];
    greenView.gk_size = CGSizeMake(240, 160);
    
    [GKCover translucentWindowCenterCoverContent:greenView animated:YES];
}

// 全透明遮罩-中间弹窗
- (IBAction)windowCenterTransparentCover:(id)sender {
    UIView *grayView = [UIView new];
    grayView.backgroundColor = [UIColor grayColor];
    grayView.gk_size = CGSizeMake(240, 160);
    
    [GKCover transparentWindowCenterCoverContent:grayView animated:YES];
}

// 自定义半透明遮罩
- (IBAction)customTranslucentCover:(id)sender {
    GKCover *cover = [GKCover translucentCoverWithTarget:self action:@selector(hidden)];
    cover.alpha = 0.3;
    cover.frame = self.view.bounds;
    [self.view addSubview:cover];
    self.cover = cover;
    
    UIView *customView = [UIView new];
    customView.backgroundColor = [UIColor purpleColor];
    customView.frame = CGRectMake(0, KScreenH, KScreenW, 200);
    [self.view addSubview:customView];
    self.customView = customView;
    
    [UIView animateWithDuration:0.25 animations:^{
        customView.gk_y = KScreenH - 200;
    }];
}

// 自定义全透明遮罩
- (IBAction)customTransparentCover:(id)sender {
    GKCover *cover = [GKCover transparentCoverWithTarget:self action:@selector(hidden)];
    cover.frame = self.view.bounds;
    [self.view addSubview:cover];
    self.cover = cover;
    
    UIView *customView = [UIView new];
    customView.backgroundColor = [UIColor purpleColor];
    customView.frame = CGRectMake((KScreenW -  300)/2, 0, 300, 200);
    [self.view addSubview:customView];
    self.customView = customView;
    
    [UIView animateWithDuration:0.25 animations:^{
        customView.gk_y = (KScreenH - 200)/2;
    }];
}

- (void)hidden{
    [UIView animateWithDuration:0.25 animations:^{
        self.customView.gk_y = KScreenH;
    }completion:^(BOOL finished) {
        [self.cover removeFromSuperview];
        [self.customView removeFromSuperview];
    }];
}

@end
