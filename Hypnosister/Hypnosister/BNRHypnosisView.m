//
//  BNRHypnosisView.m
//  Hypnosister
//
//  Created by Marvin Labrador on 9/29/14.
//  Copyright (c) 2014 Marvin Labrador. All rights reserved.
//

#import "BNRHypnosisView.h"

@implementation BNRHypnosisView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    CGRect bounds = self.bounds;
    
    CGPoint center;
    
    center.x = bounds.origin.x + bounds.size.width / 2.0;
    center.y = bounds.origin.y + bounds.size.height / 2.0;
    
    float radius = MIN(bounds.size.width, bounds.size.height) / 2.0;
    
    UIBezierPath *path = [[UIBezierPath alloc] init];
    
    [path addArcWithCenter:center
                    radius:radius
                startAngle:0
                  endAngle:M_PI * 2.0
                 clockwise:YES];
    path.lineWidth = 10.0;
    
    [path stroke];
}


@end
