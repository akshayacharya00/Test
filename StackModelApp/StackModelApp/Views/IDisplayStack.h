//
//  IDisplayStack.h
//  StackModelApp
//
//  Created by akshayacharya on 09/08/16.
//  Copyright © 2016 akshayacharya. All rights reserved.
//

@protocol IDisplayStack <NSObject>

@required
- (void)displayStack:(NSMutableArray *)data WithAction:(NSString *)action;

@end
