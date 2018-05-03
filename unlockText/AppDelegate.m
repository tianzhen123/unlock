//
//  AppDelegate.m
//  unlockText
//
//  Created by 尹星 on 2017/10/26.
//  Copyright © 2017年 尹星. All rights reserved.
//

#import "AppDelegate.h"
#import "LoginViewController.h"
#import "HomeViewController.h"
#import "TouchIDViewController.h"
#import "UnlockViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    self.window.backgroundColor = [UIColor whiteColor];
    
    //未输入过密码，跳转登录界面
    if (![[[NSUserDefaults standardUserDefaults] objectForKey:@"UserInfo"] boolValue]) {
        [self p_windowRootControllerWithLogin];
    }else {
        [self p_windowRootControllerWithUnlock];
    }
    
    //登录成功
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(p_loginSuccess) name:@"loginSuccess" object:nil];
    //
    //已登录，是否开启TouchID认证
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(p_touchIDSuccess) name:@"OpenTouchIDSuccess" object:nil];
    
    //已登录，通过TouchID认证
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(p_touchIDLoginSuccess) name:@"UnlockLoginSuccess" object:nil];
    
    //已登录，未通过TouchID认证
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(p_touchIDFailed) name:@"touchIDFailed" object:nil];
    
    return YES;
}

- (void)p_touchIDFailed
{
    [self p_windowRootControllerWithLogin];
}

- (void)p_loginSuccess
{
    [self p_windowRootControllerWithUnlock];
}

- (void)p_touchIDSuccess
{
    [self p_windowRootControllerWithHome];
}

- (void)p_touchIDLoginSuccess
{
    [self p_windowRootControllerWithHome];
}

//homeVC为rootController
- (void)p_windowRootControllerWithHome
{
    HomeViewController *homeVC = [[HomeViewController alloc] init];
    UINavigationController *navigationController = [[UINavigationController alloc] initWithRootViewController:homeVC];
    self.window.rootViewController = navigationController;
    [self.window makeKeyAndVisible];
}

//loginVC为rootController
- (void)p_windowRootControllerWithLogin
{
    LoginViewController *loginVC = [[LoginViewController alloc] init];
    self.window.rootViewController = loginVC;
    [self.window makeKeyAndVisible];
}

//touchIDVC为rootController
- (void)p_windowRootControllerWithTouchID
{
    TouchIDViewController *touchIDVC = [[TouchIDViewController alloc] init];
    self.window.rootViewController = touchIDVC;
    [self.window makeKeyAndVisible];
}

//unlockVC为rootController
- (void)p_windowRootControllerWithUnlock
{
    UnlockViewController *unlockVC = [[UnlockViewController alloc] init];
    self.window.rootViewController = unlockVC;
    [self.window makeKeyAndVisible];
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


@end
