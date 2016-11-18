//
//  AppDelegate.m
//  BarAnimation
//
//  Created by zwz on 2016/11/16.
//  Copyright © 2016年 赵伟争. All rights reserved.
//

#import "AppDelegate.h"
#import "MessageViewController.h"
#import "DiscoverViewController.h"
#import "MineViewController.h"

#define RGB(r,g,b) [UIColor colorWithRed:r/255.0f green:g/255.0f blue:b/255.0f alpha:1]
@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    //创建UITabBarController控制器
    UITabBarController *tabVc = [UITabBarController new];
    //创建第一个控制器
    MessageViewController *firstVc = [MessageViewController new];
    //设置第一个控制器的tabBarItem的样式
    //如果图片出现和原有样子较大的差别，那么设置为不被渲染
    //UIImage *selectedImage = [UIImage imageNamed:@"icon_home_home"];
    //selectedImage = [selectedImage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    firstVc.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"首页" image:[UIImage imageNamed:@"icon_home_home_gray" ] selectedImage:[UIImage imageNamed:@"icon_home_home"]];
    //firstVc.tabBarItem.badgeValue=@"123";
    //将视图控制器添加到导航控制器中
    UINavigationController *n1 = [[UINavigationController alloc] initWithRootViewController:firstVc];
    n1.navigationBar.barTintColor = RGB(64, 149, 239);
    //创建第二个视图控制器
    DiscoverViewController *secondVc = [DiscoverViewController new];
    UINavigationController *n2 = [[UINavigationController alloc] initWithRootViewController:secondVc];
    //设置第二个控制器的tabBarItem的样式
    //secondVc.tabBarItem.title=@"报志愿";
    secondVc.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"报志愿" image:[UIImage imageNamed:@"icon_home_daily_gray" ]selectedImage:[UIImage imageNamed:@"icon_home_daily"]];
    
    //创建第三个视图控制器
    MineViewController *thirdVc = [MineViewController new];
    UINavigationController *n3 = [[UINavigationController alloc] initWithRootViewController:thirdVc];
    //设置第三个控制器的tabBarItem的样式
    thirdVc.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"我的" image:[UIImage imageNamed:@"icon_home_people_gray" ]selectedImage:[UIImage imageNamed:@"icon_home_people"]];
    //将所有的视图控制器添加到tabVc的子视图控制器中
    tabVc.viewControllers = @[n1, n2, n3];
    //将tabVc设置为根视图控制器
    self.window.rootViewController = tabVc;
    self.window.backgroundColor = [UIColor whiteColor];
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
