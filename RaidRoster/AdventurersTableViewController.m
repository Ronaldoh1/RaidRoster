//
//  ViewController.m
//  RaidRoster
//
//  Created by Dave Krawczyk on 11/11/14.
//  Copyright (c) 2014 MobileMakers. All rights reserved.
//
#import "AppDelegate.h"
//
//#import "Raid.h"
//#import "Adventurer.h"
#import "AdventurersTableViewController.h"
#import "RaidsTableViewController.h"

@interface AdventurersTableViewController () <UITableViewDataSource, UITableViewDelegate>


@property NSArray *adventurers;
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property NSManagedObjectContext *moc;


@end

@implementation AdventurersTableViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    self.moc = [AppDelegate appDelegate].managedObjectContext;
    [self loadAdventurers];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    if (self.raid)
    {
//        self.title = self.raid.name;
        self.navigationItem.rightBarButtonItem = nil;
    }else
    {
        self.navigationItem.leftBarButtonItem = nil;
    }

}

- (void)loadAdventurers
{
                                       //TODO: step
//    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] init];
//    NSEntityDescription *entity = [NSEntityDescription entityForName:@"Adventurer" inManagedObjectContext:self.moc];
//    [fetchRequest setEntity:entity];
//    if (self.raid)
//    {
//        NSPredicate *predicate = [NSPredicate predicateWithFormat:@"raids CONTAINS %@",self.raid];
//        [fetchRequest setPredicate:predicate];
//    }
//
//    self.adventurers = [self.moc executeFetchRequest:fetchRequest error:nil];
//
//
//    [self.tableView reloadData];
}

- (IBAction)onAddButtonTapped:(id)sender {
    UIAlertController *alertcontroller = [UIAlertController alertControllerWithTitle:@"Add an adventurer" message:nil preferredStyle:UIAlertControllerStyleAlert];

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
//                                   Adventurer *adventurer = [NSEntityDescription insertNewObjectForEntityForName:@"Adventurer" inManagedObjectContext:self.moc];
////                                   adventurer.name = nameTextField.text;
//                                   [self.moc save:nil];
//                                   [self loadAdventurers];


                               }];

    [alertcontroller addAction:okAction];

    [self presentViewController:alertcontroller animated:YES completion:^{
        nil;
    }];
}

- (BOOL)shouldPerformSegueWithIdentifier:(NSString *)identifier sender:(id)sender
{
    return !self.raid; //Return yes, if there is no raid.
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    RaidsTableViewController *raidsTableVC = segue.destinationViewController;

    NSIndexPath *indexPath = [self.tableView indexPathForCell:sender];
    Adventurer *adventurer = self.adventurers[indexPath.row];
    raidsTableVC.adventurer = adventurer;
}


#pragma mark - Tableview Methods

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.adventurers.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"adventurerCell"];
    Adventurer *a = self.adventurers[indexPath.row];
                                       //TODO: step
//    cell.textLabel.text = a.name;
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

- (IBAction)onDoneButtonTapped:(id)sender
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
