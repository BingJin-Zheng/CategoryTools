//
//  UINavigationController+Category.h
//  CategoryTools
//
//  Created by 郑冰津 on 2017/7/7.
//  Copyright © 2017年 IceGod. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UINavigationController (Category)

+ (instancetype)defaultNAVVC:(UIViewController *)rootVC;
- (void)push:(UIViewController *)VC;
- (void)popVC;
- (void)popVC:(Class)specifiedVC;
- (void)popRootVC;

- (void)presentVC:(UIViewController *)VC;
- (void)dismissVC;

///使右滑返回失效
- (void)popGestureFailure;


///左边和右边的item各自最多3个
- (void)leftBarItem:(NSArray <NSString *> *)titles color:(UIColor *)titleColor handle:(void (^)(NSInteger tag))handle;
- (void)rightBarItem:(NSArray <NSString *> *)titles color:(UIColor *)titleColor handle:(void (^)(NSInteger tag))handle;
- (void)leftBarItem:(NSArray <NSString *>*)imageNames handle:(void (^)(NSInteger tag))handle;
- (void)rightBarItem:(NSArray <NSString *>*)imageNames handle:(void (^)(NSInteger tag))handle;


@end





