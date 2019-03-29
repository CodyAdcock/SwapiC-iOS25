//
//  CRAPerson.h
//  SwapiC
//
//  Created by Cody on 3/28/19.
//  Copyright © 2019 Cody Adcock. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface CRAPerson : NSObject

@property (nonatomic, readonly, copy) NSString * name;
@property (nonatomic, readonly, copy) NSString * height;
@property (nonatomic, readonly, copy) NSString * mass;

-(instancetype)initWithDictionary:(NSDictionary *)dictionary;

@end

NS_ASSUME_NONNULL_END
