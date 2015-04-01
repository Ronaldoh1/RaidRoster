//
//  Adventurer.h
//  RaidRoster
//
//  Created by Ronald Hernandez on 4/1/15.
//  Copyright (c) 2015 MobileMakers. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>
#import "Raid.h"


@interface Adventurer : NSManagedObject

@property (nonatomic, retain) NSSet *raids;
@property NSString* name;
@end

@interface Adventurer (CoreDataGeneratedAccessors)

- (void)addRaidsObject:(NSManagedObject *)value;
- (void)removeRaidsObject:(NSManagedObject *)value;
- (void)addRaids:(NSSet *)values;
- (void)removeRaids:(NSSet *)values;

@end
