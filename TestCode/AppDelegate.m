//
//  AppDelegate.m
//  TestCode
//
//  Created by Piyush on 15/11/16.
//  Copyright © 2016 Kahuna Systems. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
//    NSDictionary *dict = [[NSDictionary alloc] initWithObjectsAndKeys:@"1", @"Id", @"Alex", @"Name", nil];
//    NSArray *a = [[NSArray alloc] initWithObjects:dict, nil];
//    NSData *data = [NSKeyedArchiver archivedDataWithRootObject:a];
    NSString *responseString = @"[{\"Id\":\"5\",\"Name\":\"AMark\"}, {\"Id\":\"1\",\"Name\":\"Karta\"}]";
    NSData *data = [responseString dataUsingEncoding:NSUTF8StringEncoding];
    [self getList:data];


    return YES;
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

-(void)getList:(NSData *)response
{
    UIButton *b1 = [UIButton buttonWithType:UIButtonTypeCustom];
    b1.tag = 1;
    NSArray *_ButtonArray =[[NSArray alloc]initWithObjects:b1, nil];
    
    NSArray* Array = [NSJSONSerialization JSONObjectWithData:response options:NSJSONReadingAllowFragments error:nil];
    
    NSLog(@"%@", Array);
    for (UIButton *button  in _ButtonArray) {
        NSLog(@"the tag of button is %ld",(long)button.tag);
        for (NSDictionary* dict in Array)
        {
            if ([[dict objectForKey:@"Id"] intValue] == button.tag)
            {
                [button setTitle:[dict objectForKey:@"Name"] forState:UIControlStateNormal];
                NSLog(@"the Id is %@",[dict objectForKey:@"Id"]);
            }
        }
    }
}


@end
