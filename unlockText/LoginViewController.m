//
//  LoginViewController.m
//  unlockText
//
//  Created by 尹星 on 2017/10/26.
//  Copyright © 2017年 尹星. All rights reserved.
//

#import "LoginViewController.h"

@interface LoginViewController ()

@property (weak, nonatomic) IBOutlet UITextField *userNameTF;
@property (weak, nonatomic) IBOutlet UITextField *passwordTF;


@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
}

- (IBAction)loginButtonPressed:(UIButton *)sender {
    [self.view endEditing:YES];
    if (![self.userNameTF.text isEqualToString:@""] && ![self.passwordTF.text isEqualToString:@""]) {
        [[NSNotificationCenter defaultCenter] postNotificationName:@"loginSuccess" object:nil];
        //登录成功，记录userInfo（加密保存或者保存至keychain）
        [[NSUserDefaults standardUserDefaults] setObject:@(YES) forKey:@"UserInfo"];
    }
}

@end
