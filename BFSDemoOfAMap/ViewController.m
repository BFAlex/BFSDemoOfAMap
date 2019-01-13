//
//  ViewController.m
//  BFSDemoOfAMap
//
//  Created by Alex BF on 2019/1/13.
//  Copyright © 2019年 Alex BF. All rights reserved.
//

#import "ViewController.h"
#import <AMapNaviKit/AMapNaviKit.h>

@interface ViewController () <AMapNaviDriveManagerDelegate, MAMapViewDelegate, AMapNaviDriveViewDelegate>
@property (nonatomic, strong) AMapNaviDriveManager *naviDriveManager;
@property (nonatomic, strong) MAMapView *mapView;
@property (nonatomic, strong) AMapNaviDriveView *naviDriveView;

@end

@implementation ViewController

#pragma mark -

//- (AMapNaviDriveManager *)naviDriveManager {
//    
//    AMapNaviDriveManager *manager = [AMapNaviDriveManager sharedInstance];
//    if (!manager.delegate) {
//        manager.delegate = self;
//    }
//    
//    return manager;
//}
//
//- (MAMapView *)mapView {
//    
//    if (!_mapView) {
//        _mapView = [[MAMapView alloc] initWithFrame:self.view.bounds];
//        _mapView.delegate = self;
//        [self.view addSubview:_mapView];
//    }
//    
//    return _mapView;
//}

- (void)configureDefault {
    //
    self.naviDriveManager = [AMapNaviDriveManager sharedInstance];
    self.naviDriveManager.delegate = self;
    //
    self.mapView = [[MAMapView alloc] initWithFrame:self.view.bounds];
    self.mapView.delegate = self;
    [self.view addSubview:self.mapView];
    //
    self.naviDriveView = [[AMapNaviDriveView alloc] initWithFrame:self.view.bounds];
    self.naviDriveView.autoresizingMask = UIViewAutoresizingFlexibleWidth|UIViewAutoresizingFlexibleHeight;
    self.naviDriveView.delegate = self;
    [self.view addSubview:self.naviDriveView];
}

#pragma mark -

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self configureDefault];
}

- (void)viewDidAppear:(BOOL)animated {
    
    [self calculateDriveRoute];
}

- (void)dealloc {
    
    [self.naviDriveManager stopNavi];
    
}

#pragma mark -

- (void)calculateDriveRoute {
    
    AMapNaviPoint *startPoint = [AMapNaviPoint locationWithLatitude:39.99 longitude:116.47];
    AMapNaviPoint *endPoint = [AMapNaviPoint locationWithLatitude:30.90 longitude:100.32];
    
    [self.naviDriveManager calculateDriveRouteWithStartPoints:@[startPoint]
                                                    endPoints:@[endPoint]
                                                    wayPoints:nil
                                              drivingStrategy:AMapNaviDrivingStrategyMultipleAvoidCostAndCongestion];
}

#pragma mark - MAMapViewDelegate


#pragma mark - AMapNaviDriveManagerDelegate

- (void)driveManager:(AMapNaviDriveManager *)driveManager onCalculateRouteSuccessWithType:(AMapNaviRoutePlanType)type {
    NSLog(@"onCalculateRouteSuccessWithType:%ld", (long)type);
    // 开始导航
//    [self.naviDriveManager startGPSNavi];
    // 规划路线列表
    AMapNaviRoute *curRoute = driveManager.naviRoute;
    NSLog(@"路径的途经点坐标(%lu):%@", driveManager.naviRoute.wayPoints.count, driveManager.naviRoute.wayPoints);
}

- (void)driveManager:(AMapNaviDriveManager *)driveManager onCalculateRouteFailure:(NSError *)error {
    NSLog(@"onCalculateRouteFailure:%@", error.localizedDescription);
    
}

#pragma mark - AMapNaviDriveViewDelegate


@end
