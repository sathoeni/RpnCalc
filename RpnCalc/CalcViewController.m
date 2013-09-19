//
//  ViewController.m
//  Calculator
//
//  Created by pat on 13.09.2013.
//  Copyright (c) 2013 zuehlke. All rights reserved.
//

#import "CalcViewController.h"
#import "Computer.h"


@interface CalcViewController ()

@property (readwrite) Computer* computer;

@end


@implementation CalcViewController

- (IBAction)digitPressed:(id)sender
{
    UIButton* button = (UIButton*)sender;
    NSString* digit = button.currentTitle;
    NSLog(@"Digit pressed %@", digit);
    
    [self.computer digitPressed:digit];
    [self updateUI];
}

- (IBAction)operationPressed:(id)sender
{
    UIButton* button = (UIButton*)sender;
    NSString* operation = button.currentTitle;
    NSLog(@"Operation pressed %@", operation);
    
    [self.computer operationPressed:operation];
    [self updateUI];
}

- (IBAction)enterPressed:(id)sender
{
    NSLog(@"Enter pressed");
        
    [self.computer enterPressed];
    [self updateUI];
}

- (void)updateUI
{
    self.resultView.text = [self.computer resultText];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    self.computer = [[Computer alloc] init];
    [self updateUI];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
