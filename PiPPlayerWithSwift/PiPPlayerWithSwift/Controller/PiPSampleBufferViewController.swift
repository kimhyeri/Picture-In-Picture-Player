//
//  PiPSampleBufferViewController.swift
//  PiPPlayerWithSwift
//
//  Created by 김혜리 on 2022/04/21.
//

import UIKit
import AVKit

class PiPSampleBufferViewController: UIViewController {

    var pipController: AVPictureInPictureController?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        settingUpPiPControllerWithSampleBuffer()
    }
    
    func settingUpPiPControllerWithSampleBuffer() {
        if AVPictureInPictureController.isPictureInPictureSupported() {
            // set your content Source
            // pipController = AVPictureInPictureController(contentSource: contentSource)
            pipController?.delegate = self
            pipController?.canStartPictureInPictureAutomaticallyFromInline = true
        } else {
            print("not supported")
        }
    }
}

// MARK: - AVPictureInPictureControllerDelegate
extension PiPSampleBufferViewController: AVPictureInPictureControllerDelegate {
    func pictureInPictureControllerWillStartPictureInPicture(_ pictureInPictureController: AVPictureInPictureController) {
        print("pictureInPictureControllerWillStartPictureInPicture")
    }

    func pictureInPictureControllerDidStartPictureInPicture(_ pictureInPictureController: AVPictureInPictureController) {
        print("pictureInPictureControllerDidStartPictureInPicture")
    }

    func pictureInPictureController(_ pictureInPictureController: AVPictureInPictureController, failedToStartPictureInPictureWithError error: Error) {
        print("failedToStartPictureInPictureWithError")
    }

    func pictureInPictureControllerWillStopPictureInPicture(_ pictureInPictureController: AVPictureInPictureController) {
        print("pictureInPictureControllerWillStopPictureInPicture")
    }

    func pictureInPictureControllerDidStopPictureInPicture(_ pictureInPictureController: AVPictureInPictureController) {
        print("pictureInPictureControllerDidStopPictureInPicture")
    }

    func pictureInPictureController(_ pictureInPictureController: AVPictureInPictureController, restoreUserInterfaceForPictureInPictureStopWithCompletionHandler completionHandler: @escaping (Bool) -> Void) {
        print("restoreUserInterfaceForPictureInPictureStopWithCompletionHandler")
    }
}

// MARK: - AVPictureInPictureSampleBufferPlaybackDelegate With SampleBuffer
extension PiPSampleBufferViewController: AVPictureInPictureSampleBufferPlaybackDelegate {
    // Tells the delegate when the system Picture in Picture window changes size.
    func pictureInPictureController(_ pictureInPictureController: AVPictureInPictureController, didTransitionToRenderSize newRenderSize: CMVideoDimensions) {
        print("didTransitionToRenderSize")
    }
    
    // Tells the delegate that the user requested to begin or pause playback.
    func pictureInPictureController(_ pictureInPictureController: AVPictureInPictureController, setPlaying playing: Bool) {
        if playing {
            print("something do")
        } else {
            print("something do")
        }
    }

    // Tells the delegate that the user has requested skipping forward or backward by the indicated time interval.
    func pictureInPictureController(_ pictureInPictureController: AVPictureInPictureController, skipByInterval skipInterval: CMTime, completion completionHandler: @escaping () -> Void) {
        print("skipInterval")
    }
    
    // Asks delegate to indicate whether the playback UI reflects a playing or paused state, regardless of the current playback rate.
    func pictureInPictureControllerIsPlaybackPaused(_ pictureInPictureController: AVPictureInPictureController) -> Bool {
        return false
        // return true or return false
    }
    
    // Asks the delegate for the current playable time range.
    func pictureInPictureControllerTimeRangeForPlayback(_ pictureInPictureController: AVPictureInPictureController) -> CMTimeRange {
        CMTimeRange(start: .zero, duration: .positiveInfinity)
    }
}
