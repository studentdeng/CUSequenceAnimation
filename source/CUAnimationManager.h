//
//  CUAnimationManager.h
//  Question
//
//  Created by yg curer on 12-11-15.
//  Copyright (c) 2012年 curer. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <QuartzCore/QuartzCore.h>

@interface CUAnimationManager : NSObject

@property (nonatomic, assign) id delegate;
@property (nonatomic, assign) id dataSource;
@property (nonatomic, strong) NSString *suffix;

@property (nonatomic, assign) BOOL bRepeat;

+ (CUAnimationManager *)animationSequenceWithBasename:(NSString *)basename
                                        UIImageView:(UIImageView *)imageView
                                           andBegin:(int)begin
                                             andEnd:(int)end
                                            andRate:(int)rate;

- (void)stopAnimations;

@end

@protocol  CUAnimationManagerDelegate <NSObject>

- (void)CUAnimationManagerDidFinish:(CUAnimationManager *)manager;

@end

@protocol CUAnimationManagerDataSource <NSObject>

- (UIImage *)animationForIndex:(int)index;

@end
