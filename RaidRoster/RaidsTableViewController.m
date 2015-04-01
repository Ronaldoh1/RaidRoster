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
#import "Raid.h"

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
    NSFetchRequest *request = [[NSFetchRequest alloc] initWithEntityName:NSStringFromClass([Raid class])];
    self.raidsArray = [self.moc executeFetchRequest:request error:nil];
    [self.tableView reloadData];
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

                                   Raid *newRaid = [NSEntityDescription insertNewObjectForEntityForName:NSStringFromClass([Raid class]) inManagedObjectContext:self.moc];
                                   UITextField *textField = alertcontroller.textFields.firstObject;
                                   newRaid.name = textField.text;

                                   [newRaid.managedObjectContext save:nil];


                               }];

    [alertcontroller addAction:okAction];
    
    [self presentViewController:alertcontroller animated:YES completion:^{
        nil;
    }];

}

- (void)showAdventurersViewControllerForRaid:(Raid *)raid
{
    //this initilizes a current view controller by referencing the storyboard. Then we have to present it.
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    AdventurersTableViewController *adventurersVC = [storyboard instantiateViewControllerWithIdentifier:@"AdventurersTableViewController"];
    adventurersVC.raid = raid;

    UINavigationController *navVC = [[UINavigationController alloc] initWithRootViewController:adventurersVC];
    [self presentViewController:navVC animated:YES completion:nil];
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
    cell.textLabel.text = raid.name;

    if ([raid.adventurers containsObject:self.adventurer]) {
        cell.backgroundColor = [UIColor blueColor];
    }else {
        cell.backgroundColor = [UIColor whiteColor];
    }


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
    if([self.adventurer.raids containsObject:raid]){
        [self.adventurer removeRaidsObject:raid];
    }else{
        [self.adventurer addRaidsObject:raid];
    }


    [self.moc save:nil];
    [self.tableView reloadData];
}


@end
