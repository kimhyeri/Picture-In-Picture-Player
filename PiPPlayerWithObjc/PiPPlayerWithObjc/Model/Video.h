//
//  Video.h
//  PiPPlayerWithObjc
//
//  Created by 김혜리 on 2022/04/25.
//

#import <Foundation/Foundation.h>

@interface Video : NSObject

@property (nonatomic, strong) NSString *videoDescription;
@property (nonatomic, strong) NSString *source;
@property (nonatomic, strong) NSString *subtitle;
@property (nonatomic, strong) NSString *title;

-(id)initWithVideo:(NSString *)videoDescription source:(NSString *)source subtitle:(NSString *)subtitle title:(NSString *)title;

@end

