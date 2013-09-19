//
//  Computer.h
//  RpnCalc
//
//  Created by pat on 19.09.2013.
//  Copyright (c) 2013 zuehlke. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Computer : NSObject

- (void) digitPressed:(NSString*)digitString;
- (void) operationPressed:(NSString*)operationString;
- (void) enterPressed;

- (NSString*) resultText;

@end
