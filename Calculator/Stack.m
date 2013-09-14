//
//  Stack.m
//  Calculator
//
//  Created by pat on 13.09.2013.
//  Copyright (c) 2013 zuehlke. All rights reserved.
//

#import "Stack.h"


@interface Stack ()
@property (strong) NSMutableArray* array;
@end


@implementation Stack

- (id)init {
    self = [super init];
    if (self) {
        // Initialize self.
        self.array = [[NSMutableArray alloc] init];
    }
    return self;
}

- (BOOL) isEmpty
{
    return [self.array count] == 0;
}

- (void) push:(id) item
{
    [self.array addObject:item];
}

- (id) pop
{
    if ([self isEmpty]) {

        NSException* exception = [NSException exceptionWithName:@"IllegalStateException" reason:@"cannot pop on an empty stack" userInfo:nil];
        @throw exception;

    }
    else {

        NSDecimalNumber* item = [self.array objectAtIndex:[self.array count] - 1];
        [self.array removeLastObject];
        return item;

    }
}

- (NSInteger) size
{
    return [self.array count];
}

- (NSArray*) arrayFromStack
{
    return self.array;
}

@end
