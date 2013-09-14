//
//  Stack.h
//  Calculator
//
//  Created by pat on 13.09.2013.
//  Copyright (c) 2013 zuehlke. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Stack : NSObject

- (BOOL) isEmpty;
- (void) push:(id) item;
- (id) pop;
- (NSInteger) size;
- (NSArray*) arrayFromStack;

@end
