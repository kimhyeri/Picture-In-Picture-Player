//
//  SampleBufferViewController.m
//  PiPPlayerWithObjc
//
//  Created by 김혜리 on 2022/04/19.
//

#import "SampleBufferViewController.h"
#import <AVKit/AVKit.h>

@interface SampleBufferViewController () <
AVPictureInPictureSampleBufferPlaybackDelegate,
AVPictureInPictureControllerDelegate
>

@property (nonatomic, retain) AVPictureInPictureController *pipController;

@end

@implementation SampleBufferViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self settingUpPiPControllerWithSampleBuffer];
}

- (void)settingUpPiPControllerWithSampleBuffer {
    if([AVPictureInPictureController isPictureInPictureSupported]){
        // set your content Source
        // [[AVPictureInPictureController alloc] initWithContentSource: contentSource];
        self.pipController.delegate = self;
        self.pipController.canStartPictureInPictureAutomaticallyFromInline = YES;
    } else {
        NSLog(@"not supported");
    }
}

// MARK: - AVPictureInPictureSampleBufferPlaybackDelegate With SampleBuffer
// Tells the delegate when the system Picture in Picture window changes size.
- (void)pictureInPictureController:(nonnull AVPictureInPictureController *)pictureInPictureController didTransitionToRenderSize:(CMVideoDimensions)newRenderSize {
    NSLog(@"didTransitionToRenderSize");
}

// Tells the delegate that the user requested to begin or pause playback.
- (void)pictureInPictureController:(nonnull AVPictureInPictureController *)pictureInPictureController setPlaying:(BOOL)playing {
    if(playing) {
        NSLog(@"something do");
    } else {
        NSLog(@"something do");
    }
}

// Tells the delegate that the user has requested skipping forward or backward by the indicated time interval.
- (void)pictureInPictureController:(nonnull AVPictureInPictureController *)pictureInPictureController skipByInterval:(CMTime)skipInterval completionHandler:(nonnull void (^)(void))completionHandler {
    NSLog(@"skipInterval");
}

// Asks delegate to indicate whether the playback UI reflects a playing or paused state, regardless of the current playback rate.
- (BOOL)pictureInPictureControllerIsPlaybackPaused:(nonnull AVPictureInPictureController *)pictureInPictureController {
    return NO;
//    return NO; or return YES;
}

// Asks the delegate for the current playable time range.
- (CMTimeRange)pictureInPictureControllerTimeRangeForPlayback:(nonnull AVPictureInPictureController *)pictureInPictureController {
    return  CMTimeRangeMake(kCMTimeZero, kCMTimePositiveInfinity); // for live streaming
}

@end
