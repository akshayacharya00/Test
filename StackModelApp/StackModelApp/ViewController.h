//
//  ViewController.h
//  StackModelApp
//
//  Created by akshayacharya on 08/08/16.
//  Copyright © 2016 akshayacharya. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Google/Analytics.h>
#import "IDisplayStack.h"
#import "StackListPresenter.h"
#import "IStackRepo.h"
#import "StackModelRepo.h"
#define kPUSH @"Push"
#define kPOP @"Pop"

@interface ViewController : UIViewController<UITableViewDelegate, UITableViewDataSource, IDisplayStack>
@property (weak, nonatomic) IBOutlet UITableView *stackTableView;
@property (strong, nonatomic) NSMutableArray *stackData;

@end

