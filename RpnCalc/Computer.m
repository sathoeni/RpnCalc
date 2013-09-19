//
//  Computer.m
//  RpnCalc
//
//  Created by pat on 19.09.2013.
//  Copyright (c) 2013 zuehlke. All rights reserved.
//

#import "Computer.h"
#import "Stack.h"

@interface Computer ()

@property (readwrite) Stack* stack;

@end


@implementation Computer

- (id)init {
    self = [super init];
    if (self) {
        // Initialize self.
        self.stack = [[Stack alloc] init];
        [self.stack push:@0.0];
    }
    return self;
}

- (void)digitPressed:(NSString *)digitString
{
    NSNumber* current = (NSNumber*)[self.stack pop];
    NSNumber* new = [NSNumber numberWithDouble:[current doubleValue] * 10 + [digitString doubleValue]];
    [self.stack push:new];
}

- (void) operationPressed:(NSString*)operationString
{
    double operand1, operand2;
    
    if ([self.stack size] < 2) {
        NSLog(@"At least two operands are necessary before executing an operation in NPR");
        return;
    }
    
    operand2 = [[self.stack pop] doubleValue];
    operand1 = [[self.stack pop] doubleValue];
    
    double result = [self computeWithOperand1:operand1 operand2:operand2 andOperation:operationString];
    [self.stack push:[NSNumber numberWithDouble:result]];
}

- (double)computeWithOperand1:(double)op1 operand2:(double)op2 andOperation:(NSString*)op
{
    // TODO get rid of this string compare
    if ([op isEqualToString:@"+"]) {
        return op1 + op2;
    }
    else if ([op isEqualToString:@"-"]) {
        return op1 - op2;
    }
    else if ([op isEqualToString:@"*"]) {
        return op1 * op2;
    }
    else /* op is @"/" */ {
        return op1 / op2;
    }
}

- (void) enterPressed
{
    [self.stack push:@0.0];
}

- (NSString*) resultText
{
    NSArray* array = [self.stack arrayFromStack];
    array = [self limitLength:array];
    return [array componentsJoinedByString:@"\n"];
}

- (NSArray*) limitLength:(NSArray*)array
{
    if ([array count] > 4) {
        NSRange range = NSMakeRange([array count] - 4, 4);
        array = [array subarrayWithRange:range];
    }
    return array;
}


@end
