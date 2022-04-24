//
//  PiPAVPlayerViewController.m
//  PiPPlayerWithObjc
//
//  Created by 김혜리 on 2022/04/25.
//

#import "PiPAVPlayerViewController.h"
#import <AVKit/AVKit.h>

@interface PiPAVPlayerViewController () <
AVPictureInPictureControllerDelegate
>

@property (nonatomic, retain) AVPictureInPictureController *pipController;

@end

@implementation PiPAVPlayerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.

    [self settingUpPiPController];
}

- (void)settingUpPiPController {
    NSURL *url = [NSURL URLWithString: self.urlString];
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

// MARK: - AVPictureInPictureControllerDelegate for AVPlayer
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
