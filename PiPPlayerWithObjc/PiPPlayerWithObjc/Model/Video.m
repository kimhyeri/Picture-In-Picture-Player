//
//  Video.m
//  PiPPlayerWithObjc
//
//  Created by 김혜리 on 2022/04/25.
//

#import "Video.h"

@implementation Video

-(id)initWithVideo:(NSString *)videoDescription source:(NSString *)source subtitle:(NSString *)subtitle title:(NSString *)title {
    self.videoDescription = videoDescription;
    self.source = source;
    self.subtitle = subtitle;
    self.title = title;
    
    return self;
}

@end
