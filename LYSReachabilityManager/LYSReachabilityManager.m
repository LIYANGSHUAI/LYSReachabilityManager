//
//  LYSReachabilityManager.m
//  LYSReachabilityManagerDemo
//
//  Created by HENAN on 2019/7/19.
//  Copyright © 2019 HENAN. All rights reserved.
//

#import "LYSReachabilityManager.h"

@interface LYSReachabilityManager ()
@property (nonatomic, copy) void(^callback)(void);
@property (nonatomic, strong) NSMutableArray *managerArr;
@property (nonatomic,strong, readwrite) AFNetworkReachabilityManager *manager;
@end

@implementation LYSReachabilityManager

+ (instancetype)manager
{
    static LYSReachabilityManager *manager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        manager = [[LYSReachabilityManager alloc] init];
        manager.manager = [AFNetworkReachabilityManager sharedManager];
        [manager.manager startMonitoring];
    });
    return manager;
}

- (NSMutableArray *)managerArr
{
    if (!_managerArr) {
        _managerArr = [NSMutableArray array];
    }
    return _managerArr;
}

- (void)lys_monitorNetwork:(void(^)(void))callback
{
    if (self.manager.networkReachabilityStatus == AFNetworkReachabilityStatusReachableViaWiFi ||
        self.manager.networkReachabilityStatus == AFNetworkReachabilityStatusReachableViaWWAN) {
        callback();
    } else {
        LYSReachabilityManager *manager = [[LYSReachabilityManager alloc] init];
        manager.callback = callback;
        [self.managerArr addObject:manager];
        [[NSNotificationCenter defaultCenter] addObserver:manager selector:@selector(didChangeNotification:) name:AFNetworkingReachabilityDidChangeNotification object:nil];
    }
}

- (void)didChangeNotification:(NSNotification *)notifition
{
    AFNetworkReachabilityStatus status = [notifition.userInfo[AFNetworkingReachabilityNotificationStatusItem] integerValue];
    if (status == AFNetworkReachabilityStatusReachableViaWiFi || status == AFNetworkReachabilityStatusReachableViaWWAN)
    {
        self.callback();
        [[NSNotificationCenter defaultCenter] removeObserver:self];
        [[LYSReachabilityManager manager].managerArr removeObject:self];
    }
}

- (void)lys_monitorNetwork_wifi:(void(^)(void))callback
{
    if (self.manager.networkReachabilityStatus == AFNetworkReachabilityStatusReachableViaWiFi) {
        callback();
    } else {
        LYSReachabilityManager *manager = [[LYSReachabilityManager alloc] init];
        manager.callback = callback;
        [self.managerArr addObject:manager];
        [[NSNotificationCenter defaultCenter] addObserver:manager selector:@selector(didChangeNotification_wifi:) name:AFNetworkingReachabilityDidChangeNotification object:nil];
    }
}

- (void)didChangeNotification_wifi:(NSNotification *)notifition
{
    AFNetworkReachabilityStatus status = [notifition.userInfo[AFNetworkingReachabilityNotificationStatusItem] integerValue];
    if (status == AFNetworkReachabilityStatusReachableViaWiFi)
    {
        self.callback();
        [[NSNotificationCenter defaultCenter] removeObserver:self];
        [[LYSReachabilityManager manager].managerArr removeObject:self];
    }
}

- (BOOL)lys_network
{
    return (self.manager.networkReachabilityStatus == AFNetworkReachabilityStatusReachableViaWiFi ||
            self.manager.networkReachabilityStatus == AFNetworkReachabilityStatusReachableViaWWAN);
}

- (BOOL)lys_network_wifi
{
    return (self.manager.networkReachabilityStatus == AFNetworkReachabilityStatusReachableViaWiFi);
}

@end
