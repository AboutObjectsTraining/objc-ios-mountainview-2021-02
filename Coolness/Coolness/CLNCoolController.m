// Copyright (C) 2021 About Objects, Inc. All Rights Reserved.
// See LICENSE.txt for this project's licensing information.

#import "CLNCoolController.h"

@implementation CLNCoolController

- (void)loadView {
    self.view = [[UIView alloc] init];
    self.view.backgroundColor = UIColor.brownColor;
    
    UIView *subview1 = [[UIView alloc] initWithFrame:CGRectMake(20, 80, 220, 40)];
    UIView *subview2 = [[UIView alloc] initWithFrame:CGRectMake(40, 140, 220, 40)];
    
    [self.view addSubview:subview1];
    [self.view addSubview:subview2];
    
    subview1.backgroundColor = UIColor.systemPurpleColor;
    subview2.backgroundColor = UIColor.systemOrangeColor;
}

@end
