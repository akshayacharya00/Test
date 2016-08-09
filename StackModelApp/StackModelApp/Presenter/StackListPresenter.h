//
//  StackListPresenter.h
//  StackModelApp
//
//  Created by akshayacharya on 09/08/16.
//  Copyright © 2016 akshayacharya. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "IStackRepo.h"
#import "IDisplayStack.h"
#import "ViewController.h"

@protocol IStackRepo;
@protocol IDisplayStack;

@interface StackListPresenter : NSObject
@property (nonatomic,strong) id<IDisplayStack> displayStackView;
@property (nonatomic,strong) id<IStackRepo> stackRepo;

- (StackListPresenter *)initWithStackRepo:(id<IStackRepo>) stackRepo andDisplayStackView: (id<IDisplayStack>) displayStackView;
- (void)displayStackView:(NSMutableArray *)data WithAction:(NSString *)action;

@end
