//
//  ViewController.m
//  WangHaoyu
//
//  Created by haoyu3 on 16/5/24.
//  Copyright © 2016年 haoyu3. All rights reserved.
//

#import "ViewController.h"
#import "UMCommunity.h"


@interface ViewController ()

@property (nonatomic, strong) BMKMapView *mapView;
@property (nonatomic, strong) BMKLocationService *localService;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.view.backgroundColor = [UIColor redColor];
    /*
    self.mapView = [[BMKMapView alloc] initWithFrame:CGRectMake(0, 20, self.view.frame.size.width, self.view.frame.size.height - 20)];
    self.mapView = [BMKMapView new];
    self.mapView.mapType = BMKMapTypeStandard;
    self.mapView.zoomLevel = 16;
    [self.mapView setCenterCoordinate:CLLocationCoordinate2DMake(36.718, 112.581)];
    self.mapView.showsUserLocation = YES;
    [self.mapView setTrafficEnabled:YES]; //显示热力图
    self.view = self.mapView;
    [self startLocatePosition];
     */
    //show UMCommunity
//    [self showUMSocialPage];
    [self testAddButton];
    
}

- (void)startLocatePosition {
    self.localService = [BMKLocationService new];
    [self.localService startUserLocationService];
    _mapView.showsUserLocation = NO;//先关闭显示的定位图层
    _mapView.userTrackingMode = BMKUserTrackingModeFollowWithHeading;//设置定位的状态
    _mapView.showsUserLocation = YES;//显示定位图层
    
}

#pragma mark <UMCommunity>

- (void)showUMSocialPage {
    NSLog(@"XXXXX");
    UINavigationController *communityViewController = [UMCommunity getFeedsModalViewController];
//    [self presentModalViewController:communityViewController animated:YES];
//    UIViewController *communityViewController = [UMCommunity getFeedsViewController];
//    [self.navigationController pushViewController:communityViewController animated:YES];
    [self presentViewController:communityViewController animated:YES completion:^{
        NSLog(@"into UMCommunity success!");
    }];
}

- (void)testAddButton {
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = CGRectMake(100, 200, 100, 100);
    [button setTitle:@"跳转" forState:UIControlStateNormal];
    [button setBackgroundColor:[UIColor yellowColor]];
    [button addTarget:self action:@selector(showUMSocialPage) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    self.mapView.delegate = self;
    self.localService.delegate = self;
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    self.mapView.delegate = nil;
    self.localService.delegate = nil;
    
}


#pragma mark <localService delegate>

- (void)didUpdateUserHeading:(BMKUserLocation *)userLocation {
    NSLog(@"heading is %@",userLocation.heading);
//    NSLog(@"用户当前位置====%@",self.mapView.userLocation);
//    BMKCoordinateRegion region =
//    self.mapView setRegion:<#(BMKCoordinateRegion)#> animated:<#(BOOL)#>
}

- (void)didUpdateBMKUserLocation:(BMKUserLocation *)userLocation {
  NSLog(@"didUpdateUserLocation lat %f,long %f",userLocation.location.coordinate.latitude,userLocation.location.coordinate.longitude);
    [self.mapView updateLocationData:userLocation];
}

@end

