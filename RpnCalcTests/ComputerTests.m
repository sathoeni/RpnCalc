//
//  ComputerTests.m
//  RpnCalc
//
//  Created by pat on 19.09.2013.
//  Copyright (c) 2013 zuehlke. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "Computer.h"


@interface ComputerTests : XCTestCase

@property (readwrite) Computer* computer;

@end


@implementation ComputerTests

- (void)setUp
{
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
    
    self.computer = [[Computer alloc] init];
}

- (void)tearDown
{
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testEmpty
{
    assert([[self.computer resultText] isEqualToString:@"0"]);
}

- (void)testOperation
{
    [self.computer digitPressed:@"1"];
    [self.computer enterPressed];
    [self.computer digitPressed:@"2"];
    assert([[self.computer resultText] isEqualToString:@"1\n2"]);
    [self.computer operationPressed:@"+"];
    assert([[self.computer resultText] isEqualToString:@"3"]);
}

- (void)testLongNumber
{
    [self.computer digitPressed:@"4"];
    [self.computer digitPressed:@"2"];
    assert([[self.computer resultText] isEqualToString:@"42"]);
}

@end
