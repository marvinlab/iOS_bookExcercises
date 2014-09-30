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
    
    UILocalNotification *note = [[UILocalNotification alloc]init];
    
    note.alertBody = @"Hypnotize Me!!";
    note.fireDate = date;
    
    [[UIApplication sharedApplication]scheduleLocalNotification:note];
    
}



-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    self.datePicker.minimumDate = [NSDate dateWithTimeIntervalSinceNow:60];
}



-(void)viewDidLoad
{
    [super viewDidLoad];
    
    NSLog(@"BNRReminderViewController loaded its view");
    
}

-(instancetype)initWithNibName:(NSString *)nibNameOrNil
                        bundle:(NSBundle *)nibBundleOrNil
{
    
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    
    
    if(self){
        
            self.tabBarItem.title = @"Remind";
        
        UIImage *image = [UIImage imageNamed:@"Time.png"];
        
        self.tabBarItem.image = image;
        
    }
    
    return self;
    
}


@end
