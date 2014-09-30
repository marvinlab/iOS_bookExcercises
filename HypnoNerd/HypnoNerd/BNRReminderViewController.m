//
//  BNRReminderViewController.m
//  HypnoNerd
//
//  Created by Marvin Labrador on 9/29/14.
//  Copyright (c) 2014 Marvin Labrador. All rights reserved.
//

#import "BNRReminderViewController.h"

@interface BNRReminderViewController ()

@property (nonatomic,weak) IBOutlet UIDatePicker *datePicker;

@end




@implementation BNRReminderViewController

@synthesize remindBtn;
- (IBAction)addReminder:(id)sender {
    
    NSDate *date = self.datePicker.date;
    NSLog(@"Setting a reminder for %@",date);
    
}


@end
