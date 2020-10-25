//
//  TMLabelCollectionViewCell.m
//  iosExample
//
//  Created by luoxiangyu on 2020/10/25.
//

#import "TMLabelCollectionViewCell.h"
#import <Masonry/Masonry.h>

@interface TMLabelCollectionViewCell ()

@property (nonatomic, strong) UILabel *contentLabel;
@property (nonatomic, strong) UILabel *countLabel;

@end

@implementation TMLabelCollectionViewCell

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self setupView];
    }
    return self;
}

- (void)prepareForReuse {
    self.countLabel.text = @"";
}

#pragma mark - Private

- (void)setupView {
    [self.contentView addSubview:self.contentLabel];
    [self.contentView addSubview:self.countLabel];
    
    [self.contentLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self);
        make.left.equalTo(self);
    }];
    
    [self.countLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self);
        make.right.equalTo(self);
    }];
}

#pragma mark - Getter

- (UILabel *)countLabel {
    if (!_countLabel){
        _countLabel = [[UILabel alloc] init];
    }
    return _countLabel;
}

- (UILabel *)contentLabel {
    if (!_contentLabel) {
        _contentLabel = [[UILabel alloc] init];
    }
    
    return _contentLabel;
}

@end
