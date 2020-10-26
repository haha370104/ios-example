//
//  TMRouter.h
//  iosExample
//
//  Created by luoxiangyu on 2020/10/26.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface TMRouter : NSObject

- (instancetype)init NS_UNAVAILABLE;
+ (instancetype)sharedInstance;

- (void)doActionWithURL: (NSURLComponents *)url;

@end

NS_ASSUME_NONNULL_END
