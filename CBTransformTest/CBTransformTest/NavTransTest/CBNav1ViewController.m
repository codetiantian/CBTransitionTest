//
//  CBNav1ViewController.m
//  CBTransformTest
//
//  Created by Elaine on 16--18.
//  Copyright © 2016年 yinuo. All rights reserved.
//

#import "CBNav1ViewController.h"
#import "CBNav2ViewController.h"

@interface CBNav1ViewController ()


- (IBAction)myButtonClicked;
@end

@implementation CBNav1ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self.navigationController setNavigationBarHidden:YES];
    self.myButton.layer.cornerRadius = 22.0f;
    
    [self test];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)loadNav2VC
{
    CBNav2ViewController *nav2VC = [self.storyboard instantiateViewControllerWithIdentifier:@"CBNav2VC"];
    
    [self.navigationController pushViewController:nav2VC animated:YES];
}

- (IBAction)myButtonClicked {
    [self loadNav2VC];
}

#pragma mark - 测试
- (void)test
{
    for (int i = 0; i < 10; i++) {
        NSLog(@"-------%i",i);
    }
}

@end
