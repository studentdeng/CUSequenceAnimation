//
//  CUFrameAnimationManager.m
//  Mengniu3rd
//
//  Created by curer on 9/16/13.
//  Copyright (c) 2013 curer. All rights reserved.
//

#import "CUFrameAnimationManager.h"
#import "CUAnimationManager.h"
#import "CUImageSequence.h"

@interface CUFrameAnimationManager()

@property (nonatomic, strong) CUImageSequence *currentImageSequence;


@end

@implementation CUFrameAnimationManager

+ (CUFrameAnimationManager *)managerWithImageView:(UIImageView *)imageView
                                 useImageSequence:(CUImageSequence *)sequence
{
    CUFrameAnimationManager *frameManager = [CUFrameAnimationManager new];
    
    CUAnimationManager *manager =
    [CUAnimationManager animationSequenceWithBasename:sequence.baseName
                                          UIImageView:imageView
                                             andBegin:[[[sequence time] objectAtIndex:0] intValue]
                                               andEnd:[[sequence.time lastObject] intValue]
                                              andRate:sequence.rate];
    manager.dataSource = frameManager;
    frameManager.animationManager = manager;
    frameManager.currentImageSequence = sequence;
    manager.bRepeat = YES;
    
    return frameManager;
}

- (UIImage *)animationForIndex:(int)index
{
    int num = 0;
    for (NSString *item in self.currentImageSequence.time) {
        
        int order = [item intValue];
        if (order > index) {
            break;
        }
        else
        {
            num = order;
        }
    }
    
    NSString *imageFilename = [NSString stringWithFormat:@"%@_%03d", self.currentImageSequence.baseName, num];
    UIImage *imgfile = [[UIImage alloc]
                        initWithContentsOfFile:[[NSBundle mainBundle] pathForResource:imageFilename ofType:@"jpg"]];
    
    return imgfile;
}

- (void)stopAnimation
{
    [self.animationManager stopAnimations];
    self.animationManager.delegate = nil;
    self.animationManager.dataSource = nil;
}

@end
