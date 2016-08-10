//
//  StackModelAppUITests.m
//  StackModelAppUITests
//
//  Created by akshayacharya on 08/08/16.
//  Copyright © 2016 akshayacharya. All rights reserved.
//

#import <XCTest/XCTest.h>

@interface StackModelAppUITests : XCTestCase

@end

@implementation StackModelAppUITests

- (void)setUp {
    [super setUp];
    
    // Put setup code here. This method is called before the invocation of each test method in the class.
    
    // In UI tests it is usually best to stop immediately when a failure occurs.
    self.continueAfterFailure = NO;
    // UI tests must launch the application that they test. Doing this in setup will make sure it happens for each test method.
    
    XCUIApplication *app = [[XCUIApplication alloc] init];
    [[[XCUIApplication alloc] init] launch];
    XCUIElement *stackModelNavigationBar = app.navigationBars[@"Stack Model"];
    XCUIElement *addButton = stackModelNavigationBar.buttons[@"Add"];
    [addButton tap];
    [addButton tap];
    [addButton tap];
    [addButton tap];
    [addButton tap];
    [addButton tap];
    [addButton tap];
    [addButton tap];
    [addButton tap];
    [addButton tap];
    [addButton tap];
    [addButton tap];
    [addButton tap];
    [addButton tap];
    [addButton tap];
    [addButton tap];
    [addButton tap];
    [addButton tap];
    [addButton tap];
    [addButton tap];
    [addButton tap];
    [addButton tap];
    [addButton tap];
    [addButton tap];
    [addButton tap];
    [addButton tap];
    [addButton tap];
    [addButton tap];
    [addButton tap];
    [addButton tap];
    [addButton tap];
    [addButton tap];
    
    XCUIElement *minusButton = stackModelNavigationBar.buttons[@"minus"];
    [minusButton tap];
    [minusButton tap];
    [minusButton tap];
    [minusButton tap];
    [minusButton tap];
    [minusButton tap];
    [minusButton tap];
    [minusButton tap];
    [minusButton tap];
    [minusButton tap];
    [minusButton tap];
    [minusButton tap];
    [minusButton tap];
    [minusButton tap];
    [minusButton tap];
    [minusButton tap];
    [minusButton tap];
    [minusButton tap];
    [minusButton tap];
    [minusButton tap];
    [minusButton tap];
    [minusButton tap];
    [minusButton tap];
    [minusButton tap];
    [minusButton tap];
    [minusButton tap];
    [minusButton tap];
    [minusButton tap];
    [minusButton tap];
    [minusButton tap];
    [minusButton tap];
    [minusButton tap];
    [minusButton tap];
    [[app.otherElements containingType:XCUIElementTypeAlert identifier:@"Error"].element tap];
    [app.alerts[@"Error"].collectionViews.buttons[@"Ok"] tap];
    
    
    // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testExample {
    // Use recording to get started writing UI tests.
    // Use XCTAssert and related functions to verify your tests produce the correct results.
}

@end
