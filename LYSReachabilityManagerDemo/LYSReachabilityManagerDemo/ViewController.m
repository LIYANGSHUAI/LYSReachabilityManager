//
//  ViewController.m
//  LYSReachabilityManagerDemo
//
//  Created by HENAN on 2019/7/19.
//  Copyright © 2019 HENAN. All rights reserved.
//

#import "ViewController.h"
#import "LYSReachabilityManager.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        LYSIF_NETWORK_BEGIN
        
        NSLog(@"有网络!!!");
        
        LYSIF_NETWORK_END
        
        LYSIF_NETWORK_WIFI_BEGIN
            NSLog(@"WIFI!!!");
        LYSIF_NETWORK_WIFI_END
        
        
    });
    
}


@end
