//
//  CBFristViewController.m
//  CBTransformTest
//
//  Created by Elaine on 16--16.
//  Copyright © 2016年 yinuo. All rights reserved.
//

#import "CBFristViewController.h"

@interface CBFristViewController ()

@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
- (IBAction)backButtonClicked;
@end

@implementation CBFristViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.titleLabel.text = @"22";
}

- (IBAction)backButtonClicked {
    [self dismissViewControllerAnimated:YES completion:nil];
}
@end
