//
//  ViewController.m
//  RaidRoster
//
//  Created by Dave Krawczyk on 11/11/14.
//  Copyright (c) 2014 MobileMakers. All rights reserved.
//

#import "AdventurersTableViewController.h"

@interface AdventurersTableViewController () <UITableViewDataSource, UITableViewDelegate>


@property NSArray *adventurers;


@end

@implementation AdventurersTableViewController


#pragma mark - Tableview Methods

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.adventurers.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"adventurerCell"];

    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{



}


@end
