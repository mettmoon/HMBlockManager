//
//  HMDetailViewController.m
//  HMBlockManager Sample
//
//  Created by Hayden on 2014. 7. 8..
//  Copyright (c) 2014년 Hayden Moon. All rights reserved.
//

#import "HMDetailViewController.h"
#import "HMBlockTableViewController.h"
#import "HMBlockManager.h"
#import "HMMainTableViewController.h"

@interface HMDetailViewController ()<HMBlockTableViewControllerDelegate>
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *identifierLabel;
@property (weak, nonatomic) IBOutlet UILabel *blockStatusLabel;
@property (weak, nonatomic) IBOutlet UITableViewCell *unblockCell;

@end

@implementation HMDetailViewController
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    if([segue.identifier isEqualToString:@"Block"]){
        HMBlockTableViewController *viewController = segue.destinationViewController;
        viewController.delegate = self;
        viewController.title = self.dataDictionary[kTitle];
    }
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self loadData];
}
- (void)loadData{
    self.titleLabel.text = self.dataDictionary[kTitle];
    self.identifierLabel.text = self.dataDictionary[kIdentifier];
    NSDate *blockDate = [self.blockManager endDateWithIdentifier:self.dataDictionary[kIdentifier]];
    BOOL isBlock = [self.blockManager isBlockIdentifier:self.dataDictionary[kIdentifier]];
    NSString *statusString = isBlock?@"Blocked":@"Not Blocked";
    if(blockDate){
        NSDateFormatter *dateFormatter = [NSDateFormatter new];
        [dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
        statusString = [statusString stringByAppendingFormat:@"(end date:%@",[dateFormatter stringFromDate:blockDate]];
    }
    self.blockStatusLabel.text = statusString;
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma mark UITableViewDelegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if([tableView cellForRowAtIndexPath:indexPath] == self.unblockCell){
        [self.blockManager removeBlockIdentifier:self.dataDictionary[kIdentifier]];
        [self loadData];
        [self.tableView reloadData];
        [self.delegate detailViewControllerDidChanged:self];
    }
}
#pragma mark HMBlockTableViewControllerDelegate
- (void)blockTableViewController:(HMBlockTableViewController *)viewController didPickedDate:(NSDate *)pickedDate{
    [self.blockManager setBlockIdentifier:self.dataDictionary[kIdentifier] endDate:pickedDate];
    [self.delegate detailViewControllerDidChanged:self];
    [self loadData];
    [self.tableView reloadData];
    [self.navigationController popToViewController:self animated:YES];
}
@end
