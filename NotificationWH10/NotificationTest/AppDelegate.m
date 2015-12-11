//
//  AppDelegate.m
//  NotificationTest
//
//  Created by Nikolay Berlioz on 14.09.15.
//  Copyright (c) 2015 Nikolay Berlioz. All rights reserved.
//

#import "AppDelegate.h"
#import "Goverment.h"
#import "Doctor.h"
#import "Pensioner.h"
#import "Businessman.h"

@interface AppDelegate ()

@property (strong, nonatomic) Goverment* goverment;

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    
    
    /**********  Если дальше этот параметр изменится, придет уведомление   *********/
//    [[NSNotificationCenter defaultCenter] addObserver:self
//                                             selector:@selector(govermentNotification:)
//                                                 name:GovermentTaxLevelDidChangeNotification
//                                               object:nil];


    self.goverment = [[Goverment alloc] init];  //по-моему делает какой то объект класса аппдилигейт(непонятно его имя, да оно и не нужно)
    
    
    Doctor *doctor1 = [[Doctor alloc] init];
    Businessman *buisinessman = [[Businessman alloc] init];
    Pensioner *pensioner = [[Pensioner alloc] init];
    
    doctor1.salary = 1000;
    doctor1.averagePrice = 10.f;
    
    buisinessman.taxLevel = 5.f;
    buisinessman.averagePrice = 10.f;
    
    pensioner.pension = 500.f;
    pensioner.averagePrice = 10.f;
    
    NSLog(@"************   Sum all objects level up!   ****************");
    self.goverment.taxLevel = 5.5f;
    self.goverment.salary = 1100.f;
    self.goverment.pension = 550.f;
    self.goverment.averagePrice = 15.f;
    NSLog(@"-----------------------------------------------------------");

    NSLog(@"************   Sum all objects level down!   **************");
    self.goverment.taxLevel = 4.8f;
    self.goverment.salary = 950.f;
    self.goverment.pension = 490.f;
    self.goverment.averagePrice = 9.5f;
    NSLog(@"-----------------------------------------------------------");

    
    return YES;
}

//- (void) govermentNotification: (NSNotification*) notification
//{
//    NSLog(@"govermentNotification userInfo = %@", notification.userInfo);
//}



- (void) dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
