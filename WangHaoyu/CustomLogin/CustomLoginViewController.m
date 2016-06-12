//
//  CustomLoginViewController.m
//  WangHaoyu
//
//  Created by haoyu3 on 16/6/10.
//  Copyright © 2016年 haoyu3. All rights reserved.
//

#import "CustomLoginViewController.h"

@interface CustomLoginViewController ()

@end

@implementation CustomLoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor yellowColor];
    [self addCustomView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
    
}

#pragma mark - custom view

- (void)addCustomView {
    
}


- (void)presentLoginViewController:(UIViewController *)viewController finishResponse:(void (^)(id, NSError *))completion {
    
}
@end
