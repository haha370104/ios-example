//
//  UIViewController+UIViewController_TMShowTimes.h
//  iosExample
//
//  Created by luoxiangyu on 2020/10/25.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIViewController (TMShowTimes)

@property (nonatomic, assign, readonly) NSInteger showTimes;

- (void)addShowTimesOnce;

@end

NS_ASSUME_NONNULL_END
