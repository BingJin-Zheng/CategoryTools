//
//  UIApplication+Category.h
//  CategoryTools
//
//  Created by 郑冰津 on 2017/7/8.
//  Copyright © 2017年 IceGod. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIApplication (Category)

///修改跟rootVC
- (void)appChangeRootVC:(UIViewController *)VCOfNew completion:(void(^)(BOOL finished))finishedBlock;

@end
