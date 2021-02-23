// Copyright (C) 2021 About Objects, Inc. All Rights Reserved.
// See LICENSE.txt for this project's licensing information.

#import <Foundation/Foundation.h>

@interface Person : NSObject {
    NSString *_firstName;
    NSString *_lastName;
    NSInteger _age;
}

- (instancetype)initWithFirstName:(NSString *)firstName
                         lastName:(NSString *)lastName
                              age:(NSInteger)age;

- (instancetype)initWithFirstName:(NSString *)firstName
                         lastName:(NSString *)lastName;

- (NSString *)firstName;
- (void)setFirstName:(NSString *)newValue;

- (NSString *)lastName;
- (void)setLastName:(NSString *)newValue;

- (NSString *)fullName;

- (NSInteger)age;
- (void)setAge:(NSInteger)newValue;

@end
