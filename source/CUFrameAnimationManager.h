//
//  CUFrameAnimationManager.h
//  Mengniu3rd
//
//  Created by curer on 9/16/13.
//  Copyright (c) 2013 curer. All rights reserved.
//

#import <Foundation/Foundation.h>

@class CUImageSequence;
@class CUAnimationManager;
@interface CUFrameAnimationManager : NSObject

@property (nonatomic, strong) CUAnimationManager *animationManager;

+ (CUFrameAnimationManager *)managerWithImageView:(UIImageView *)imageView
                                 useImageSequence:(CUImageSequence *)sequence;

- (void)stopAnimation;

@end
