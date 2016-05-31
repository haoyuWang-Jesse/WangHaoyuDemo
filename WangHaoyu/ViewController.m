//
//  ViewController.m
//  WangHaoyu
//
//  Created by haoyu3 on 16/5/24.
//  Copyright © 2016年 haoyu3. All rights reserved.
//

#import "ViewController.h"


@interface ViewController ()

@property (nonatomic, strong) BMKMapView *mapView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.view.backgroundColor = [UIColor whiteColor];
//    self.mapView = [[BMKMapView alloc] initWithFrame:CGRectMake(0, 20, self.view.frame.size, <#CGFloat height#>)]
    self.mapView = [BMKMapView new];
    self.mapView.mapType = BMKMapTypeStandard;
    self.mapView.zoomLevel = 5;
    [self.mapView setCenterCoordinate:CLLocationCoordinate2DMake(35.718, 111.581)];
    self.view = self.mapView;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    self.mapView.delegate = self;
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    self.mapView.delegate = nil;
}

@end
