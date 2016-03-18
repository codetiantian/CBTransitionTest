//
//  CBNavigationDelegate.m
//  CBTransformTest
//
//  Created by Elaine on 16--18.
//  Copyright © 2016年 yinuo. All rights reserved.
//

#import "CBNavigationDelegate.h"
#import "CBTransitionAnimator.h"

@implementation CBNavigationDelegate

- (id<UIViewControllerAnimatedTransitioning>)navigationController:(UINavigationController *)navigationController animationControllerForOperation:(UINavigationControllerOperation)operation fromViewController:(UIViewController *)fromVC toViewController:(UIViewController *)toVC
{
    return [[CBTransitionAnimator alloc] init];
}

@end
