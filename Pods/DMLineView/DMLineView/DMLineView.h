//
//  DMLineView.h
//  DamaiPlayPhone
//
//  Created by 付书炯 on 15/5/6.
//  Copyright (c) 2015年 陈彦岐. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DMLineView : UIView

@property (nonatomic, strong) UIColor *lineColor;

+ (instancetype)lineViewWithColor:(UIColor *)aColor;

@end
