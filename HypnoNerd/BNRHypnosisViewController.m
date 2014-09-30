//
//  BNRHypnosisViewController.m
//  HypnoNerd
//
//  Created by Marvin Labrador on 9/29/14.
//  Copyright (c) 2014 Marvin Labrador. All rights reserved.
//

#import "BNRHypnosisViewController.h"
#import "BNRHypnosisView.h"

@implementation BNRHypnosisViewController

    -(void)loadView
    {
        CGRect frame = [UIScreen mainScreen].bounds;
        BNRHypnosisView *backgroundView = [[BNRHypnosisView alloc]initWithFrame:frame];
        
        self.view = backgroundView;
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
