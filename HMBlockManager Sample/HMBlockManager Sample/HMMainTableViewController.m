//
//  HMMainTableViewController.m
//  HMBlockManager Sample
//
//  Created by Hayden on 2014. 7. 8..
//  Copyright (c) 2014년 Hayden Moon. All rights reserved.
//

#import "HMMainTableViewController.h"
#import "HMBlockManager.h"
#import "HMDetailViewController.h"

@interface HMMainTableViewController ()<HMDetailViewControllerDelegate>
@property (nonatomic, strong) NSMutableArray *dataArray;
@property (nonatomic, strong) HMBlockManager *blockManager;
@end
NSString const *kIdentifier = @"identifier";
NSString const *kTitle = @"title";
@implementation HMMainTableViewController
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    if([segue.identifier isEqualToString:@"Detail"]){
        HMDetailViewController *viewController = segue.destinationViewController;
        NSIndexPath *indexPath = [self.tableView indexPathForCell:sender];
        viewController.dataDictionary = self.dataArray[indexPath.row];
        viewController.blockManager = self.blockManager;
        viewController.delegate = self;
    }
}
- (void)viewDidLoad
{
    [super viewDidLoad];
    self.blockManager = [[HMBlockManager alloc] initWithRepositoryIdentifier:@"ItemList"];
    self.blockManager.autoSaveMode = YES;//Auto save(other way: Call [HMBlockManager -save] all the time data changed) 
    self.dataArray = [NSMutableArray new];
    [self.dataArray addObject:@{kTitle: @"Cat",kIdentifier:@"1"}];
    [self.dataArray addObject:@{kTitle: @"Fish",kIdentifier:@"2"}];
    [self.dataArray addObject:@{kTitle: @"Dog",kIdentifier:@"3"}];
    [self.dataArray addObject:@{kTitle: @"Man",kIdentifier:@"4"}];
    [self.dataArray addObject:@{kTitle: @"Dragon",kIdentifier:@"5"}];
    [self.dataArray addObject:@{kTitle: @"Snake",kIdentifier:@"6"}];
    [self.dataArray addObject:@{kTitle: @"Spider",kIdentifier:@"7"}];
    [self.dataArray addObject:@{kTitle: @"SuperMan",kIdentifier:@"8"}];
    [self.dataArray addObject:@{kTitle: @"Betman",kIdentifier:@"9"}];
    [self.dataArray addObject:@{kTitle: @"Sin",kIdentifier:@"10"}];
    [self.dataArray addObject:@{kTitle: @"Wow",kIdentifier:@"11"}];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.dataArray.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
    NSDictionary *dataDictionary = self.dataArray[indexPath.row];
    cell.textLabel.text = dataDictionary[kTitle];
    BOOL isBlock = [self.blockManager isBlockIdentifier:dataDictionary[kIdentifier]];
    cell.detailTextLabel.text = [NSString stringWithFormat:@"Identifier:%@, block:%@",dataDictionary[kIdentifier],isBlock?@"YES":@"NO"];
    return cell;
}
- (void)detailViewControllerDidChanged:(HMDetailViewController *)viewController{
    [self.tableView reloadData];

}
@end
