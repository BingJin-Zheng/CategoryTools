//
//  UINavigationController+Category.m
//  CategoryTools
//
//  Created by 郑冰津 on 2017/7/7.
//  Copyright © 2017年 IceGod. All rights reserved.
//

#import "UINavigationController+Category.h"
#import <objc/message.h>
#import <objc/runtime.h>

@implementation UINavigationController (Category)

+ (instancetype)defaultNAVVC:(UIViewController *)rootVC{
    if (![rootVC isKindOfClass:[UIViewController class]]) return nil;
    return [[UINavigationController alloc]initWithRootViewController:rootVC];
}

- (void)push:(UIViewController *)VC{
    if (![VC isKindOfClass:[UIViewController class]]) return;
    if ([VC isKindOfClass:self.class]) return;
    dispatch_async(dispatch_get_main_queue(), ^{
        VC.hidesBottomBarWhenPushed=YES;
        [self pushViewController:VC animated:YES];
    });
}

- (void)popVC{
    if (self.viewControllers.count<=1) return;
    dispatch_async(dispatch_get_main_queue(), ^{
        NSArray *arrVC = self.viewControllers;
        NSInteger indexOfNow = [arrVC indexOfObject:arrVC.lastObject];
        if (indexOfNow==1) self.hidesBottomBarWhenPushed=NO;
        [self popViewControllerAnimated:YES];
    });
}

- (void)popVC:(Class)specifiedVC{
    if (self.viewControllers.count<=1) return;
    NSArray *arrVC = self.viewControllers;
    for (NSInteger i = arrVC.count; i>=0; i--) {
        UIViewController *VC = arrVC[i];
        if ([NSStringFromClass(VC.class) isEqualToString:NSStringFromClass(specifiedVC)]) {
            dispatch_async(dispatch_get_main_queue(), ^{
                if (i==1) {
                    self.hidesBottomBarWhenPushed=NO;
                }
                [self popToViewController:VC animated:YES];
            });
            break;
        }
    }
}
- (void)popRootVC{
    if (self.viewControllers.count<=1) return;
    dispatch_async(dispatch_get_main_queue(), ^{
        self.hidesBottomBarWhenPushed=NO;
        [self popToRootViewControllerAnimated:YES];
    });
}

- (void)presentVC:(UIViewController *)VC{
    [[UIApplication sharedApplication].keyWindow endEditing:YES];
    VC.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
    [self.navigationController presentViewController:VC animated:YES completion:NULL];
}
- (void)dismissVC{
    [self dismissViewControllerAnimated:YES completion:NULL];
}

- (void)popGestureFailure{
    self.interactivePopGestureRecognizer.enabled = NO;
}

- (void)leftBarItem:(NSArray <NSString *> *)titles color:(UIColor *)titleColor handle:(void (^)(NSInteger tag))handle{
    if (self.viewControllers.count<=0) return;
    NSAssert(titles.count<=3, @"最多3个值");
    NSMutableArray <UIBarButtonItem *>*items = @[].mutableCopy;
    for (NSInteger i = 0; i<titles.count; i++) {
        UIBarButtonItem *barItem = [[UIBarButtonItem alloc]initWithTitle:titles[i] style:UIBarButtonItemStylePlain target:self action:@selector(_leftBarClickAction:)];
        [barItem setTitleTextAttributes:@{NSForegroundColorAttributeName:titleColor} forState:UIControlStateNormal];
        barItem.tag = 11111+i;
        if (handle) {
            
        }
        [items addObject:barItem];
    }
    self.topViewController.navigationItem.leftBarButtonItems = items;
}

- (void)rightBarItem:(NSArray <NSString *> *)titles color:(UIColor *)titleColor handle:(void (^)(NSInteger tag))handle{
    if (self.viewControllers.count<=0) return;
    NSAssert(titles.count<=3, @"最多3个值");
    NSMutableArray <UIBarButtonItem *>*items = @[].mutableCopy;
    for (NSInteger i = 0; i<titles.count; i++) {
        UIBarButtonItem *barItem = [[UIBarButtonItem alloc]initWithTitle:titles[i] style:UIBarButtonItemStylePlain target:self action:@selector(_rightBarClickAction:)];
        [barItem setTitleTextAttributes:@{NSForegroundColorAttributeName:titleColor} forState:UIControlStateNormal];
        barItem.tag = 111111+i;
        if (handle) {
            
        }
        [items addObject:barItem];
    }
    self.topViewController.navigationItem.rightBarButtonItems = items;
}

- (void)_leftBarClickAction:(UIBarButtonItem *)barItem{
    
//    if (handle) handle(barItem.tag-11110);
}
- (void)_rightBarClickAction:(UIBarButtonItem *)barItem{
    
//    if (handle) handle(barItem.tag-111110);
}

- (void)leftBarItem:(NSArray <NSString *>*)imageNames handle:(void (^)(NSInteger tag))handle{
    if (self.viewControllers.count<=0) return;
    NSAssert(imageNames.count<=3, @"最多3个值");
    NSMutableArray <UIBarButtonItem *>*items = @[].mutableCopy;
    for (NSInteger i = 0; i<imageNames.count; i++) {
        UIImage *image = [[UIImage imageNamed:imageNames[i]] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        UIBarButtonItem *barItem = [[UIBarButtonItem alloc]initWithImage:image style:UIBarButtonItemStylePlain  target:self action:@selector(_leftBarClickAction:)];
        barItem.tag = 11111+i;
        if (handle) {
            
        }
        [items addObject:barItem];
    }
    self.topViewController.navigationItem.leftBarButtonItems = items;
}
- (void)rightBarItem:(NSArray <NSString *>*)imageNames handle:(void (^)(NSInteger tag))handle{
    if (self.viewControllers.count<=0) return;
    NSAssert(imageNames.count<=3, @"最多3个值");
    NSMutableArray <UIBarButtonItem *>*items = @[].mutableCopy;
    for (NSInteger i = 0; i<imageNames.count; i++) {
        UIImage *image = [[UIImage imageNamed:imageNames[i]] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        UIBarButtonItem *barItem = [[UIBarButtonItem alloc]initWithImage:image style:UIBarButtonItemStylePlain target:self action:@selector(_rightBarClickAction:)];
        barItem.tag = 111111+i;
        if (handle) {
           
        }
        [items addObject:barItem];
    }
    self.topViewController.navigationItem.rightBarButtonItems = items;
}


@end




