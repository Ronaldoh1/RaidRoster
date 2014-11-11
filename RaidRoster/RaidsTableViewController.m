//
//  RaidsTableViewController.m
//  RaidRoster
//
//  Created by Dave Krawczyk on 11/11/14.
//  Copyright (c) 2014 MobileMakers. All rights reserved.
//


#import "RaidsTableViewController.h"

@interface RaidsTableViewController()

@property NSArray *raidsArray;

@end

@implementation RaidsTableViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

}

- (IBAction)onAddButtonPressed:(UIBarButtonItem *)sender
{

}

#pragma mark - Tableview Methods

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.raidsArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"raidCell"];

    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{



}


@end
