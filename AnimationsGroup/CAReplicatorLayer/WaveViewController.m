//
//  WaveViewController.m
//  AnimationsGroup
//
//  Created by 信昊 on 2018/6/29.
//  Copyright © 2018年 信昊. All rights reserved.
//

#import "WaveViewController.h"
#define SCREEN_WIDTH    ([[UIScreen mainScreen] bounds].size.width)                  // 屏幕宽度
#define SCREEN_HEIGHT   ([[UIScreen mainScreen] bounds].size.height)                 // 屏幕长度
@interface WaveViewController ()

@end

@implementation WaveViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self initUI];
    // Do any additional setup after loading the view.
}
-(void)initUI{
    CAShapeLayer *layer = [CAShapeLayer layer];
    layer.frame = CGRectMake(0, 0, 50, 50);
    layer.path = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(0, 0, 50, 50)].CGPath;
    layer.fillColor = [UIColor blueColor].CGColor;
    
    CABasicAnimation *scale = [CABasicAnimation animationWithKeyPath:@"transform"];
    
    scale.fromValue = [NSValue valueWithCATransform3D:CATransform3DScale(CATransform3DIdentity, 1.0, 1.0, 0)];
    scale.toValue = [NSValue valueWithCATransform3D:CATransform3DScale(CATransform3DIdentity, 0.2, 0.2, 0)];
    scale.autoreverses = YES;
    scale.duration = 0.5;
    scale.repeatCount = HUGE;
    [layer addAnimation:scale forKey:@"scaleAnimation"];
    
    CAReplicatorLayer *Rlayer = [CAReplicatorLayer layer];
    Rlayer.instanceDelay = 0.2;
    Rlayer.instanceCount = 4;
    Rlayer.instanceTransform = CATransform3DMakeTranslation(50, 0, 0); //每复制一个块向右移动
    Rlayer.frame = CGRectMake(100, 100, 50, 50);
    [Rlayer addSublayer:layer];
    
    UIView * subView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 300, 300)];
    subView.center = CGPointMake(100, SCREEN_HEIGHT/2);
    //    subView.backgroundColor = [UIColor redColor];
    [subView.layer addSublayer:Rlayer];
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
