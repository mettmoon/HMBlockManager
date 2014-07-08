//
//  HMDetailViewController.h
//  HMBlockManager Sample
//
//  Created by Hayden on 2014. 7. 8..
//  Copyright (c) 2014년 Hayden Moon. All rights reserved.
//

#import <UIKit/UIKit.h>
@class HMBlockManager;
@class HMDetailViewController;
@protocol HMDetailViewControllerDelegate <NSObject>

- (void)detailViewControllerDidChanged:(HMDetailViewController *)viewController;

@end
@interface HMDetailViewController : UITableViewController
@property (nonatomic, weak) HMBlockManager *blockManager;
@property (nonatomic, weak) NSDictionary *dataDictionary;
@property (nonatomic, assign) id<HMDetailViewControllerDelegate> delegate;
@end
