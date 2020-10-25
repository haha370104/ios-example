//
//  UIViewController+UIViewController_TMShowTimes.m
//  iosExample
//
//  Created by luoxiangyu on 2020/10/25.
//

#import "UIViewController+TMShowTimes.h"
#import <objc/runtime.h>

static void *showTimesKey = &showTimesKey;

@implementation UIViewController (TMShowTimes)

+ (void)load {
    static dispatch_once_t onceToken;
       dispatch_once(&onceToken, ^{
           Class aClass = [self class];
           
           SEL originalSelector = @selector(viewDidAppear:);
           SEL swizzledSelector = @selector(tm_viewDidAppear:);
           
           Method originalMethod = class_getInstanceMethod(aClass, originalSelector);
           Method swizzledMethod = class_getInstanceMethod(aClass, swizzledSelector);
           BOOL didAddMethod =
           class_addMethod(aClass,
                           originalSelector,
                           method_getImplementation(swizzledMethod),
                           method_getTypeEncoding(swizzledMethod));
           
           if (didAddMethod) {
               class_replaceMethod(aClass,
                                                  swizzledSelector,
                                                  method_getImplementation(originalMethod),
                                                  method_getTypeEncoding(originalMethod));
           } else {
               method_exchangeImplementations(originalMethod, swizzledMethod);
           }
       });
}

- (void)tm_viewDidAppear:(BOOL)animated {
    [self tm_viewDidAppear: animated];
    [self addShowTimesOnce];
}

- (void)addShowTimesOnce {
    NSNumber *num = objc_getAssociatedObject(self, &showTimesKey);
    if (!num) {
        num = @(0);
    }
    num = @([num integerValue] + 1);
    objc_setAssociatedObject(self, &showTimesKey, num, OBJC_ASSOCIATION_COPY);
}

- (NSInteger)showTimes {
    NSNumber *num = objc_getAssociatedObject(self, &showTimesKey);
    return [num integerValue];
}

@end
