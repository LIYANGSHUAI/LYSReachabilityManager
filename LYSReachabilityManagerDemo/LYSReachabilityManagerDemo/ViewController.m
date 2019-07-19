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

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    LYSIF_NETWORK_BEGIN
    
    NSLog(@"有网络!!!");
    
    LYSIF_NETWORK_END
}


@end
