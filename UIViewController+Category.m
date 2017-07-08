//
//  UIViewController+Category.m
//  CategoryTools
//
//  Created by 郑冰津 on 2017/7/8.
//  Copyright © 2017年 IceGod. All rights reserved.
//

#import "UIViewController+Category.h"

@implementation UIViewController (Category)

- (void)navigationSettings{
    self.view.backgroundColor=[UIColor whiteColor];
    ///下面这个属性设置为NO的时候(不透明的导航栏),没有高斯模糊效果,此时会向下方移动64的距离
    self.navigationController.navigationBar.translucent = NO;
    ///下面这个属性,当设置为不透明的导航栏的时候,需要把属性设置成为YES,充满全屏
    self.extendedLayoutIncludesOpaqueBars = YES;
    ///这个属性默认是UIRectEdgeAll,充满全屏
    self.edgesForExtendedLayout = UIRectEdgeAll;
    ///当前此界面有UIScrollView被加载的时候,把此属性设置为NO,充满全屏
    self.automaticallyAdjustsScrollViewInsets = NO;
    ///下面这个属性设置为NO的时候(不透明的底部标签栏),没有高斯模糊效果.设置为YES或者NO,对self.view都没有任何影响效果,总是占据49的距离
    self.navigationController.tabBarController.tabBar.translucent = NO;
    ///这一句不注明,会因为按下home键,再次启动APP信号栏会有黑色的问题!,因为NAV本身是黑色的
    [self.navigationController.view setBackgroundColor:[UIColor whiteColor]];
}

- (void)push:(UIViewController *)VC{
    dispatch_async(dispatch_get_main_queue(), ^{
        if (![VC isKindOfClass:[UIViewController class]]) return;
        VC.hidesBottomBarWhenPushed=YES;
        if (!self.navigationController) return;
        [self.navigationController pushViewController:VC animated:YES];
    });
}

- (void)popVC{
    dispatch_async(dispatch_get_main_queue(), ^{
        if (!self.navigationController || self.navigationController.viewControllers.count<=1) return;
        [self.navigationController popViewControllerAnimated:YES];
    });
}

- (void)popVC:(Class)specifiedVC{
    if (!self.navigationController || self.navigationController.viewControllers.count<=1) return;
    NSArray *arrVC = self.navigationController.viewControllers;
    for (NSInteger i = arrVC.count; i>=0; i--) {
        UIViewController *VC = arrVC[i];
        if ([NSStringFromClass(VC.class) isEqualToString:NSStringFromClass(specifiedVC)]) {
            dispatch_async(dispatch_get_main_queue(), ^{
                if (i==1) {
                    self.hidesBottomBarWhenPushed=NO;
                }
                [self.navigationController popToViewController:VC animated:YES];
            });
            break;
        }
    }
}

- (void)popRootVC{
    dispatch_async(dispatch_get_main_queue(), ^{
        if (!self.navigationController || self.navigationController.viewControllers.count<=1) return;
        self.navigationController.viewControllers.firstObject.hidesBottomBarWhenPushed=NO;
        [self.navigationController popViewControllerAnimated:YES];
    });
}

- (void)presentVC:(UIViewController *)VC{
    [[UIApplication sharedApplication].keyWindow endEditing:YES];
    UIViewController *self_VC =self.navigationController?self.navigationController:self;
    VC.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
    [self_VC presentViewController:VC animated:YES completion:NULL];
}
- (void)dismissVC{
    UIViewController *VC =self.navigationController?self.navigationController:self;
    [VC dismissViewControllerAnimated:YES completion:NULL];
}

///左边和右边的item各自最多3个
- (void)leftBarItem:(NSArray <NSString *> *)titles color:(UIColor *)titleColor handle:(void (^)(NSInteger tag))handle{
    
}
- (void)rightBarItem:(NSArray <NSString *> *)titles color:(UIColor *)titleColor handle:(void (^)(NSInteger tag))handle{
    
}
- (void)leftBarItem:(NSArray <NSString *>*)imageNames handle:(void (^)(NSInteger tag))handle{
    
}
- (void)rightBarItem:(NSArray <NSString *>*)imageNames handle:(void (^)(NSInteger tag))handle{
    
}

@end
