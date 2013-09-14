//
//  ViewController.m
//  Calculator
//
//  Created by pat on 13.09.2013.
//  Copyright (c) 2013 zuehlke. All rights reserved.
//

#import "ViewController.h"
#import "Stack.h"


@interface ViewController ()

@property (readwrite) Stack* numberStack;

- (void)showError:(NSString*) message;
- (double)computeWithOperand1:(double)op1 operand2:(double)op2 andOperation:(NSString*)op;
- (void)updateUI;

@end


@implementation ViewController

- (IBAction)digitPressed:(id)sender
{
    UIButton* button = (UIButton*)sender;
    NSString* digit = button.currentTitle;
    NSLog(@"Digit pressed %@", digit);
    
    NSNumber* current = (NSNumber*)[self.numberStack pop];
    NSNumber* new = [NSNumber numberWithDouble:[current doubleValue] * 10 + [digit doubleValue]];
    [self.numberStack push:new];
    
    [self updateUI];
}

- (IBAction)operationPressed:(id)sender
{
    UIButton* button = (UIButton*)sender;
    NSString* operation = button.currentTitle;
    NSLog(@"Operation pressed %@", operation);
    
    double operand1, operand2;
    
    if ([self.numberStack size] < 2) {
        [self showError:@"At least two operands are necessary before executing an operation in NPR"];
    }
    
    operand2 = [[self.numberStack pop] doubleValue];
    operand1 = [[self.numberStack pop] doubleValue];
    
    double result = [self computeWithOperand1:operand1 operand2:operand2 andOperation:operation];
    [self.numberStack push:[NSNumber numberWithDouble:result]];
    
    [self updateUI];
}

- (IBAction)enterPressed:(id)sender
{
    NSLog(@"Enter pressed");
        
    [self.numberStack push:@0.0];
    [self updateUI];
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
    else if ([op isEqualToString:@"/"]) {
        return op1 / op2;
    }
    else {
        NSException* exception = [NSException exceptionWithName:@"IllegalOperation" reason:[NSString stringWithFormat:@"The given operation '%@' is not legal", op] userInfo:nil];
        @throw exception;
    }
}

- (void)updateUI
{
    NSArray* array = [self.numberStack arrayFromStack];
    array = [self limitLength:array];
    //array = [self reverse:array];
    NSString* text = [array componentsJoinedByString:@"\n"];
    
    self.resultView.text = text;
}

- (NSArray*) limitLength:(NSArray*)array
{
    if ([array count] > 4) {
        NSRange range = NSMakeRange([array count] - 4, 4);
        array = [array subarrayWithRange:range];
    }
    return array;
}

- (NSArray*) reverse:(NSArray*)array
{
    return [[array reverseObjectEnumerator] allObjects];
}

- (void)showError:(NSString*) message
{
    UIAlertView* alert = [[UIAlertView alloc] initWithTitle:@"Error" message:message delegate:nil cancelButtonTitle:nil otherButtonTitles:@"OK", nil];
    [alert show];
    NSLog(@"At least two operands are necessary before executing an operation in NPR");
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    self.numberStack = [[Stack alloc] init];
    [self.numberStack push:@0.0];
    [self updateUI];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
