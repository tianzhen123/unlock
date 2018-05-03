//
//  HomeViewController.m
//  unlockText
//
//  Created by 尹星 on 2017/10/26.
//  Copyright © 2017年 尹星. All rights reserved.
//

#import "HomeViewController.h"
#import "GesturesViewController.h"

@interface HomeViewController ()

@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"HOME";
}

- (IBAction)buttonPressed:(UIButton *)sender {
    GesturesViewController *gesturesVC = [[GesturesViewController alloc] init];
    gesturesVC.settingGesture = YES;
    [self presentViewController:gesturesVC animated:YES completion:nil];
}


@end
