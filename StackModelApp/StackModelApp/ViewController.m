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
    self.navigationItem.title = @"Stack Model";
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
    [presenter displayStackView:_stackData WithAction:kPUSH];
}

- (void)popItemFromStack:(id)sender{
    NSLog(@"Pop item from stack");
    //pop item only if count is more than zero
    if(_stackData.count>0)
        [presenter displayStackView:_stackData WithAction:kPOP];
    else{
        UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"Error" message:@"There are no items in stack to pop!" preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *okAction = [UIAlertAction
                                   actionWithTitle:@"Ok"
                                   style:UIAlertActionStyleDefault
                                   handler:^(UIAlertAction *action)
                                   {
                                       NSLog(@"Dismiss alert");
                                   }];
        [alertController addAction:okAction];
        [self presentViewController:alertController animated:YES completion:nil];
    }
}

- (StackListPresenter *)delegateDependencyInjection{
    id<IStackRepo> stackRepo = [[StackModelRepo alloc] init];
    StackListPresenter *const stackPresenter = [[StackListPresenter alloc] initWithStackRepo:stackRepo andDisplayStackView:self];
    return stackPresenter;
}

#pragma IDisplayStack protocol methods
- (void)displayStack:(NSMutableArray *)data WithAction:(NSString *)action{
    //push operation
    if([action isEqualToString:kPUSH])
    {
        _stackData = data;
        [_stackTableView insertRowsAtIndexPaths:[NSArray arrayWithObject:[NSIndexPath indexPathForRow:(int)data.count-1 inSection:0]] withRowAnimation:UITableViewRowAnimationLeft];
    }
    //pop operation
    else if([action isEqualToString:kPOP]){
        _stackData = data;
        [_stackTableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:[NSIndexPath indexPathForRow:(int)data.count inSection:0]] withRowAnimation:UITableViewRowAnimationRight];
    }
}

@end
