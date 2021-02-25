// Copyright (C) 2021 About Objects, Inc. All Rights Reserved.
// See LICENSE.txt for this project's licensing information.

#import "CLNCoolController.h"
#import "CLNCoolCell.h"

@implementation CLNCoolController

- (void)loadView {
    self.view = [[UIView alloc] init];
    self.view.backgroundColor = UIColor.brownColor;
    
    CLNCoolCell *cell1 = [[CLNCoolCell alloc] initWithFrame:CGRectMake(20, 80, 220, 40)];
    CLNCoolCell *cell2 = [[CLNCoolCell alloc] initWithFrame:CGRectMake(40, 140, 220, 40)];
    
    cell1.text = @"Hello World! 🌎🌍🌏";
    cell2.text = @"Cool Cells Rawk, Big Time! 🍾🥂";
    
    [self.view addSubview:cell1];
    [self.view addSubview:cell2];
    
    [cell1 sizeToFit];
    [cell2 sizeToFit];
    
    cell1.backgroundColor = UIColor.systemPurpleColor;
    cell2.backgroundColor = UIColor.systemOrangeColor;
}

@end
