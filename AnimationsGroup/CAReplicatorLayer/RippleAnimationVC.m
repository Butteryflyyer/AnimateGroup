//
//  RippleAnimationVC.m
//  AnimationsGroup
//
//  Created by 信昊 on 2018/6/29.
//  Copyright © 2018年 信昊. All rights reserved.
//

#import "RippleAnimationVC.h"
#define SCREEN_WIDTH    ([[UIScreen mainScreen] bounds].size.width)                  // 屏幕宽度
#define SCREEN_HEIGHT   ([[UIScreen mainScreen] bounds].size.height)                 // 屏幕长度
@interface RippleAnimationVC ()

@end

@implementation RippleAnimationVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationController.title = @"波纹动画";
    self.view.backgroundColor = [UIColor whiteColor];
    [self initUI];
    // Do any additional setup after loading the view.
}
-(void)initUI{
    
    CAShapeLayer *shapelayer = [CAShapeLayer layer];
    shapelayer.frame = CGRectMake(0, 0, 150, 150);
    shapelayer.path = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(0, 0, 150, 150)].CGPath;
    shapelayer.fillColor = [UIColor blueColor].CGColor;
    shapelayer.opacity = 0.0;
// 动画组
    //alpha
    CABasicAnimation *alpha = [CABasicAnimation animationWithKeyPath:@"opacity"];
    alpha.fromValue = @(1.0);
    alpha.toValue = @(0.0);
    //scale
    CABasicAnimation *scale = [CABasicAnimation animationWithKeyPath:@"transform"];
    CATransform3D identidy = CATransform3DIdentity;
    scale.fromValue = [NSValue valueWithCATransform3D:CATransform3DScale(identidy, 0.0, 0.0, 0.0)];
    scale.toValue = [NSValue valueWithCATransform3D:CATransform3DScale(identidy, 1.0, 1.0, 0.0)];
    
    CAAnimationGroup *group = [CAAnimationGroup animation];
    group.animations = @[alpha,scale];
    group.repeatCount = HUGE;
    group.autoreverses = NO;
    group.duration = 4.0;
    
    [shapelayer addAnimation:group forKey:@"animationGroup"];
    
    CAReplicatorLayer *Rplayer = [CAReplicatorLayer layer];  //复制功能
    Rplayer.instanceCount = 9.0;//数量
    Rplayer.instanceDelay = 0.6;//延迟时间
    Rplayer.frame = CGRectMake(0, 0, 150, 150);
    [Rplayer addSublayer:shapelayer];
    
//    [self.view.layer addSublayer:layer];
    
    UIView * subView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 300, 300)];
    subView.center = CGPointMake(SCREEN_WIDTH/2, SCREEN_HEIGHT/2);
//    subView.backgroundColor = [UIColor redColor];
     [subView.layer addSublayer:Rplayer];
    [self.view addSubview:subView];
   
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
