//
//  CUAnimationManager.m
//  Question
//
//  Created by yg curer on 12-11-15.
//  Copyright (c) 2012年 curer. All rights reserved.
//

#import "CUAnimationManager.h"

@interface CUAnimationManager ()

@property (nonatomic, retain) NSTimer *myTimer;
@property (nonatomic, retain) UIImageView *imageView;
@property (nonatomic, retain) NSString *baseName;
@property (nonatomic, assign) int beginIndex;
@property (nonatomic, assign) int endIndex;
@property (nonatomic, assign) int currentIndex;
@property (nonatomic, assign) int rate;
@property (nonatomic, assign) BOOL bReverse;

@end

@implementation CUAnimationManager

- (void)dealloc
{
    [self stopAnimations];
}

+ (NSString *)filename:(NSString *)basename andIndex:(int)index
{
    NSString *imgfilename = nil;
    
    imgfilename = [NSString stringWithFormat:@"%@_%03d", basename, index];
    
    return imgfilename;
}

+ (CUAnimationManager *)animationSequenceWithBasename:(NSString *)basename
                                        UIImageView:(UIImageView *)imageView
                                           andBegin:(int)begin
                                             andEnd:(int)end
                                            andRate:(int)rate
{
    CUAnimationManager *animationManager = [CUAnimationManager new];
    animationManager.imageView = imageView;
    animationManager.beginIndex = begin;
    animationManager.endIndex = end;
    animationManager.rate = rate;
    animationManager.currentIndex = begin;
    animationManager.baseName = basename;
    animationManager.bReverse = begin >= end;
    animationManager.myTimer = [NSTimer scheduledTimerWithTimeInterval:1.0 / rate
                                                                target:animationManager
                                                              selector:@selector(update)
                                                              userInfo:nil
                                                               repeats:YES];
    
    return animationManager;
}

- (void)update
{
    if (self.dataSource != nil) {
        self.imageView.image = [self.dataSource animationForIndex:self.currentIndex];
    }
    else
    {
        NSString *imageFilename = [CUAnimationManager filename:self.baseName
                                                    andIndex:self.currentIndex];
        UIImage *imgfile = [[UIImage alloc]
                            initWithContentsOfFile:[[NSBundle mainBundle] pathForResource:imageFilename
                                                                                   ofType:self.suffix.length ? self.suffix : @"jpg"]];
        
        self.imageView.image = imgfile;
    }
    
    if (!self.bReverse) {
        self.currentIndex ++;
    }
    else
    {
        self.currentIndex --;
    }
    
    if ((self.currentIndex > self.endIndex && !self.bReverse )
         || (self.currentIndex < self.endIndex && self.bReverse))
    {
        if (self.bRepeat) {
            self.currentIndex = !self.bReverse ? self.beginIndex : self.endIndex;
            
            return;
        }
        
        [self.myTimer invalidate];
        self.myTimer = nil;
        
        if ([self.delegate respondsToSelector:@selector(CUAnimationManagerDidFinish:)]) {
            [self.delegate performSelector:@selector(CUAnimationManagerDidFinish:)
                                withObject:self];
        }
    }
}

- (void)stopAnimations
{
    [self.myTimer invalidate];
    self.myTimer = nil;
}

@end
