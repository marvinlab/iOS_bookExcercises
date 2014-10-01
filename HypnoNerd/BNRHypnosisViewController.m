//
//  BNRHypnosisViewController.m
//  HypnoNerd
//
//  Created by Marvin Labrador on 9/29/14.
//  Copyright (c) 2014 Marvin Labrador. All rights reserved.
//

#import "BNRHypnosisViewController.h"
#import "BNRHypnosisView.h"

@interface BNRHypnosisViewController () <UITextFieldDelegate>

@end


@implementation BNRHypnosisViewController

    -(void)loadView
    {
        CGRect frame = [UIScreen mainScreen].bounds;
        BNRHypnosisView *backgroundView = [[BNRHypnosisView alloc]initWithFrame:frame];
        
        CGRect textFieldRect = CGRectMake(40, 70, 240, 30);
        UITextField *textField = [[UITextField alloc]initWithFrame:textFieldRect];
        
        textField.borderStyle = UITextBorderStyleRoundedRect;
        [backgroundView addSubview:textField];
        
        textField.delegate = self;
        
        textField.placeholder = @"Hypnotize me";
        textField.returnKeyType = UIReturnKeyDone;
        
        
        
        self.view = backgroundView;
    }

    - (void)drawHypnoticMessage:(NSString *)message
    {
        for (int i = 0; i < 20; i++) {
            UILabel *messageLabel = [[UILabel alloc] init];
            
            // Configure the label's colors and text
            messageLabel.backgroundColor = [UIColor clearColor];
            messageLabel.textColor = [UIColor blueColor];
            messageLabel.text = message;
            
            // This method resizes the label, which will be relative
            // to the text that it is displaying
            [messageLabel sizeToFit];
            
            // Get a random x value that fits within the hypnosis view's width
            int width = self.view.bounds.size.width - messageLabel.bounds.size.width;
            int x = arc4random() % width;
            
            // Get a random y value that fits within the hypnosis view's height
            int height = self.view.bounds.size.height - messageLabel.bounds.size.height;
            int y = arc4random() % height;
            
            // Update the label's frame
            CGRect frame = messageLabel.frame;
            frame.origin = CGPointMake(x, y);
            messageLabel.frame = frame;
            
            // Add the label to the hierarchy
            [self.view addSubview:messageLabel];
            
            
           
            UIInterpolatingMotionEffect *motionEffectVerti;
            motionEffectVerti = [[UIInterpolatingMotionEffect alloc] initWithKeyPath:@"center.y"
                                                                                type:UIInterpolatingMotionEffectTypeTiltAlongVerticalAxis];
            
            motionEffectVerti.minimumRelativeValue = @-100;
            motionEffectVerti.maximumRelativeValue = @100;
            
            [messageLabel addMotionEffect:motionEffectVerti];
            
            UIInterpolatingMotionEffect *motionEffectHoriz;
            motionEffectHoriz = [[UIInterpolatingMotionEffect alloc] initWithKeyPath:@"center.x"
                                                                           type:UIInterpolatingMotionEffectTypeTiltAlongHorizontalAxis];
            
            motionEffectHoriz.minimumRelativeValue = @-100;
            motionEffectHoriz.maximumRelativeValue = @100;
            
            [messageLabel addMotionEffect:motionEffectHoriz];
            
        }
    }




    -(BOOL)textFieldShouldReturn:(UITextField *)textField
    {
        [self drawHypnoticMessage:textField.text];
        
        textField.text = @"";
        
        [textField resignFirstResponder];
    
        return YES;
    }





    -(instancetype)initWithNibName:(NSString *)nibNameOrNil
                            bundle:(NSBundle *)nibBundleOrNil
    {
        self =  [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
        if (self){
        
            self.tabBarItem.title = @"Hypnotize";
            UIImage *image = [UIImage imageNamed:@"Hypno.png"];
        
            self.tabBarItem.Image = image;
        }
    
    return self;
    
    }




    -(void)viewDidLoad
    {
        [super viewDidLoad];
        
        NSLog(@"BNRHypnosisView loaded its view");
    
    }

@end
