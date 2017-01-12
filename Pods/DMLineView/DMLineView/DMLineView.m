//
//  DMLineView.m
//  DamaiPlayPhone
//
//  Created by 付书炯 on 15/5/6.
//  Copyright (c) 2015年 陈彦岐. All rights reserved.
//

#import "DMLineView.h"

@implementation DMLineView

+ (instancetype)lineViewWithColor:(UIColor *)aColor
{
    DMLineView *lineView = [DMLineView new];
    lineView.lineColor = aColor;
    return lineView;
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor clearColor];
    }
    return self;
}

- (id)init
{
    self = [super init];
    if (self) {
        self.backgroundColor = [UIColor clearColor];
    }
    return self;
}

- (void)drawRect:(CGRect)rect
{
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    CGColorRef color;
    if (self.lineColor) {
        color = self.lineColor.CGColor;
    } else {
        color = [[UIColor blackColor] colorWithAlphaComponent:0.15].CGColor;
    }
    CGContextSetStrokeColorWithColor(ctx, color);
    CGContextSetLineWidth(ctx, CGRectGetHeight(rect));
    CGContextBeginPath(ctx);
    CGContextMoveToPoint(ctx, 0, CGRectGetHeight(rect) / 2);
    CGContextAddLineToPoint(ctx, CGRectGetWidth(rect), CGRectGetHeight(rect) / 2);
    CGContextStrokePath(ctx);
    CGContextClosePath(ctx);
}

- (void)setLineColor:(UIColor *)lineColor
{
    if (_lineColor != lineColor) {
        _lineColor = lineColor;
        [self setNeedsDisplay];
    }
}
@end
