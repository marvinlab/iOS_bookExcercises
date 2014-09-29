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
        
        self.backgroundColor = [UIColor clearColor];
    }
    return self;
}


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    CGRect bounds = self.bounds;
    
    
    
    UIImage *logoImage = [UIImage imageNamed:@"cyscorpions-logo.png"];
    
    CGPoint center;
    
    
    center.x = bounds.origin.x + bounds.size.width / 2.0;
    center.y = bounds.origin.y + bounds.size.height / 2.0;
    
    CGRect picture = CGRectMake(0,150, bounds.size.width, 200);
    
    float maxRadius = hypot(bounds.size.width, bounds.size.height) / 2.0;
    
    
    UIBezierPath *path = [[UIBezierPath alloc] init];
    
   
    
    for(float currentRadius = maxRadius; currentRadius > 0; currentRadius -= 20){
        
        [path moveToPoint:CGPointMake(center.x + currentRadius, center.y)];
        
        [path addArcWithCenter:center
                        radius:currentRadius
                    startAngle:0
                      endAngle:M_PI * 2.0
                     clockwise:YES];
        
    }
    
    
    
    path.lineWidth = 10.0;
    
    [[UIColor lightGrayColor]setStroke];
    
    [path stroke];
    
    [logoImage drawInRect:picture];
   
}


@end
