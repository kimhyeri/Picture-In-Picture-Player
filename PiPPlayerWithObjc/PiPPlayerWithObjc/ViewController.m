//
//  ViewController.m
//  PiPPlayerWithObjc
//
//  Created by 김혜리 on 2022/04/03.
//

#import "ViewController.h"
#import <AVKit/AVKit.h>

@interface ViewController () <
AVPictureInPictureControllerDelegate
>

@property (nonatomic, retain) AVPictureInPictureController *pipController;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self settingUpPiPController];
}

- (void)settingUpPiPController {
    if([AVPictureInPictureController isPictureInPictureSupported]){
        /*
         put avplayer' playerLayer here
         self.pipController = [[AVPictureInPictureController alloc] initWithPlayerLayer: self.playerLayer];
         */
        self.pipController.delegate = self;
    }
}

- (void)pictureInPictureControllerWillStartPictureInPicture:(AVPictureInPictureController *)pictureInPictureController {
    NSLog(@"pictureInPictureControllerWillStartPictureInPicture");
}

- (void)pictureInPictureControllerDidStartPictureInPicture:(AVPictureInPictureController *)pictureInPictureController {
    NSLog(@"pictureInPictureControllerDidStartPictureInPicture");
}

- (void)pictureInPictureController:(AVPictureInPictureController *)pictureInPictureController failedToStartPictureInPictureWithError:(NSError *)error {
    NSLog(@"failedToStartPictureInPictureWithError");
}

- (void)pictureInPictureController:(AVPictureInPictureController *)pictureInPictureController restoreUserInterfaceForPictureInPictureStopWithCompletionHandler:(void (^)(BOOL))completionHandler {
    NSLog(@"restoreUserInterfaceForPictureInPictureStopWithCompletionHandler");
}

- (void)pictureInPictureControllerWillStopPictureInPicture:(AVPictureInPictureController *)pictureInPictureController {
    NSLog(@"pictureInPictureControllerWillStopPictureInPicture");
}

- (void)pictureInPictureControllerDidStopPictureInPicture:(AVPictureInPictureController *)pictureInPictureController {
    NSLog(@"pictureInPictureControllerDidStopPictureInPicture");
}

@end
