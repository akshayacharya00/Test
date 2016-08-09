//
//  IStackRepo.h
//  StackModelApp
//
//  Created by akshayacharya on 09/08/16.
//  Copyright © 2016 akshayacharya. All rights reserved.
//

@protocol IStackRepo <NSObject>

@required
- (NSMutableArray *)pushItemToStackAndRetrieve:(NSMutableArray *)data;
- (NSMutableArray *)popItemToStackAndRetrieve:(NSMutableArray *)data;

@end