//
//  ViewController.m
//  iosExample
//
//  Created by luoxiangyu on 2020/10/25.
//

#import "MainViewController.h"
#import "TMCollectionViewController.h"
#import <Masonry/Masonry.h>

@interface MainViewController ()<TMCollectionViewControllerDelegate>

@property (nonatomic, strong) UIButton *pushCollectionViewButton;
@property (nonatomic, strong) UIButton *presentCollectionViewButton;

@property (nonatomic, strong) UILabel *contentLabel;

@end

@implementation MainViewController

#pragma mark - Lifecycle

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.edgesForExtendedLayout = UIRectEdgeNone;

    [self.view addSubview:self.pushCollectionViewButton];
    [self.view addSubview:self.presentCollectionViewButton];
    [self.view addSubview:self.contentLabel];
    
    [self.contentLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.view);
        make.bottom.equalTo(self.view).with.offset(-30);
    }];
}

#pragma mark - TMCollectionViewControllerDelegate

- (void)reachCellForIndex:(NSIndexPath *)indexPath {
    [self setContent:[NSString stringWithFormat:@"到达：%ld", indexPath.row]];
}

#pragma mark - Private

- (void)setContent: (NSString *)content {
    self.contentLabel.text = content;
    [self.contentLabel sizeToFit];
}

#pragma mark - Event

- (void)pushButtonClick {
    TMCollectionViewController *controller = [[TMCollectionViewController alloc] init];
    [self.navigationController pushViewController:controller animated:YES];
    
    controller.delegate = self;
}

- (void)presentButtonClick {
    TMCollectionViewController *controller = [[TMCollectionViewController alloc] init];
    UINavigationController *naviController = [[UINavigationController alloc] initWithRootViewController:controller];
    [self presentViewController:naviController animated:YES completion:^{
        NSLog(@"present 结束");
    }];
    
    __weak typeof(self) weakSelf = self;
    controller.reachCellForIndexCallback = ^(NSIndexPath * _Nonnull indexPath) {
        [weakSelf setContent:[NSString stringWithFormat:@"到达：%ld", indexPath.row]];
    };
}

#pragma mark - Getter

- (UIButton *)pushCollectionViewButton {
    if (!_pushCollectionViewButton) {
        _pushCollectionViewButton = [[UIButton alloc] initWithFrame:CGRectMake(20, 100, 100, 44)];
        [_pushCollectionViewButton setTitle:@"打开 collection - push" forState:UIControlStateNormal];
        [_pushCollectionViewButton addTarget:self action:@selector(pushButtonClick) forControlEvents:UIControlEventTouchUpInside];
        [_pushCollectionViewButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    }
    return _pushCollectionViewButton;
}

- (UIButton *)presentCollectionViewButton {
    if (!_presentCollectionViewButton) {
        _presentCollectionViewButton = [[UIButton alloc] initWithFrame:CGRectMake(375 - 20 - 100, 100, 100, 44)];
        [_presentCollectionViewButton setTitle:@"打开 collection - present" forState:UIControlStateNormal];
        [_presentCollectionViewButton addTarget:self action:@selector(presentButtonClick) forControlEvents:UIControlEventTouchUpInside];
        [_presentCollectionViewButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    }
    return _presentCollectionViewButton;
}

- (UILabel *)contentLabel {
    if (!_contentLabel) {
        _contentLabel = [[UILabel alloc] init];
        [_contentLabel setTextColor:[UIColor blackColor]];
    }
    return _contentLabel;
}

@end
