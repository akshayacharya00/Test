//
//  ViewController.m
//  StackModelApp
//
//  Created by akshayacharya on 08/08/16.
//  Copyright © 2016 akshayacharya. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
{
    StackListPresenter *presenter;
}
@end

@implementation ViewController
@synthesize stackTableView = _stackTableView;
@synthesize stackData = _stackData;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    //add nav bar buttons
    [self addButtonsToNavBar];
    //delegate dependency injection
    presenter = [self delegateDependencyInjection];
    //init stack data
    _stackData = [NSMutableArray array];
}

- (void)viewWillAppear:(BOOL)animated{
    //enable google analytics tracking
    id<GAITracker> tracker = [[GAI sharedInstance] defaultTracker];
    [tracker set:kGAIScreenName value:@"StackModelAppHomeScreen"];
    [tracker send:[[GAIDictionaryBuilder createScreenView] build]];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma UITableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [_stackData count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *CellIdentifier = @"cellStackModel";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    [cell textLabel].text = [[_stackData objectAtIndex:indexPath.row] description];
    
    return cell;
}


#pragma Custom methods
- (void)addButtonsToNavBar{
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(pushItemToStack:)];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"minus"] style:UIBarButtonItemStylePlain target:self action:@selector(popItemFromStack:)];
}

- (void)pushItemToStack:(id)sender{
    NSLog(@"Push item to stack");
    [presenter displayStackView:_stackData WithAction:@"Push"];
}

- (void)popItemFromStack:(id)sender{
    NSLog(@"Pop item from stack");
    [presenter displayStackView:_stackData WithAction:@"Pop"];
}

- (StackListPresenter *)delegateDependencyInjection{
    id<IStackRepo> stackRepo = [[StackModelRepo alloc] init];
    StackListPresenter *const stackPresenter = [[StackListPresenter alloc] initWithStackRepo:stackRepo andDisplayStackView:self];
    return stackPresenter;
}

#pragma IDisplayStack protocol methods
-(void)displayStack:(NSMutableArray *)data{
    _stackData = data;
    [_stackTableView reloadData];
}

@end
