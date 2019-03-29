//
//  PersonsListTableViewController.h
//  SwapiC
//
//  Created by Cody on 3/28/19.
//  Copyright © 2019 Cody Adcock. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CRAPerson.h"
#import "CRASwapiClient.h"

NS_ASSUME_NONNULL_BEGIN

@interface CRAPersonsListTableViewController : UITableViewController <UISearchBarDelegate>

@property (nonatomic, readwrite) NSArray<CRAPerson *> *people;

@end

NS_ASSUME_NONNULL_END
