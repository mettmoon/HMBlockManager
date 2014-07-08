//
//  HMBlockTableViewController.h
//  HMBlockManager Sample
//
//  Created by Hayden on 2014. 7. 8..
//  Copyright (c) 2014년 Hayden Moon. All rights reserved.
//

#import <UIKit/UIKit.h>
@class HMBlockTableViewController;
@protocol HMBlockTableViewControllerDelegate <NSObject>
- (void)blockTableViewController:(HMBlockTableViewController *)viewController didPickedDate:(NSDate *)pickedDate;
@end
@interface HMBlockTableViewController : UITableViewController
@property (nonatomic, assign) id<HMBlockTableViewControllerDelegate> delegate;
@end
