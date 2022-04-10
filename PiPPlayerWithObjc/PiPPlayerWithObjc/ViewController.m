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
    NSURL *url = [NSURL URLWithString: @"https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4"];
    AVPlayer *player = [[AVPlayer alloc] initWithURL: url];
    AVPlayerLayer *playerLayer = [[AVPlayerLayer alloc] init];
    [playerLayer setFrame: self.view.bounds];
    [playerLayer setPlayer: player];
    [self.view.layer addSublayer: playerLayer];
    [player play];
    
    if([AVPictureInPictureController isPictureInPictureSupported]){
        self.pipController = [[AVPictureInPictureController alloc] initWithPlayerLayer: playerLayer];
        self.pipController.delegate = self;
        self.pipController.canStartPictureInPictureAutomaticallyFromInline = YES;
    } else {
        NSLog(@"not supported");
    }
}

// MARK: - AVPictureInPictureControllerDelegate
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
