//
//  SwapiClient.m
//  SwapiC
//
//  Created by Cody on 3/28/19.
//  Copyright © 2019 Cody Adcock. All rights reserved.
//

#import "CRASwapiClient.h"

@implementation CRASwapiClient

//Base URL
+(NSURL *)baseURL{
    return [[NSURL alloc] initWithString: @"https://swapi.co/api"];
}

//Fetch Functions
+ (void)fetchAllPersons:(void (^)(NSArray<CRAPerson *> * _Nonnull))completion
{
    NSURL *personURL = [[self baseURL] URLByAppendingPathComponent:@"people"];
    
    NSLog(@"🐥🐥🐥🐥🐥🐥%@🐥🐥🐥🐥🐥🐥", personURL);
    
    [[[NSURLSession sharedSession] dataTaskWithURL:personURL completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        
        if (error){
            NSLog(@"Error in %@, %@", error, error.localizedDescription);
            completion(nil);
            return;
        }
        
        NSLog(@"%@", response);
        
        if (!data){
            NSLog(@"NO DATA AVAILABLE");
            completion(nil);
            return;
        }
        //Top Level Dictionary
        NSDictionary *jsonDictionary = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:&error];
        //array of people Dictionaries
        NSArray *resultsArray = jsonDictionary[@"results"];
        //storage for people to return
        NSMutableArray *peopleArray = [[NSMutableArray alloc] init];
        
        for(NSDictionary *personDict in resultsArray)
        {
            //for every person dictionary create a person and append
            CRAPerson *person = [[CRAPerson alloc] initWithDictionary:personDict];
            [peopleArray addObject:person];
        }
        //complete person
        completion(peopleArray);
    }]resume];
    
    
}

+ (void)searchForPeopleWithSearchTerm:(NSString *)searchTerm completion:(void (^)(NSArray<CRAPerson *> * _Nonnull))completion
{
    //Construct URL
    NSURL *searchURL = [[self baseURL] URLByAppendingPathComponent:@"people"];
    NSURLComponents *components = [[NSURLComponents alloc] initWithURL:searchURL resolvingAgainstBaseURL:YES];
    NSURLQueryItem *queryItem = [[NSURLQueryItem alloc] initWithName:@"search" value:searchTerm];
    components.queryItems = [[NSArray alloc] initWithObjects:queryItem, nil];
    NSURL *finished = components.URL;
    NSLog(@"%@", finished);
    
    //Data Task, Serialization, Completion, Resume
    [[[NSURLSession sharedSession] dataTaskWithURL:finished completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        //Handle Errors
        if (error){
            NSLog(@"Error in %@, %@", error, error.localizedDescription);
            completion(nil);
            return;
        }
        //print response
        NSLog(@"%@", response);
        
        //if no data, tell me
        if (!data){
            NSLog(@"NO DATA AVAILABLE");
            completion(nil);
            return;
        }
        
        NSDictionary *jsonDictionary = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:&error];
        NSArray *resultsArray = jsonDictionary[@"results"];
        
        NSMutableArray *peopleArray = [[NSMutableArray alloc] init];
        
        for (NSDictionary *personDict in resultsArray)
        {
            CRAPerson *person = [[CRAPerson alloc] initWithDictionary:personDict];
            [peopleArray addObject:person];
        }
        completion(peopleArray);
        
    }]resume];
}

+ (void)fetchImageData:(NSURL *)url completion:(void (^)(NSData * _Nullable imageData, NSError * _Nullable error))completion
{
    [[[NSURLSession sharedSession]dataTaskWithURL:url completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        //handle error
        if (error){
            NSLog(@"Error in %@, %@", error, error.localizedDescription);
            completion(nil, error);
            return;
        }
        //print response
        NSLog(@"%@", response);
        
        //if no data, tell me
        if (!data){
            NSLog(@"NO DATA AVAILABLE");
            completion(nil, error);
            return;
        }
        completion(data,nil);
    }]resume];
}

@end
