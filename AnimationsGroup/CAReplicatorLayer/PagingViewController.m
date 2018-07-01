//
//  PagingViewController.m
//  AnimationsGroup
//
//  Created by 信昊 on 2018/6/29.
//  Copyright © 2018年 信昊. All rights reserved.
//

#import "PagingViewController.h"

@interface PagingViewController ()

@end

@implementation PagingViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self initUI];
    // Do any additional setup after loading the view.
}
-(void)initUI{
    
    CAShapeLayer *layer = [CAShapeLayer layer];
    layer.frame = CGRectMake(100,100, 50, 50);
    layer.path = [UIBezierPath bezierPathWithRect:CGRectMake(0, 0, 50, 50)].CGPath;
    layer.fillColor = [UIColor blueColor].CGColor;
    
    CABasicAnimation *roteAnimation = [CABasicAnimation animationWithKeyPath:@"transform"]; //围着x轴转
    roteAnimation.fromValue = [NSValue valueWithCATransform3D:CATransform3DRotate(CATransform3DIdentity, 0, 1, 0, 0)];
    roteAnimation.toValue = [NSValue valueWithCATransform3D:CATransform3DRotate(CATransform3DIdentity, M_PI,  1, 0, 0)];
    roteAnimation.duration = 1.0;
    roteAnimation.repeatCount = HUGE;
//    roteAnimation.autoreverses = YES;
    
    [layer addAnimation:roteAnimation forKey:@"rote"];
    
    CAReplicatorLayer *Rllayer = [CAReplicatorLayer layer];
    Rllayer.instanceDelay = 1;
    Rllayer.instanceCount = 8;
    Rllayer.instanceTransform = CATransform3DTranslate(CATransform3DIdentity, 0, 60, 0);
    [Rllayer addSublayer:layer];
    
//    UIView * subView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 400, 600)];
//    subView.center = CGPointMake(100, 300);
//    //    subView.backgroundColor = [UIColor redColor];
//    [subView.layer addSublayer:Rllayer];
    [self.view.layer addSublayer:Rllayer];
    
    
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
