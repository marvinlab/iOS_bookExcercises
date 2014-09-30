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

@end
