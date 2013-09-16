//
//  CUImageSequence.m
//  Mengniu3rd
//
//  Created by curer on 8/29/13.
//  Copyright (c) 2013 curer. All rights reserved.
//

#import "CUImageSequence.h"

@implementation CUImageSequence

- (id)initWithDictionary:(NSDictionary *)dic
{
    if (self = [super init]) {
        self.baseName = [dic objectForKey:@"basename"];
        self.rate = [[dic objectForKey:@"rate"] intValue];
        self.time = [dic objectForKey:@"time"];
    }
    
    return self;
}

+ (CUImageSequence *)sequenceWithIdentify:(int)index
{
    NSString *path = [[NSBundle mainBundle] pathForResource:@"light" ofType:@"plist"];
    NSURL *fileURL = [NSURL fileURLWithPath:path];
    
    NSArray *list = [[NSArray alloc] initWithContentsOfURL:fileURL];
    
    if (index >= [list count]) {
        return nil;
    }
    
    NSDictionary *dic = [list objectAtIndex:index];
    return [[CUImageSequence alloc] initWithDictionary:dic];
}

@end
