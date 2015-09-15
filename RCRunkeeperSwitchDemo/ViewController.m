//
//  ViewController.m
//  RCRunkeeperSwitchDemo
//
//  Created by Chao Ruan on 15/09/2015.
//  Copyright (c) 2015 Chao Ruan. All rights reserved.
//

#import "ViewController.h"
#import "RCRunkeeperSwitch.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent];
    self.navigationController.navigationBar.barTintColor = [UIColor colorWithRed:252.0/255.0 green:182.0/255.0 blue:54.0/255.0 alpha:1.0];
    
    RCRunkeeperSwitch *runkeeperSwitch = [[RCRunkeeperSwitch alloc]initWithLeftTitle:@"Feed" rightTitle:@"Leaderboard"];
    runkeeperSwitch.backgroundColor = [UIColor colorWithRed:229.0/255.0 green:163.0/255.0 blue:48.0/255.0 alpha:1.0];
    runkeeperSwitch.selectedBackgroundColor = [UIColor whiteColor];
    runkeeperSwitch.tintColor = [UIColor whiteColor];
    runkeeperSwitch.selectedTitleColor = [UIColor colorWithRed:255.0/255.0 green:196.0/255.0 blue:92.0/255.0 alpha:1.0];
    runkeeperSwitch.titleFont = [UIFont fontWithName:@"HelveticaNeue-Medium" size:13];
    runkeeperSwitch.frame = CGRectMake(30, 40, 200, 30);
    self.navigationItem.titleView = runkeeperSwitch;
    
    RCRunkeeperSwitch *runkeeperSwitch2 = [[RCRunkeeperSwitch alloc] init];
    runkeeperSwitch2.leftTitle = @"Weekly";
    runkeeperSwitch2.rightTitle = @"Monthly";
    runkeeperSwitch2.backgroundColor = [UIColor colorWithRed:239.0/255.0 green:95.0/255.0 blue:49.0/255.0 alpha:1.0];
    runkeeperSwitch2.selectedBackgroundColor = [UIColor whiteColor];
    runkeeperSwitch2.titleColor = [UIColor whiteColor];
    runkeeperSwitch2.selectedTitleColor = [UIColor colorWithRed:239.0/255.0 green:95.0/255.0 blue:49.0/255.0 alpha:1.0];
    runkeeperSwitch2.titleFont = [UIFont fontWithName:@"HelveticaNeue-Medium" size:13];
    runkeeperSwitch2.frame = CGRectMake(50, 84, CGRectGetWidth(self.view.bounds) - 100, 30);
    runkeeperSwitch2.autoresizingMask = UIViewAutoresizingFlexibleWidth;
    [self.view addSubview:runkeeperSwitch2];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
