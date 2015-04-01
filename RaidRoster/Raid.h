//
//  Raids.h
//  RaidRoster
//
//  Created by Ronald Hernandez on 4/1/15.
//  Copyright (c) 2015 MobileMakers. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>
#import "Adventurer.h"

@class Adventurer;

@interface Raid : NSManagedObject

@property (nonatomic, retain) NSSet *adventurers;
@property NSString* name;
@end

@interface Raid (CoreDataGeneratedAccessors)

- (void)addAdventurersObject:(Adventurer *)value;
- (void)removeAdventurersObject:(Adventurer *)value;
- (void)addAdventurers:(NSSet *)values;
- (void)removeAdventurers:(NSSet *)values;

@end
