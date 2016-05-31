//
//  AppDelegate.h
//  WangHaoyu
//
//  Created by haoyu3 on 16/5/24.
//  Copyright © 2016年 haoyu3. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <BaiduMapAPI_Base/BMKBaseComponent.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate,BMKGeneralDelegate>


@property (strong, nonatomic) UIWindow *window;
@property (nonatomic ,strong) BMKMapManager *manager;

@end

