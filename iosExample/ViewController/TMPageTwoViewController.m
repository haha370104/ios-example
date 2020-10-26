//
//  TMPageTwoViewController.m
//  iosExample
//
//  Created by luoxiangyu on 2020/10/26.
//

#import "TMPageTwoViewController.h"
#import "AppDelegate.h"
#import "UIWindow+TMTopController.h"
#import <Masonry/Masonry.h>

@interface TMPageTwoViewController ()

@property (nonatomic, strong) UILabel *label;

@end

@implementation TMPageTwoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self.view addSubview:self.label];
    [self.label mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(self.view);
    }];
}

#pragma mark - Public

- (void)pushWithParams:(NSDictionary *)params {
    [self setupWithParams:params];
    
    UIWindow *mainWindow = [UIApplication sharedApplication].delegate.window;
    UIViewController *topMostViewController = [mainWindow topMostController];
    if ([topMostViewController isKindOfClass:[UINavigationController class]]) {
        [(UINavigationController *)topMostViewController pushViewController:self animated:YES];
    }
}

- (void)presentWithParams:(NSDictionary *)params {
    [self setupWithParams:params];
    UIWindow *mainWindow = [UIApplication sharedApplication].delegate.window;
    UIViewController *topMostViewController = [mainWindow topMostController];
    [topMostViewController presentViewController:self animated:YES completion:nil];
}

#pragma mark - Private

- (void)setupWithParams: (NSDictionary *)params {
    NSString *content = params[@"content"] ?: @"无内容";
    self.label.text = content;
    [self.label sizeToFit];
}

- (UILabel *)label {
    if (!_label) {
        _label = [[UILabel alloc] init];
        _label.textColor = [UIColor blueColor];
    }
    return _label;
}

@end
