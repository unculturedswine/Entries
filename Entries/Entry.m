//
//  Entry.m
//  Entries
//
//  Created by Joel on 1/15/15.
//  Copyright (c) 2015 DevMountain. All rights reserved.
//

#import "Entry.h"

@implementation Entry

// Barebones Custom
- (id)initWithDictionary:(NSDictionary *)dictionary {
    self = [super init];
    if (self) {
        self.title = [dictionary objectForKey:titleKey];
        self.note = [dictionary objectForKey:noteKey];
        self.createdTime = [dictionary objectForKey:createdTimeKey];
    }
    return self;
}

- (NSDictionary *)entryDictionary {
    NSMutableDictionary *mutableEntry = [NSMutableDictionary dictionary];
    // We have to do this if statement because we created static variables
    if (self.title) {
        [mutableEntry setValue:self.title forKey:titleKey];
    }
    if (self.note) {
        [mutableEntry setValue:self.note forKey:noteKey];
    }
    if (self.createdTime) {
        [mutableEntry setValue:self.createdTime forKey:createdTimeKey];
    }
    return mutableEntry;
}


@end
