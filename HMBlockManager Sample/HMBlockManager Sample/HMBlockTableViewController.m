//
//  HMBlockTableViewController.m
//  HMBlockManager Sample
//
//  Created by Hayden on 2014. 7. 8..
//  Copyright (c) 2014년 Hayden Moon. All rights reserved.
//

#import "HMBlockTableViewController.h"

@interface HMBlockTableViewController ()
@property (weak, nonatomic) IBOutlet UITableViewCell *blockCell;
@property (weak, nonatomic) IBOutlet UIDatePicker *datePicker;

@end

@implementation HMBlockTableViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.datePicker.date = [[self.datePicker date] dateByAddingTimeInterval:60];
    
}
#pragma mark IBAction
- (IBAction)datePickerValueChanged:(id)sender {
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark UITableViewDelegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if([tableView cellForRowAtIndexPath:indexPath] == self.blockCell){
        [self.delegate blockTableViewController:self didPickedDate:self.datePicker.date];
    }
}
@end
