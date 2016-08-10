//
//  StackListPresenter.m
//  StackModelApp
//
//  Created by akshayacharya on 09/08/16.
//  Copyright © 2016 akshayacharya. All rights reserved.
//

#import "StackListPresenter.h"

@implementation StackListPresenter
- (StackListPresenter *)initWithStackRepo:(id<IStackRepo>)stackRepo andDisplayStackView:(id<IDisplayStack>)displayStackView{
    if(self = [super init]){
        _stackRepo = stackRepo;
        _displayStackView = displayStackView;
    }
    return self;
}


- (void)displayStackView:(NSMutableArray *)data WithAction:(NSString *)action{
    NSMutableArray *stackData = [NSMutableArray array];
        //if action is push
        if([action isEqualToString:kPUSH])
            stackData = [_stackRepo pushItemToStackAndRetrieve:data];
        //if action is pop
        else if([action isEqualToString:kPOP])
            stackData = [_stackRepo popItemToStackAndRetrieve:data];
    [_displayStackView displayStack:stackData WithAction:action];
}

@end
