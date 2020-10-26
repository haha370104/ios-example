//
//  UIWindow+TMTopController.m
//  iosExample
//
//  Created by luoxiangyu on 2020/10/26.
//

#import "UIWindow+TMTopController.h"

@implementation UIWindow (TMTopController)

- (UIViewController *) topMostController
{
    UIViewController *topController = [self rootViewController];

    while (topController.presentedViewController) {
        topController = topController.presentedViewController;
    }

    return topController;
}

@end
