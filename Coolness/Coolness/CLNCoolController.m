// Copyright (C) 2021 About Objects, Inc. All Rights Reserved.
// See LICENSE.txt for this project's licensing information.

#import "CLNCoolController.h"
#import "CLNCoolCell.h"

@interface CLNCoolController () <UITextFieldDelegate>
@property (strong, nonatomic) UITextField *textField;
@property (strong, nonatomic) UIView *contentView;
@end

@implementation CLNCoolController

- (void)addCell {
    NSLog(@"In %s", __func__);
    CLNCoolCell *newCell = [[CLNCoolCell alloc] init];
    newCell.text = self.textField.text;
    [self.contentView addSubview:newCell];
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [textField resignFirstResponder];
    return YES;
}

- (void)loadView {
    self.view = [[UIView alloc] init];
    self.view.backgroundColor = UIColor.brownColor;
    
    CGRect screenRect = UIScreen.mainScreen.bounds;
    CGRect accessoryRect;
    CGRect contentRect;
    CGRectDivide(screenRect, &accessoryRect, &contentRect, 80, CGRectMinYEdge);
    
    UIView *accessoryView = [[UIView alloc] initWithFrame:accessoryRect];
    self.contentView = [[UIView alloc] initWithFrame:contentRect];
    [self.view addSubview:accessoryView];
    [self.view addSubview:self.contentView];
    
    accessoryView.backgroundColor = [UIColor colorWithWhite:1 alpha:0.6];
    self.contentView.backgroundColor = [UIColor colorWithWhite:1 alpha:0.4];
    
    // Controls
    
    self.textField = [[UITextField alloc] initWithFrame:CGRectMake(30, 40, 240, 30)];
    [accessoryView addSubview:self.textField];
    self.textField.borderStyle = UITextBorderStyleRoundedRect;
    self.textField.placeholder = @"Enter a label";
    self.textField.clearButtonMode = UITextFieldViewModeWhileEditing;
    
    self.textField.delegate = self;
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeSystem];
    [button setTitle:@"Add Cell" forState:UIControlStateNormal];
    [button sizeToFit];
    button.frame = CGRectOffset(button.frame, 280, 40);
    [accessoryView addSubview:button];
    
    [button addTarget:self action:@selector(addCell) forControlEvents:UIControlEventTouchUpInside];
    
    // Cool Cells
    
    CLNCoolCell *cell1 = [[CLNCoolCell alloc] initWithFrame:CGRectMake(20, 80, 220, 40)];
    CLNCoolCell *cell2 = [[CLNCoolCell alloc] initWithFrame:CGRectMake(40, 140, 220, 40)];
    
    cell1.text = @"Hello World! 🌎🌍🌏";
    cell2.text = @"Cool Cells Rawk, Big Time! 🍾🥂";
    
    [self.contentView addSubview:cell1];
    [self.contentView addSubview:cell2];
    
    cell1.backgroundColor = UIColor.systemPurpleColor;
    cell2.backgroundColor = UIColor.systemOrangeColor;
}

@end
