//
//  CBTransformAnimation.m
//  CBTransformTest
//
//  Created by Elaine on 16--16.
//  Copyright © 2016年 yinuo. All rights reserved.
//

#import "CBTransformAnimation.h"
#import "ViewController.h"

@implementation CBTransformAnimation

- (NSTimeInterval)transitionDuration:(id<UIViewControllerContextTransitioning>)transitionContext
{
    return 1.5f;
}

- (void)animateTransition:(id<UIViewControllerContextTransitioning>)transitionContext
{
    //  当前控制器
    ViewController *fromVC = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    
    //  将要跳转到的控制器
    UIViewController *toVC = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    
    //  控制view
    UIView *containerView = [transitionContext containerView];
    [containerView addSubview:toVC.view];
    
    toVC.view.layer.zPosition = -1;
    
    //  获取动画的时间
    NSTimeInterval durationTime = [self transitionDuration:transitionContext];
    
    [UIView animateWithDuration:durationTime delay:0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
        fromVC.iconImageView.layer.transform = CATransform3DMakeScale(2, 2, 1);
//        fromVC.view.alpha = 0;
    } completion:^(BOOL finished) {
        if (finished) {
            [transitionContext completeTransition:![transitionContext transitionWasCancelled]];
            toVC.view.layer.zPosition = 0;
//            fromVC.view.alpha = 1;
            fromVC.iconImageView.layer.transform = CATransform3DMakeScale(1, 1, 1);
            fromVC.view.transform = CGAffineTransformIdentity;
        }

    }];
}

@end
