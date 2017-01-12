//
//  DMGuideView.h
//  DMGuideView
//  Version 1.0.2
//  Created by 陈彦岐 on 2016/11/25.
//  Copyright © 2016年 陈彦岐. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DMGuideView : UIView


/**
 创建控件的类方法 多张图片

 @param images 需要显示的引导图的数组
 @param block 引导图显示完成并点击消失后调用的block
 */
+(id)showGuidViewWithImages:(NSArray<UIImage *> *)images completionBlock:(void (^)())block;

/**
 创建控件的类方法 单张图片
 
 @param image 需要显示的引导图
 @param block 引导图显示完成并点击消失后调用的block
 */
+(id)showGuidViewWithImage:(UIImage *)image completionBlock:(void (^)())block;

@end
