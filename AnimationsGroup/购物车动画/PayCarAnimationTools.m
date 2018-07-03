//
//  PayCarAnimationTools.m
//  AnimationsGroup
//
//  Created by 信昊 on 2018/7/3.
//  Copyright © 2018年 信昊. All rights reserved.
//

#import "PayCarAnimationTools.h"

@interface PayCarAnimationTools()<CAAnimationDelegate>

@end

@implementation PayCarAnimationTools

+(instancetype)shareTool{
    return [[PayCarAnimationTools alloc]init];
}

-(void)startAnimationWithView:(UIView *)view startRect:(CGRect)rect endPoint:(CGPoint)endPoint finishBlock:(animateFinishBlock)completion{
    _layer = [CALayer layer];
    _layer.contents = view.layer.contents;//把view里面的内容赋值给这个layer的content。
    _layer.contentsGravity = kCAGravityResizeAspectFill;//这个属性是NSString类型，它和UIView的contentMode一样，目的是为了处理内容在图层的边界内如何对齐
    _layer.bounds = rect;
    _layer.cornerRadius = rect.size.width/2;
    _layer.masksToBounds = YES;
    
    
    
    UIWindow *keywindow = [UIApplication sharedApplication].keyWindow;
    [keywindow.layer addSublayer:_layer];
    _layer.position = CGPointMake(rect.origin.x+view.frame.size.width/2, CGRectGetMidY(rect));
    
    UIBezierPath *path = [UIBezierPath bezierPath];
    [path moveToPoint:_layer.position];//起始点
    [path addQuadCurveToPoint:endPoint controlPoint:CGPointMake(ScreenWidth/2, rect.origin.y-50)];//控制点和终点
    
    CAKeyframeAnimation *pathAnimation = [CAKeyframeAnimation animationWithKeyPath:@"position"];//路径动画
    pathAnimation.path = path.CGPath;
    
    CABasicAnimation *rotateAnimate = [CABasicAnimation animationWithKeyPath:@"transform.rotation"];
    rotateAnimate.fromValue = [NSNumber numberWithFloat:0];
    rotateAnimate.toValue = [NSNumber numberWithFloat:12];
    rotateAnimate.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseIn];
    
    CAAnimationGroup *groups = [CAAnimationGroup animation];
    groups.animations = @[pathAnimation,rotateAnimate];
    groups.duration = 1.2f;
    groups.removedOnCompletion=NO;
    groups.fillMode=kCAFillModeForwards;
    groups.delegate = self;
    [_layer addAnimation:groups forKey:@"group"];
    
    if (completion) {
        _animationfinish = completion;
    }
}
-(void)shakeAnimation:(UIView *)shakeView{
    CABasicAnimation *base = [CABasicAnimation animationWithKeyPath:@"transform.translation.y"];
    base.duration = 0.25f;
    base.autoreverses = YES;
    base.fromValue = [NSNumber numberWithFloat:-5];
    base.toValue = [NSNumber numberWithFloat:5];
    [shakeView.layer addAnimation:base forKey:nil];
    
}

-(void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag{
    if (anim == [_layer animationForKey:@"group"]) {
        [_layer removeFromSuperlayer];
        _layer = nil;
        if (_animationfinish) {
            _animationfinish(YES);
        }
    }
}
@end
