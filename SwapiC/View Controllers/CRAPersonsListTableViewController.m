//
//  PersonsListTableViewController.m
//  SwapiC
//
//  Created by Cody on 3/28/19.
//  Copyright © 2019 Cody Adcock. All rights reserved.
//

#import "CRAPersonsListTableViewController.h"
#import "CRAPersonTableViewCell.h"
#import "SwapiC-Swift.h"

@interface CRAPersonsListTableViewController ()

@property (weak, nonatomic) IBOutlet UISearchBar *searchBar;

@end

@implementation CRAPersonsListTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.searchBar.delegate = self;
    [CRASwapiClient fetchAllPersons:^(NSArray<CRAPerson *> * _Nullable persons) {
        self.people = persons;
    }];
}

- (void)setPeople:(NSArray<CRAPerson *> *)people
{
    _people = people;
    dispatch_async(dispatch_get_main_queue(), ^{
        [[self tableView]reloadData];
    });
}

- (void)searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText
{
    [CRASwapiClient searchForPeopleWithSearchTerm:searchText completion:^(NSArray<CRAPerson *> * _Nullable persons) {
        self.people = persons;
    }];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.people.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    CRAPersonTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"personCell" forIndexPath:indexPath];
    CRAPerson *person = self.people[indexPath.row];
    cell.person = person;
    
    return cell;
}

#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    PersonDetailViewController *destinationVC = [segue destinationViewController];
    NSIndexPath *indexPath = [[self tableView] indexPathForSelectedRow];
    CRAPerson *person = self.people[indexPath.row];
    destinationVC.person = person;
}

@end
