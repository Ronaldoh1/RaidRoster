//
//  ViewController.m
//  RaidRoster
//
//  Created by Dave Krawczyk on 11/11/14.
//  Copyright (c) 2014 MobileMakers. All rights reserved.
//


#import "AppDelegate.h"
#import "AdventurersTableViewController.h"
#import "RaidsTableViewController.h"
#import "Adventurer.h"

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

    if(self.raid) {
        self.adventurers = [self.raid.adventurers allObjects];
    }else{
        [self loadAdventurers];
    }


        //// 
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    if (self.raid)
    {
        self.navigationItem.rightBarButtonItem = nil;
    }else
    {
        self.navigationItem.leftBarButtonItem = nil;
    }

}

- (void)loadAdventurers
{
    NSFetchRequest *request = [[NSFetchRequest alloc] initWithEntityName:@"Adventurer"];
    self.adventurers = [self.moc executeFetchRequest:request error:nil];
    [self.tableView reloadData];
}

- (IBAction)onAddButtonTapped:(id)sender {
    UIAlertController *alertcontroller = [UIAlertController alertControllerWithTitle:@"Add an adventurer" message:nil preferredStyle:UIAlertControllerStyleAlert];

    [alertcontroller addTextFieldWithConfigurationHandler:^(UITextField *textField) {
        textField.placeholder = @"Enter Adventurer's Name Here";
    }];

    UIAlertAction *okAction = [UIAlertAction
                               actionWithTitle:@"Okay"
                               style:UIAlertActionStyleDefault
                               handler:^(UIAlertAction *action)
                               {
                                   Adventurer *newAdventurer = [NSEntityDescription insertNewObjectForEntityForName:NSStringFromClass([Adventurer class]) inManagedObjectContext:self.moc];
                                   UITextField *textfield = alertcontroller.textFields.firstObject;
                                   newAdventurer.name = textfield.text;
                                   [newAdventurer.managedObjectContext save:nil];
                                   [self loadAdventurers];

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
    cell.textLabel.text = a.name;

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
