// Copyright (C) 2021 About Objects, Inc. All Rights Reserved.
// See LICENSE.txt for this project's licensing information.

#import <XCTest/XCTest.h>

void sayHello(void) {
    printf("Hello!\n");
}

void doNTimes(int count, void (*thingToDo)(void)) {
    for (int i = 0; i < count; i++) {
        thingToDo();
    }
}

void doNTimesWithBlock(int count, void(^block)(void)) {
    for (int i = 0; i < count; i++) {
        block();
    }
}

void doNTimesWithBlockWithParameter(int count, void(^block)(int)) {
    for (int i = 0; i < count; i++) {
        block(i + 1);
    }
}

@interface BlockLiteralTests : XCTestCase
@property (copy, nonatomic) NSString *text;
@end

@implementation BlockLiteralTests

- (void)setUp {
    self.text = @"sunny";
}

- (void)testBlockWithParameter {
    doNTimesWithBlockWithParameter(3, ^(int itemNumber) {
        printf("%d. Hello!\n", itemNumber);
    });
}

- (void)testCapturingSelf {
    doNTimesWithBlock(3, ^{
        printf("Hello, the weather is %s!\n", self.text.UTF8String);
    });
}

- (void)testPassingBlockLiteral {
    doNTimesWithBlock(3, ^{
        printf("Hello from my block!\n");
    });
}

- (void)testBlockLiteral {
    void (^myBlock)(void);
    
    const char *message = "Woohoo!";
    
    myBlock = ^{
        printf("Hello! %s\n", message);
    };
    
    myBlock();
    
    NSLog(@"%@", myBlock);
    
    id copyOfMyBlock = [myBlock copy];
    NSLog(@"%@", copyOfMyBlock);
}

- (void)testPassingFunctionPointer {
    doNTimes(3, sayHello);
}

- (void)testHelloFunctionPointer {
    void (*myHelloPtr)(void);
    
    myHelloPtr = sayHello;
    
    myHelloPtr();
}

@end
