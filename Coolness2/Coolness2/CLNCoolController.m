// Copyright (C) 2021 About Objects, Inc. All Rights Reserved.
// See LICENSE.txt for this project's licensing information.

#import "CLNCoolController.h"
#import "CLNCoolCell.h"

@interface CLNCoolController () <UITextFieldDelegate>
@property (strong, nonatomic) IBOutlet UITextField *textField;
@property (strong, nonatomic) IBOutlet UIView *contentView;
@end

@implementation CLNCoolController

- (IBAction)addCell {
    NSLog(@"In %s", __func__);
    CLNCoolCell *newCell = [[CLNCoolCell alloc] init];
    newCell.text = self.textField.text;
    [self.contentView addSubview:newCell];
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [textField resignFirstResponder];
    return YES;
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    NSLog(@"In %s", __func__);
    [super touchesBegan:touches withEvent:event];
}

// MARK: - loadView examples
- (void)loadView2 {
    [NSBundle.mainBundle loadNibNamed:@"CoolStuff" owner:self options:nil];
}

- (void)loadView1 {
    NSArray *topLevelObjs = [NSBundle.mainBundle loadNibNamed:@"CoolStuff" owner:nil options:nil];
    self.view = topLevelObjs.firstObject;
}

@end
