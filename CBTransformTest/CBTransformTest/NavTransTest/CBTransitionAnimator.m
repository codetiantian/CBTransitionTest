//
//  CBTransitionAnimator.m
//  CBTransformTest
//
//  Created by Elaine on 16--18.
//  Copyright © 2016年 yinuo. All rights reserved.
//

#import "CBTransitionAnimator.h"
#import "CBNav1ViewController.h"

@interface CBTransitionAnimator ()

@property (weak, nonatomic) id<UIViewControllerContextTransitioning> transitionContext;

@end

@implementation CBTransitionAnimator

- (NSTimeInterval)transitionDuration:(id<UIViewControllerContextTransitioning>)transitionContext
{
    return 1.5;
}

- (void)animateTransition:(id<UIViewControllerContextTransitioning>)transitionContext
{
    self.transitionContext = transitionContext;
    
    CBNav1ViewController *fromVC = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    UIViewController *toVC = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    UIView *containerView = [transitionContext containerView];
    
    [containerView addSubview:toVC.view];
    
    UIButton *button = fromVC.myButton;
    UIBezierPath *path = [UIBezierPath bezierPathWithOvalInRect:button.frame];
    CGPoint extrenePoint = CGPointMake(button.center.x, button.center.y - CGRectGetHeight(toVC.view.bounds));
    CGFloat radius = sqrtf((extrenePoint.x * extrenePoint.x) + (extrenePoint.y * extrenePoint.y));
    UIBezierPath *circleMaskPathFinal = [UIBezierPath bezierPathWithOvalInRect:CGRectInset(button.frame, -radius, -radius)];
    
    CAShapeLayer *maskLayer = [[CAShapeLayer alloc] init];
    maskLayer.path = circleMaskPathFinal.CGPath;
    toVC.view.layer.mask = maskLayer;
    
    CABasicAnimation *maskLayerAnimation = [CABasicAnimation animationWithKeyPath:@"path"];
    maskLayerAnimation.fromValue = (__bridge id _Nullable)(path.CGPath);
    maskLayerAnimation.toValue = (__bridge id _Nullable)(circleMaskPathFinal.CGPath);
    maskLayerAnimation.duration = [self transitionDuration:transitionContext];
    maskLayerAnimation.delegate = self;
    [maskLayer addAnimation:maskLayerAnimation forKey:nil];
}

- (void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag
{
    [self.transitionContext completeTransition:![self.transitionContext transitionWasCancelled]];
    [self.transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey].view.layer.mask = nil;
}

@end
