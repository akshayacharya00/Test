//
//  StackModelRepo.m
//  StackModelApp
//
//  Created by akshayacharya on 09/08/16.
//  Copyright © 2016 akshayacharya. All rights reserved.
//

#import "StackModelRepo.h"

@implementation StackModelRepo

-(NSMutableArray *)pushItemToStackAndRetrieve:(NSMutableArray *)data{
    if([data count] == 0)
        [data addObject:[NSNumber numberWithInt:1]];
    else
        [data addObject:[NSNumber numberWithInt:(int)[data count]+1]];
    return data;
}

-(NSMutableArray *)popItemToStackAndRetrieve:(NSMutableArray *)data{
    if([data count] == 0)
        return data;
    else
        [data removeLastObject];
    return data;
}

@end
