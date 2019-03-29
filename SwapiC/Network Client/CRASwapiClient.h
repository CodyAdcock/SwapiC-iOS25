//
//  SwapiClient.h
//  SwapiC
//
//  Created by Cody on 3/28/19.
//  Copyright © 2019 Cody Adcock. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CRAPerson.h"

NS_ASSUME_NONNULL_BEGIN

@interface CRASwapiClient : NSObject

//Fetch All People
+(void)fetchAllPersons:(void(^_Nullable)(NSArray<CRAPerson *> *_Nullable persons))completion;
+(void)searchForPeopleWithSearchTerm:(NSString *)searchTerm completion:(void(^_Nullable)(NSArray<CRAPerson *> *_Nullable persons))completion;
+(void)fetchImageData:(NSURL *)url completion:(void(^)(NSData *_Nullable imageData, NSError *_Nullable error))completion;

//Fetch Searched People

@end

NS_ASSUME_NONNULL_END
