//
//  TMLabelCollectionViewCell.h
//  iosExample
//
//  Created by luoxiangyu on 2020/10/25.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface TMLabelCollectionViewCell : UICollectionViewCell

@property (nonatomic, strong, readonly) UILabel *contentLabel;
@property (nonatomic, strong, readonly) UILabel *countLabel;

@end

NS_ASSUME_NONNULL_END
