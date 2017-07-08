//
//  UIApplication+Category.m
//  CategoryTools
//
//  Created by 郑冰津 on 2017/7/8.
//  Copyright © 2017年 IceGod. All rights reserved.
//

#import "UIApplication+Category.h"

@implementation UIApplication (Category)


- (void)appChangeRootVC:(UIViewController *)VCOfNew completion:(void(^)(BOOL finished))finishedBlock{
    // options是动画选项
    [UIView transitionWithView:[UIApplication sharedApplication].keyWindow duration:0.5f options:UIViewAnimationOptionTransitionCrossDissolve animations:^{
        BOOL oldState = [UIView areAnimationsEnabled];
        [UIView setAnimationsEnabled:NO];
        [UIApplication sharedApplication].keyWindow.rootViewController = VCOfNew;
        [UIView setAnimationsEnabled:oldState];
    } completion:finishedBlock];
}

@end
