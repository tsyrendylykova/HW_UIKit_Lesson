//
//  LCTCustomView.m
//  HitTestExample
//
//  Created by Цырендылыкова Эржена on 16/03/2019.
//  Copyright © 2019 Erzhena Tsyrendylykova. All rights reserved.
//

#import "LCTCustomView.h"

@implementation LCTCustomView

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    NSLog(@"touchesBegan");
    UITouch *touch = touches.anyObject;
    startPoint = [touch locationInView: self];
}

-(void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    CGPoint touchPoint = [[touches anyObject] locationInView:self.superview];
    
    touchPoint.x -= startPoint.x;
    touchPoint.y -= startPoint.y;
    CGRect frm = [self frame];
    frm.origin = touchPoint;
    [self setFrame:frm];
}

-(void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    NSLog(@"touchesEnded");
}

-(void)touchesCancelled:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    NSLog(@"touchesCancelled");
}

@end
