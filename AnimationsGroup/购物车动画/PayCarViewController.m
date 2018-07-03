//
//  PayCarViewController.m
//  AnimationsGroup
//
//  Created by 信昊 on 2018/7/3.
//  Copyright © 2018年 信昊. All rights reserved.
//

#import "PayCarViewController.h"
#import "PayCarAnimationTools.h"

@interface PayCarViewController ()
@property(nonatomic,strong)UIImageView *Start;
@property(nonatomic,strong)UIView *end;
@end

@implementation PayCarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self initUI];
    // Do any additional setup after loading the view.
}
-(void)initUI{
    UIImageView *startView = [[UIImageView alloc]initWithFrame:CGRectMake(100, 200, 50, 50)];
    startView.image = [UIImage imageNamed:@"watch"];
    startView.userInteractionEnabled = YES;
    [self.view addSubview:startView];
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(click)];
    [startView addGestureRecognizer:tap];
    _Start = startView;
    
    
    UIView *endView = [[UIView alloc]initWithFrame:CGRectMake(300, 500, 50, 50)];
    [endView setBackgroundColor:[UIColor redColor]];
    [self.view addSubview:endView];
    self.end = endView;
}
-(void)click{
    [[PayCarAnimationTools shareTool]startAnimationWithView:_Start startRect:CGRectMake(100, 200, 50, 50) endPoint:CGPointMake(300, 500) finishBlock:^(BOOL finish) {
        NSLog(@"%ld",finish);
        [[PayCarAnimationTools shareTool]shakeAnimation:self.end];
        
    }];
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
