//
//  AppDelegate.m
//  PiPPlayerWithObjc
//
//  Created by 김혜리 on 2022/04/03.
//

#import "AppDelegate.h"
#import "AVFoundation/AVFoundation.h"
#import "ViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.

    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.navigationController = [[UINavigationController alloc] init];
    ViewController *vc = [[ViewController alloc] init];
    self.navigationController.viewControllers = @[vc];
    self.window.rootViewController = self.navigationController;
    [self.window makeKeyAndVisible];

    [[AVAudioSession sharedInstance] setCategory:AVAudioSessionCategoryPlayback error:nil];
    
    return YES;
}

@end
