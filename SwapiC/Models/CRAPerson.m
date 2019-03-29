//
//  CRAPerson.m
//  SwapiC
//
//  Created by Cody on 3/28/19.
//  Copyright © 2019 Cody Adcock. All rights reserved.
//

#import "CRAPerson.h"

@implementation CRAPerson

- (instancetype)initWithDictionary:(NSDictionary *)dictionary
{
    self = [super init];
    if (self){
        _name = dictionary[@"name"];
        _height = dictionary[@"height"];
        _mass = dictionary[@"mass"];
    }
    return self;
}

@end
