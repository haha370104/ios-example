//
//  TMCollectionViewController.h
//  iosExample
//
//  Created by luoxiangyu on 2020/10/25.
//

#import <UIKit/UIKit.h>

@protocol TMCollectionViewControllerDelegate <NSObject>

- (void)reachCellForIndex: (NSIndexPath *)indexPath;

@end

NS_ASSUME_NONNULL_BEGIN

@interface TMCollectionViewController : UIViewController

@property (nonatomic, weak) id<TMCollectionViewControllerDelegate> delegate;
@property (nonatomic, copy) void (^reachCellForIndexCallback)(NSIndexPath *indexPath);

@end

NS_ASSUME_NONNULL_END
