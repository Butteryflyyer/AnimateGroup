//
//  ViewController.m
//  AnimationsGroup
//
//  Created by 信昊 on 2018/6/29.
//  Copyright © 2018年 信昊. All rights reserved.
//

#import "ViewController.h"
#import "RippleAnimationVC.h"
#import "WaveViewController.h"
#import "PagingViewController.h"
#import "rotateAnamationVC.h"
#import "CicleAnimateVC.h"
#define SCREEN_WIDTH    ([[UIScreen mainScreen] bounds].size.width)                  // 屏幕宽度
#define SCREEN_HEIGHT   ([[UIScreen mainScreen] bounds].size.height)                 // 屏幕长度

@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>
@property(nonatomic,retain)NSArray *dataSourceSection;
@property(nonatomic,retain)NSArray *dataSourceRow;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initData];
    [self initUI];
    
  
    
    
    // Do any additional setup after loading the view, typically from a nib.
}
-(void)initData{
    _dataSourceSection = @[@"CAReplicatorLayer"];
    _dataSourceRow = @[@[@"波纹动画",@"球的波纹",@"翻页",@"旋转",@"球旋转动画Loading"]];
}
-(void)initUI{
    
    UITableView *table = [[UITableView alloc]initWithFrame:CGRectMake(0,0, SCREEN_WIDTH, SCREEN_HEIGHT) style:UITableViewStylePlain];
    table.delegate = self;
    table.dataSource = self;
    [self.view addSubview:table];
    
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return _dataSourceSection.count;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [_dataSourceRow[section] count];
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    }
    cell.textLabel.text = _dataSourceRow[indexPath.section][indexPath.row];
    return cell;
    
}
-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    UIView *header = [[UIView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 60)];
    UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(10, 10, 300, 40)];
    label.text = _dataSourceSection[section];
    [header addSubview:label];
    return header;
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 60;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 0) {
        if (indexPath.row == 0) {
            RippleAnimationVC *vc = [[RippleAnimationVC alloc]init];
            [self.navigationController pushViewController:vc animated:true];
        }
        if (indexPath.row == 1) {
            WaveViewController *vc = [[WaveViewController alloc]init];
            [self.navigationController pushViewController:vc animated:true];
        }
        if (indexPath.row == 2) {
            PagingViewController *vc = [[PagingViewController alloc]init];
            [self.navigationController pushViewController:vc animated:true];
        }
        if (indexPath.row == 3) {
            rotateAnamationVC *vc = [[rotateAnamationVC alloc]init];
            [self.navigationController pushViewController:vc animated:YES];
        }
        if (indexPath.row == 4) {
            CicleAnimateVC *vc = [[CicleAnimateVC alloc]init];
            [self.navigationController pushViewController:vc animated:YES];
        }
    }
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
