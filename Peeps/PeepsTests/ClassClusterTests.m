// Copyright (C) 2021 About Objects, Inc. All Rights Reserved.
// See LICENSE.txt for this project's licensing information.

#import <XCTest/XCTest.h>

@interface ClassClusterTests : XCTestCase
@end

@implementation ClassClusterTests

- (void)testStringClassCluster {
    
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wunused-variable"
    NSString *s1 = [NSString alloc];
    NSString *s2 = [NSString alloc];
    NSString *m1 = [NSMutableString alloc];
    
    NSString *s3 = [s1 initWithFormat:@"%@ %@!", @"Hello", @"World"];
    NSString *s4 = [s1 initWithFormat:@"Foo"];
#pragma clang diagnostic pop
    
    NSLog(@"%@", s3);
}

- (void)testArrayClassCluster {
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wunused-variable"
    NSArray *a1 = [NSArray alloc];
    NSMutableArray *a2 = [NSMutableArray alloc];
#pragma clang diagnostic pop
}

- (void)testArrays {
    NSArray *a1 = @[ @"One", @42, @"Foo" ];
    
    for (id currObj in a1) {
        NSLog(@"%@", currObj);
    }
}


@end
