// Copyright (C) 2021 About Objects, Inc. All Rights Reserved.
// See LICENSE.txt for this project's licensing information.

#import "Person.h"
#import "Dog.h"

@interface Person () {
    Dog *_dog;
}

- (Dog *)dog;
- (void)setDog:(Dog *)newValue;

@end

@implementation Person

/// Class factory method that creates and initializes a new Person.
/// @param firstName a first name
/// @param lastName a last name
/// @param age an age
+ (instancetype)personWithFirstName:(NSString *)firstName lastName:(NSString *)lastName age:(NSInteger)age {
    return [[self alloc] initWithFirstName:firstName lastName:lastName age:age];
}

/// The designated initializer for the Person class.
/// @param firstName a first name
/// @param lastName a last name
/// @param age an age
- (instancetype)initWithFirstName:(NSString *)firstName lastName:(NSString *)lastName age:(NSInteger)age {
    self = [super init];
    if (!self) return nil;
    
    // TODO: We should be copying these strings
    _firstName = firstName;
    _lastName = lastName;
    _age = age;
    
    _dog = [[Dog alloc] init];
    
    return self;
}

/// A convenience initializer that initializes a person's name.
/// @param firstName a first name
/// @param lastName a last name
- (instancetype)initWithFirstName:(NSString *)firstName lastName:(NSString *)lastName {
    return [self initWithFirstName:firstName lastName:lastName age:0];
}


/// Lazily initializes a dog.
- (Dog *)dog {
    if (_dog == nil) {
        _dog = [[Dog alloc] init];
    }
    return _dog;
}
- (void)setDog:(Dog *)newValue {
    _dog = newValue;
}

- (NSString *)firstName {
    return _firstName;
}
- (void)setFirstName:(NSString *)newValue {
    _firstName = newValue; // TODO: cover memory management and mutability requirements.
}

- (NSString *)lastName {
    return _lastName;
}
- (void)setLastName:(NSString *)newValue {
    _lastName = newValue;
}

- (NSString *)fullName {
    return [NSString stringWithFormat:@"%@ %@", [self firstName], [self lastName]];
}

- (NSInteger)age {
    return _age;
}
- (void)setAge:(NSInteger)newValue {
    _age = newValue;
}

- (NSString *)description
{
    return [NSString stringWithFormat:@"%@, age: %@", [self fullName], @([self age])];
}

// MARK: - Introspection stuff

- (BOOL)respondsToSelector:(SEL)aSelector {
    if ([super respondsToSelector:aSelector]) {
        return YES;
    }
    return [[self dog] respondsToSelector:aSelector];
}

- (id)forwardingTargetForSelector:(SEL)aSelector {
    if ([[self dog] respondsToSelector:aSelector]) {
        return [self dog];
    }
    return [super forwardingTargetForSelector:aSelector];
}

@end
