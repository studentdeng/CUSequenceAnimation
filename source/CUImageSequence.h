//
//  CUImageSequence.h
//  Mengniu3rd
//
//  Created by curer on 8/29/13.
//  Copyright (c) 2013 curer. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CUImageSequence : NSObject

- (id)initWithDictionary:(NSDictionary *)dic;

@property (nonatomic, strong) NSString *baseName;
@property (nonatomic, strong) NSArray *time;
@property (nonatomic, assign) int rate;

+ (CUImageSequence *)sequenceWithIdentify:(int)index andFileName:(NSString *)fileName;

@end
