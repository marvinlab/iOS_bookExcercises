//
//  BNRDrawView.m
//  TouchTracker
//
//  Created by Marvin Labrador on 10/2/14.
//  Copyright (c) 2014 Marvin Labrador. All rights reserved.
//

#import "BNRDrawView.h"
#import "BNRLine.h"

@interface BNRDrawView ()


@property(nonatomic,strong) NSMutableDictionary *linesInProgress;
@property(nonatomic,strong) NSMutableArray *finishedLines;

@property(nonatomic, weak) BNRLine *selectedLine;

@end





@implementation BNRDrawView

- (id) initWithFrame:(CGRect)r
{
    self = [super initWithFrame:r];
    
    if(self){
        self.linesInProgress = [[NSMutableDictionary alloc]init];
        self.finishedLines = [[NSMutableArray alloc]init];
        self.backgroundColor = [UIColor grayColor];
        self.multipleTouchEnabled = YES;
        
        UITapGestureRecognizer *doubleTapRecognizer =
                    [[UITapGestureRecognizer alloc]initWithTarget:self
                                                          action:@selector(doubleTap:)];
        doubleTapRecognizer.numberOfTapsRequired = 2;
        doubleTapRecognizer.delaysTouchesBegan = YES;
    
        UITapGestureRecognizer *tapRecognizer =
        [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tap:)];
        
        
        tapRecognizer.delaysTouchesBegan = YES;
        [tapRecognizer requireGestureRecognizerToFail:doubleTapRecognizer];
        
        
        [self addGestureRecognizer:doubleTapRecognizer];
        [self addGestureRecognizer:tapRecognizer];
        
        
        
    }
    
    return self;
}

- (void)strokeLine:(BNRLine *)line
{
    
    UIBezierPath *bp = [UIBezierPath bezierPath];
    bp.lineWidth = 10;
    bp.lineCapStyle = kCGLineCapRound;
    
    [bp moveToPoint:line.begin];
    [bp addLineToPoint:line.end];
    [bp stroke];
    
}


- (void)drawRect:(CGRect)rect
{
    [[UIColor blackColor]set];
    
    for (BNRLine *line in self.finishedLines) {
        [self strokeLine:line];
    }
 
        
        [[UIColor redColor]set];
    for (NSValue *key in self.linesInProgress) {
        [self strokeLine:self.linesInProgress[key]];
    }

    
    if (self.selectedLine) {
        [[UIColor greenColor]set];
        [self strokeLine:self.selectedLine];
    }
    
    
}

- (void)touchesBegan:(NSSet *)touches
           withEvent:(UIEvent *)event
{
//    UITouch *t = [touches anyObject];
//    
//    CGPoint location = [t locationInView:self];
//    
//    self.currentLine = [[BNRLine alloc]init];
//    self.currentLine.begin = location;
//    self.currentLine.end = location;
    
    NSLog(@"%@", NSStringFromSelector(_cmd));
    
    for (UITouch *t in touches) {
        CGPoint location = [t locationInView:self];
        BNRLine *line = [[BNRLine alloc]init];
        
        line.begin = location;
        line.end = location;
        
        NSValue *key = [NSValue valueWithNonretainedObject:t];
        self.linesInProgress[key] = line;
    }
    
    [self setNeedsDisplay];
    
}


- (void)touchesMoved:(NSSet *)touches
           withEvent:(UIEvent *)event
{
    
//    UITouch *t = [touches anyObject];
//    CGPoint location = [t locationInView:self];
//
//    self.currentLine.end = location;
    
    
    NSLog(@"%@",NSStringFromSelector(_cmd));
    
    for(UITouch *t in touches){
        NSValue *key = [NSValue valueWithNonretainedObject:t];
        BNRLine *line = self.linesInProgress[key];
        line.end = [t locationInView:self];
    }
    
    
    
    
    [self setNeedsDisplay];
    
    
}


-(void)touchesEnded:(NSSet *)touches
          withEvent:(UIEvent *)event
{
//    [self.finishedLines addObject:self.currentLine];
//    
//    self.currentLine = nil;0
    
    
    
    NSLog(@"%@",NSStringFromSelector(_cmd));
    
    for(UITouch *t in touches){
        NSValue *key = [NSValue valueWithNonretainedObject:t];
        BNRLine *line = self.linesInProgress[key];
    
        [self.finishedLines addObject:line];
        [self.linesInProgress removeObjectForKey:key];
    }
    
    
    
    [self setNeedsDisplay];
    
   
    
}



- (void)touchesCancelled:(NSSet *)touches
               withEvent:(UIEvent *)event
{
    
    NSLog(@"%@", NSStringFromSelector(_cmd));
    
    for (UITouch *t in touches) {
        NSValue *key = [NSValue valueWithNonretainedObject:t];
        [self.linesInProgress removeObjectForKey:key];
    }
    
    [self setNeedsDisplay];
    
}


- (void)doubleTap: (UIGestureRecognizer *)gr
{
    NSLog(@"Recognized DoubleTap");
    [self.linesInProgress removeAllObjects];
    [self.finishedLines removeAllObjects];
    [self setNeedsDisplay];
    
}


- (void)tap: (UIGestureRecognizer *)gr
{
    
    NSLog(@"Recognized Tap!");
    
    CGPoint point = [gr locationInView:self];
    self.selectedLine = [self lineAtPoint:point];
    
    [self setNeedsDisplay];
    
}



- (BNRLine *)lineAtPoint:(CGPoint)p
{
    
    for (BNRLine *l in self.finishedLines) {
        CGPoint start = l.begin;
        CGPoint end = l.end;
        
        
        for (float t = 0.0; t<= 10; t+=0.05) {
            float x = start.x + t * (end.x - start.x);
            float y = start.y + t * (end.y - start.y);
            
            if (hypot(x-p.x, y-p.y) < 20.0){
                return l;
            }
        }
    }
    return nil;
}

@end
