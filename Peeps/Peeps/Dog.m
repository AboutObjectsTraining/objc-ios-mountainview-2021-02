// Copyright (C) 2021 About Objects, Inc. All Rights Reserved.
// See LICENSE.txt for this project's licensing information.

#import "Dog.h"

@implementation Dog

- (void)bark {
    printf("\nWoof! Woof!\n");
}

- (id)copyWithZone:(NSZone *)zone {
    Dog *newDog = [[[self class] allocWithZone:zone] init];

    // Copy properties as necessary here.
    
    return newDog;
}

@end
