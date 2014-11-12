//
//  RaidsTableViewController.m
//  RaidRoster
//
//  Created by Dave Krawczyk on 11/11/14.
//  Copyright (c) 2014 MobileMakers. All rights reserved.
//
#import "AppDelegate.h"

//#import "Raid.h"
//#import "Adventurer.h"

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
                                       //TODO: step
//    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] init];
//    NSEntityDescription *entity = [NSEntityDescription entityForName:@"Raid" inManagedObjectContext:self.moc];
//    [fetchRequest setEntity:entity];
//    self.raidsArray = [self.moc executeFetchRequest:fetchRequest error:nil];
//
//    [self.tableView reloadData];
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
                                                                      //TODO: step
//                                   UITextField *nameTextField = alertcontroller.textFields.firstObject;
//
//                                   Raid *raid = [NSEntityDescription insertNewObjectForEntityForName:@"Raid" inManagedObjectContext:self.moc];
////                                   raid.name = nameTextField.text;
//                                   [self.moc save:nil];
//                                   [self loadRaids];


                               }];

    [alertcontroller addAction:okAction];
    
    [self presentViewController:alertcontroller animated:YES completion:^{
        nil;
    }];

}

- (void)showAdventurersViewControllerForRaid:(Raid *)raid
{
                                   //TODO: step
//    AdventurersTableViewController *adventuresVC = [self.storyboard instantiateViewControllerWithIdentifier:@"AdventurersTableViewController"];
//    adventuresVC.raid = raid;
//
//    UINavigationController *navC  = [[UINavigationController alloc]initWithRootViewController:adventuresVC];
//    [self presentViewController:navC animated:YES completion:nil];
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

                                       //TODO: step
//    cell.textLabel.text = raid.name;

//    if ([self.adventurer.raids containsObject:raid])
//    {
//        cell.backgroundColor = [UIColor colorWithRed:1.0 green:0.0 blue:0.0 alpha:0.5];
//    }
//    else
//    {
//        cell.backgroundColor = [UIColor whiteColor];
//    }


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

                                       //TODO: step
//    if ([self.adventurer.raids containsObject:raid])
//    {
//        [self.adventurer removeRaidsObject:raid];
//    }
//    else
//    {
//        [self.adventurer addRaidsObject:raid];
//    }

    [self.moc save:nil];
    [self.tableView reloadData];
}


@end
