//
//  BNRDrawViewController.m
//  TouchTracker
//
//  Created by Marvin Labrador on 10/2/14.
//  Copyright (c) 2014 Marvin Labrador. All rights reserved.
//

#import "BNRDrawViewController.h"
#import "BNRDrawView.h"

@implementation BNRDrawViewController

- (void)loadView
{
    self.view = [[BNRDrawView alloc]initWithFrame:CGRectZero];
}


@end
