//
//  PayCarAnimationTools.h
//  AnimationsGroup
//
//  Created by 信昊 on 2018/7/3.
//  Copyright © 2018年 信昊. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
typedef void(^animateFinishBlock)(BOOL finish);

#define ScreenWidth [UIScreen mainScreen].bounds.size.width
#define ScreenHeight [UIScreen mainScreen].bounds.size.height

@interface PayCarAnimationTools : NSObject

@property(nonatomic,strong) CALayer *layer;
@property(nonatomic,strong)animateFinishBlock animationfinish;


+ (instancetype)shareTool;

-(void)startAnimationWithView:(UIView *)view startRect:(CGRect)rect endPoint:(CGPoint)endPoint finishBlock:(animateFinishBlock)completion;



-(void)shakeAnimation:(UIView *)shakeView;
@end
