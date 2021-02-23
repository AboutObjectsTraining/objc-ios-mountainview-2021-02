// Copyright (C) 2021 About Objects, Inc. All Rights Reserved.
// See LICENSE.txt for this project's licensing information.

#import <XCTest/XCTest.h>
#import <Peeps/Peeps.h>

@interface PersonTests : XCTestCase
@end

@implementation PersonTests

- (void)testConfigurePerson {
    Person *fred = [[Person alloc] init];
    NSLog(@"\nThe person's name is %@\n", [fred firstName]);
    
    [fred setFirstName:@"Fred"];
    NSLog(@"\nThe person's name is %@\n", [fred firstName]);
}

- (void)testDescriptionOfPerson {
    Person *fred = [[Person alloc] init];
    NSLog(@"\nThe person is %@\n", fred);
    
    [fred setFirstName:@"Fred"];
    [fred setLastName:@"Smith"];
    [fred setAge:42];
    NSLog(@"\nThe person is %@\n", fred);
}

@end
