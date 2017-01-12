//
//  DMGuideView.m
//  DMGuideView
//
//  Created by 陈彦岐 on 2016/11/25.
//  Copyright © 2016年 陈彦岐. All rights reserved.
//

#import "DMGuideView.h"
#import <objc/runtime.h>
#define kDMGuidWindow  [UIApplication sharedApplication].keyWindow

@implementation DMGuideView {
    UIImageView *_imageView;
    NSArray *_imageArray;
    NSUInteger _index;
}

+(id)showGuidViewWithImage:(UIImage *)image completionBlock:(void (^)())block {
    return [DMGuideView showGuidViewWithImages:@[image] completionBlock:block];
}

+(id)showGuidViewWithImages:(NSArray<UIImage *> *)images completionBlock:(void (^)())block {
    if (images.count == 0) {
        return nil;
    }
    DMGuideView *guideView = [[self alloc] initWithImages:images completionBlock:block];
    [guideView show];
    
    return guideView;
}

-(instancetype)initWithImages:(NSArray<UIImage *> *)images  completionBlock:(void (^)())block{
    objc_setAssociatedObject(self, "blockCallback", [block copy], OBJC_ASSOCIATION_RETAIN_NONATOMIC);

    self = [super initWithFrame:[UIScreen mainScreen].bounds];
    if (self) {
        _imageArray = [[NSArray alloc] initWithArray:images];
        [self createSubViews];
    }
    return self;
}

-(void)createSubViews {

    _imageView = [[UIImageView alloc] initWithFrame:self.bounds];
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self
                                                                          action:@selector(imageSelected)];
    [_imageView addGestureRecognizer:tap];
    _imageView.userInteractionEnabled = YES;
    _imageView.image = [_imageArray firstObject];
    [self addSubview:_imageView];
}


-(void)show {
    dispatch_async(dispatch_get_main_queue(), ^{
        [kDMGuidWindow addSubview:self];
    });
}

-(void)imageSelected {
    _index++;
    if (_index < _imageArray.count) {
        _imageView.image = [_imageArray objectAtIndex:_index];
    } else {
        void (^block)() = objc_getAssociatedObject(self, "blockCallback");
        if (block) {
            block();
        }
        [self removeFromSuperview];
    }
}

@end
