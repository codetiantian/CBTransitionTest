//
//  CBNav2ViewController.m
//  CBTransformTest
//
//  Created by Elaine on 16--18.
//  Copyright © 2016年 yinuo. All rights reserved.
//

#import "CBNav2ViewController.h"

@interface CBNav2ViewController ()


- (IBAction)myButtonClicked;
@end

@implementation CBNav2ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.myButton.layer.cornerRadius = 22.0f;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)backToRootVC
{
    [self.navigationController popViewControllerAnimated:YES];
}

- (IBAction)myButtonClicked {
    [self backToRootVC];
}
@end
