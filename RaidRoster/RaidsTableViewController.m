//
//  RaidsTableViewController.m
//  RaidRoster
//
//  Created by Dave Krawczyk on 11/11/14.
//  Copyright (c) 2014 MobileMakers. All rights reserved.
//


#import "AppDelegate.h"
#import "AdventurersTableViewController.h"
#import "RaidsTableViewController.h"

@interface RaidsTableViewController()

@property NSArray *raidsArray;
@property NSManagedObjectContext *moc;

@end

@implementation RaidsTableViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    [self.tableView setAllowsMultipleSelection:YES];
    self.moc = [AppDelegate appDelegate].managedObjectContext;

    [self loadRaids];
}

- (void)loadRaids
{
}

- (IBAction)onAddButtonPressed:(UIBarButtonItem *)sender
{
    UIAlertController *alertcontroller = [UIAlertController alertControllerWithTitle:@"Add a raid" message:nil preferredStyle:UIAlertControllerStyleAlert];

    [alertcontroller addTextFieldWithConfigurationHandler:^(UITextField *textField) {
        nil;
    }];

    UIAlertAction *okAction = [UIAlertAction
                               actionWithTitle:@"Okay"
                               style:UIAlertActionStyleDefault
                               handler:^(UIAlertAction *action)
                               {


                               }];

    [alertcontroller addAction:okAction];
    
    [self presentViewController:alertcontroller animated:YES completion:^{
        nil;
    }];

}

- (void)showAdventurersViewControllerForRaid:(Raid *)raid
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
    Raid *raid = self.raidsArray[indexPath.row];



    return cell;
}

- (void)tableView:(UITableView *)tableView accessoryButtonTappedForRowWithIndexPath:(NSIndexPath *)indexPath
{
    Raid *raid = self.raidsArray[indexPath.row];
    [self showAdventurersViewControllerForRaid:raid];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    Raid *raid = self.raidsArray[indexPath.row];


    [self.moc save:nil];
    [self.tableView reloadData];
}


@end
