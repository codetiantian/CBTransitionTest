//
//  ViewController.m
//  CBTransformTest
//
//  Created by Elaine on 16--16.
//  Copyright © 2016年 yinuo. All rights reserved.
//

#import "ViewController.h"
#import "CBFristViewController.h"
#import "CBTransformAnimation.h"

@interface ViewController () <UIViewControllerTransitioningDelegate>

@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
- (IBAction)turnToButtonClicked;

@property (weak, nonatomic) CBFristViewController *firstVC;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.titleLabel.text = @"11";
}

//  跳转按钮实现
- (IBAction)turnToButtonClicked {
    CBFristViewController *firstVC = [self.storyboard instantiateViewControllerWithIdentifier:@"CBFirstVC"];
    firstVC.transitioningDelegate = self;
    self.firstVC = firstVC;
    
    [self presentViewController:firstVC animated:YES completion:nil];
}

- (id<UIViewControllerAnimatedTransitioning>)animationControllerForPresentedController:(UIViewController *)presented presentingController:(UIViewController *)presenting sourceController:(UIViewController *)source
{
    if ([presented isEqual:self.firstVC]) {
        return [CBTransformAnimation new];
    }
    
    return nil;
}


@end
