//
//  Raids.h
//  RaidRoster
//
//  Created by Ronald Hernandez on 4/1/15.
//  Copyright (c) 2015 MobileMakers. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Adventurer;

@interface Raids : NSManagedObject

@property (nonatomic, retain) NSSet *adventurers;
@end

@interface Raids (CoreDataGeneratedAccessors)

- (void)addAdventurersObject:(Adventurer *)value;
- (void)removeAdventurersObject:(Adventurer *)value;
- (void)addAdventurers:(NSSet *)values;
- (void)removeAdventurers:(NSSet *)values;

@end
