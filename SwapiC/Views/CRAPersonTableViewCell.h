//
//  PersonTableViewCell.h
//  SwapiC
//
//  Created by Cody on 3/28/19.
//  Copyright © 2019 Cody Adcock. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CRAPerson.h"
#import "CRASwapiClient.h"

NS_ASSUME_NONNULL_BEGIN

@interface CRAPersonTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UIImageView *personImageView;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (nonatomic, readwrite) CRAPerson *person;

-(void)setLocalImage:(NSString *)name;

@end

NS_ASSUME_NONNULL_END
