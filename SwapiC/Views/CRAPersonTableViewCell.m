//
//  PersonTableViewCell.m
//  SwapiC
//
//  Created by Cody on 3/28/19.
//  Copyright © 2019 Cody Adcock. All rights reserved.
//

#import "CRAPersonTableViewCell.h"

@implementation CRAPersonTableViewCell

-(void)setPerson:(CRAPerson *)person
{
    _person = person;
    
    NSURL *notFoundURL = [[NSURL alloc]initWithString:@"https://i.imgflip.com/2x81f9.jpg"];
    [CRASwapiClient fetchImageData:notFoundURL completion:^(NSData * _Nullable imageData, NSError * _Nullable error) {
        UIImage *notFoundImage = [UIImage imageWithData:imageData];
        dispatch_async(dispatch_get_main_queue(), ^{
            self.personImageView.image = notFoundImage;
        });
        [self setLocalImage:person.name];
    }];
    
    self.nameLabel.text = person.name;
}

-(void)setLocalImage:(NSString *)name
{
    UIImage *personImage = [UIImage imageNamed:name.lowercaseString];
    if(!personImage){return;}
    dispatch_async(dispatch_get_main_queue(), ^{
        self.personImageView.image = personImage;
    });
}

- (void)prepareForReuse
{
    [super prepareForReuse];
    self.imageView.image = nil;
}

@end
