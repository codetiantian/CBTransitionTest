//
//  TodayViewController.m
//  CBToday
//
//  Created by Elaine on 16--22.
//  Copyright © 2016年 yinuo. All rights reserved.
//

#import "TodayViewController.h"
#import <NotificationCenter/NotificationCenter.h>

@interface TodayViewController () <NCWidgetProviding>

@property (strong, nonatomic) UIView *contentView;
@property (strong, nonatomic) UIButton *btnTest;

@end

@implementation TodayViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    self.preferredContentSize = CGSizeMake(0, 200);
    
    CGSize mySize = [UIScreen mainScreen].bounds.size;
    self.contentView = [[UIView alloc]  initWithFrame:CGRectMake(0, 0, mySize.width, 200)];
    self.contentView.backgroundColor = [UIColor greenColor];
    [self.view addSubview:self.contentView];
    
    self.btnTest = [UIButton buttonWithType:UIButtonTypeCustom];
    self.btnTest.frame = CGRectMake(20, 20, mySize.width - 40, 50);
    [self.btnTest setTitle:[[NSDate date] description] forState:UIControlStateNormal];
    self.btnTest.backgroundColor = [UIColor redColor];
    [self.btnTest addTarget:self action:@selector(actionTest) forControlEvents:UIControlEventTouchUpInside];
    [self.contentView addSubview:self.btnTest];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)widgetPerformUpdateWithCompletionHandler:(void (^)(NCUpdateResult))completionHandler {
    // Perform any setup necessary in order to update the view.
    
    // If an error is encountered, use NCUpdateResultFailed
    // If there's no update required, use NCUpdateResultNoData
    // If there's an update, use NCUpdateResultNewData

    completionHandler(NCUpdateResultNewData);
}

- (UIEdgeInsets)widgetMarginInsetsForProposedMarginInsets:(UIEdgeInsets)defaultMarginInsets
{
    return UIEdgeInsetsZero;
}


#pragma mark - 按钮响应事件
- (void)actionTest
{
    [self.btnTest setTitle:@"111111" forState:UIControlStateNormal];
}

@end
