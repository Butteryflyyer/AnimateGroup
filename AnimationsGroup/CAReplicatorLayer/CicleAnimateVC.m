//
//  CicleAnimateVC.m
//  AnimationsGroup
//
//  Created by 信昊 on 2018/7/1.
//  Copyright © 2018年 信昊. All rights reserved.
//

#import "CicleAnimateVC.h"
#define SCREEN_WIDTH    ([[UIScreen mainScreen] bounds].size.width)                  // 屏幕宽度
#define SCREEN_HEIGHT   ([[UIScreen mainScreen] bounds].size.height)                 // 屏幕长度
@interface CicleAnimateVC ()

@end

@implementation CicleAnimateVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self initUI];
    // Do any additional setup after loading the view.
}
-(void)initUI{
    
    CAReplicatorLayer *replicatorLayer = [CAReplicatorLayer layer];
    replicatorLayer.frame = CGRectMake(100, 100, 8, 8);
    //闪动点
    CALayer *dot = [CALayer layer];
    dot.bounds = CGRectMake(0, 0, 8, 8);
    dot.cornerRadius = 4;
    dot.masksToBounds = YES;
    dot.position = CGPointMake(60,10);
    dot.backgroundColor = [UIColor blueColor].CGColor;
    [replicatorLayer addSublayer:dot];
    
    
    NSInteger count = 12;
    replicatorLayer.instanceCount = count;
    CGFloat angel  = 2* M_PI/count;
    replicatorLayer.instanceTransform = CATransform3DMakeRotation(angel, 0, 0, 1);
    //添加动画
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
    CFTimeInterval duration = 1.5;
    animation.duration = duration;
    animation.fromValue = @1.0;
    animation.toValue = @0.1;
    animation.repeatCount = MAXFLOAT;
    animation.removedOnCompletion = NO;
    animation.fillMode = kCAFillModeForwards;
    [dot addAnimation:animation forKey:nil];
    replicatorLayer.instanceDelay = duration/ count;
    dot.transform = CATransform3DMakeScale(0.01, 0.01, 0.01);
    
    UIView * subView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 300, 300)];
    subView.center = CGPointMake(SCREEN_WIDTH/2, SCREEN_HEIGHT/2);
    //    subView.backgroundColor = [UIColor redColor];
    [subView.layer addSublayer:replicatorLayer];
   
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
