//
//  AppDelegate.m
//  FuncsTestProject
//
//  Created by 刘云 on 30/5/18.
//  Copyright © 2018年 王康康. All rights reserved.
//

#import "AppDelegate.h"

#import "WindowWithStatusBarUnderlay.h"
#import "Utilities.h"
//首页VC
#import "WKAHomePageViewController.h"


@interface AppDelegate ()

@end

@implementation AppDelegate
{
    WindowWithStatusBarUnderlay *_window;

}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {

    //使用这个UIWindow子类需要将状态栏置为不透明
    _window                 = [[WindowWithStatusBarUnderlay alloc]initWithFrame:[[UIScreen mainScreen] bounds]];

    _window.backgroundColor = [UIColor whiteColor];
    
    //ASDK HomeVC & ASDK Nav
    WKAHomePageViewController * wkaHomepageVC = [WKAHomePageViewController new];
    ASNavigationController * wkaHomeNavCtrl   = [[ASNavigationController alloc]initWithRootViewController:wkaHomepageVC];
    wkaHomeNavCtrl.tabBarItem                 = [[UITabBarItem alloc]initWithTitle:@"Home" image:[UIImage imageNamed:@"home"] tag:0];
    wkaHomeNavCtrl.hidesBarsOnSwipe           = YES;
    //...
    
    ASTabBarController * tabBarController     = [[ASTabBarController alloc]init];
    tabBarController.viewControllers          = @[wkaHomeNavCtrl];
//    tabBarController.delegate = self;
    [[UITabBar appearance] setTintColor:[UIColor darkBlueColor]];
    _window.rootViewController = tabBarController;
    [_window makeKeyAndVisible];
    

    // Nav Bar appearance
    NSDictionary *attributes = @{NSForegroundColorAttributeName:[UIColor whiteColor]};
    [[UINavigationBar appearance] setTitleTextAttributes:attributes];
    [[UINavigationBar appearance] setBarTintColor:[UIColor darkBlueColor]];
    [[UINavigationBar appearance] setTranslucent:NO];

    
    
    return YES;
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
