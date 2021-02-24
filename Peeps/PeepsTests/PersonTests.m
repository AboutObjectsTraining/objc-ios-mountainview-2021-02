// Copyright (C) 2021 About Objects, Inc. All Rights Reserved.
// See LICENSE.txt for this project's licensing information.

#import <XCTest/XCTest.h>
#import <Peeps/Peeps.h>

//@interface Person (UnitTestAdditions)
//- (NSString *)fullName;
//@end

@interface PersonTests : XCTestCase
@end

@implementation PersonTests

- (void)testConfigurePerson {
    Person *fred = [[Person alloc] init];
    NSLog(@"\nThe person's name is %@\n", [fred firstName]);
    
    NSString *firstName = [fred firstName];
    
    NSLog(@"\nLowercased first name is %@\n", [firstName lowercaseString]);
    
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

- (void)testFullName {
    Person *fred = [[Person alloc] init];
    [fred setFirstName:@"Fred"];
    [fred setLastName:@"Smith"];
    [fred setAge:42];
    NSLog(@"\nThe person is %@\n", fred);
    
    NSLog(@"Full name is %@\n", [fred fullName]);
    
    NSString *name = [fred valueForKey:@"fullName"];
    NSLog(@"Full name is %@", name);
}

- (void)testInitMethodWithTwoParams {
    Person *fred = [[Person alloc] initWithFirstName:@"Fred" lastName:@"Smith"];
    [fred setAge:42];
    NSLog(@"\nThe person is %@\n", fred);
}

- (void)testInitMethodWithThreeParams {
    Person *fred = [[Person alloc] initWithFirstName:@"Fred" lastName:@"Smith" age:42];
    NSLog(@"\nThe person is %@\n", fred);
}

- (void)testForwarding {
    id fred = [[Person alloc] initWithFirstName:@"Fred" lastName:@"Smith" age:42];
    [fred bark];
}

- (void)testForwardingAgain {
    id fred = [[Person alloc] initWithFirstName:@"Fred" lastName:@"Smith" age:42];
    
    SEL barkSelector = @selector(bark);
    if ([fred respondsToSelector:barkSelector]) {
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Warc-performSelector-leaks"
        [fred performSelector:barkSelector];
#pragma clang diagnostic pop
    }
}

- (void)testCopying {
    Dog *rover = [[Dog alloc] init];
    Dog *cloneOfRover = [rover copy];
    NSLog(@"Clone of rover is %@", cloneOfRover);
}

@end
