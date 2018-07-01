//
//  rotateAnamationVC.m
//  AnimationsGroup
//
//  Created by 信昊 on 2018/6/29.
//  Copyright © 2018年 信昊. All rights reserved.
//

#import "rotateAnamationVC.h"

@interface rotateAnamationVC ()

@end

@implementation rotateAnamationVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self initUI];
    // Do any additional setup after loading the view.
}
-(void)initUI{
    CAShapeLayer *layer = [CAShapeLayer layer];
    layer.path = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(0, 0, 25, 25)].CGPath;
    layer.fillColor = [UIColor blueColor].CGColor;
    layer.frame = CGRectMake(0, 0, 25, 25);
    
    CABasicAnimation *scale = [CABasicAnimation animationWithKeyPath:@"transform"];
    CATransform3D identity  = CATransform3DIdentity;
    
    CATransform3D fromValue = CATransform3DRotate(identity, 0.0, 0.0, 0.0, 0.0);
    scale.fromValue = [NSValue valueWithCATransform3D:fromValue];
    
    CATransform3D toValue = CATransform3DTranslate(identity, 75, 0.0, 0.0);
    toValue = CATransform3DRotate(toValue,M_PI, 0.0, 0.0, 1.0);
    
    scale.toValue = [NSValue valueWithCATransform3D:toValue];
    scale.autoreverses = NO;

    scale.repeatCount = HUGE;
    scale.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    scale.duration = 2;
    
    
    [layer addAnimation:scale forKey:@"scaleAnimation"];
    
    CAReplicatorLayer *Rlayer = [CAReplicatorLayer layer];
    Rlayer.instanceCount = 6;
    Rlayer.instanceDelay = 0;
    Rlayer.frame = CGRectMake(0, 0, 25, 25);
    CATransform3D trans3d = CATransform3DIdentity;
    trans3d = CATransform3DTranslate(trans3d, 75, 0, 0);
    trans3d = CATransform3DRotate(trans3d, 60*M_PI/180, 0, 0, 1.0);
    
    Rlayer.instanceTransform = trans3d;
    [Rlayer addSublayer:layer];
    
    UIView * subView = [[UIView alloc]initWithFrame:CGRectMake(100, 100, 300, 300)];
    subView.center = CGPointMake(200,250);
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
