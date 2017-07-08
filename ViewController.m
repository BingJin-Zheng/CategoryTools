//
//  ViewController.m
//  CategoryTools
//
//  Created by 郑冰津 on 2017/7/7.
//  Copyright © 2017年 IceGod. All rights reserved.
//

#import "ViewController.h"
#import "UINavigationController+Category.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    UIViewController *aa=[UIViewController new];
    aa.view.backgroundColor = [UIColor redColor];
    [self.navigationController appChangeRootVC:aa completion:^(BOOL finished) {
        
    }];
}

@end
