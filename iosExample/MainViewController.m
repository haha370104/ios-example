//
//  ViewController.m
//  iosExample
//
//  Created by luoxiangyu on 2020/10/25.
//

#import "MainViewController.h"
#import "TMLabelCollectionViewCell.h"

@interface MainViewController ()<UICollectionViewDataSource, UICollectionViewDelegate>

@property (nonatomic, strong) UICollectionView *collectionView;

@end

@implementation MainViewController

#pragma mark - Lifecycle

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view addSubview:self.collectionView];
    self.view.backgroundColor = [UIColor whiteColor];
}

#pragma mark - UICollectionViewDataSource

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 100;
}

- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    TMLabelCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:NSStringFromClass([TMLabelCollectionViewCell class]) forIndexPath:indexPath];
    
    cell.contentLabel.text = @"测试文字";

    if (indexPath.row % 2 == 0) {
        cell.countLabel.text = [NSString stringWithFormat:@"%ld", indexPath.row];
    }
    
    return cell;
}

#pragma mark - Private

#pragma mark - Getter

- (UICollectionView *)collectionView {
    if (!_collectionView) {
        UICollectionViewFlowLayout *layout =[[UICollectionViewFlowLayout alloc] init];
        [layout setScrollDirection:UICollectionViewScrollDirectionVertical];
        
        layout.itemSize = CGSizeMake(375, 60);
        
        _collectionView = [[UICollectionView alloc] initWithFrame:self.view.bounds collectionViewLayout:layout];
        _collectionView.delegate = self;
        _collectionView.dataSource = self;
        _collectionView.backgroundColor = [UIColor whiteColor];
        
        [_collectionView registerClass:[TMLabelCollectionViewCell class] forCellWithReuseIdentifier:NSStringFromClass([TMLabelCollectionViewCell class])];
    }
    return _collectionView;
}

@end
