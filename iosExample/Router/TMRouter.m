//
//  TMRouter.m
//  iosExample
//
//  Created by luoxiangyu on 2020/10/26.
//

#import "TMRouter.h"

@implementation TMRouter

+ (instancetype)sharedInstance {
    static TMRouter *sharedInstance  = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [[TMRouter alloc] init];
    });
    return sharedInstance;
}

# pragma mark - Public

- (void)doActionWithURL: (NSURLComponents *)url {
    NSString *target = url.host;
    NSString *action = url.path;
    NSArray<NSURLQueryItem *> *items = url.queryItems;
    
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    [items enumerateObjectsUsingBlock:^(NSURLQueryItem * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        params[obj.name] = obj.value;
    }];
    
    Class targetClass = NSClassFromString(target);
    id instance;
    if ([targetClass respondsToSelector:@selector(sharedInstance)]) {
        instance = [targetClass sharedInstance];
    } else {
        instance = [[targetClass alloc] init];
    }
    
    SEL selector = NSSelectorFromString([NSString stringWithFormat:@"%@:", [action substringFromIndex:1]]);

//  下面这一段代码其实就相当于 [instance performSelector:selector withObject:params] 代码。但是直接使用 performSelector 会报一个内存泄漏警告
    IMP imp = [instance methodForSelector:selector];
    void (*func)(id, SEL, id) = (void *)imp;
    func(instance, selector, params);
    
    return;
}

@end
