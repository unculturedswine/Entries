//
//  EntryController.m
//  Entries
//
//  Created by Joshua Howland on 5/30/14.
//  Copyright (c) 2014 DevMountain. All rights reserved.
//

#import "EntryController.h"

static NSString * const entriesKey = @"entries";

@interface EntryController ()

@property (nonatomic, strong) NSArray *entries;

@end

@implementation EntryController

+ (EntryController *)sharedInstance {
    static EntryController *sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [[EntryController alloc] init];
    
        sharedInstance.entries = [EntryController loadEntriesFromDefaults];
    });
    return sharedInstance;
}

- (void)addEntry:(Entry *)entry {

    if (!entry) {
        return;
    }
    
    NSMutableArray *mutableEntries = [[NSMutableArray alloc] initWithArray:self.entries];
    [mutableEntries addObject:entry];

    self.entries = mutableEntries;
}

- (void)removeEntry:(Entry *)entry {
    
    if (!entry) {
        return;
    }

    NSMutableArray *mutableEntries = self.entries.mutableCopy;
    [mutableEntries removeObject:entry];
    
    self.entries = mutableEntries;
    
}

- (void)setEntries:(NSArray *)entries {
    _entries = entries;
    
    [EntryController storeEntriesInDefaults:entries];
}

+ (NSMutableArray *)loadEntriesFromDefaults {
    
    NSArray *entryDictionaries = [[NSUserDefaults standardUserDefaults] objectForKey:entriesKey];
    
    NSMutableArray *entries = [NSMutableArray new];
    
    for (NSDictionary *entryDictionary in entryDictionaries) {
        Entry *entry = [[Entry alloc] initWithDictionary:entryDictionary];
        [entries addObject:entry];
    }
    
    return entries;
}

+ (void)storeEntriesInDefaults:(NSArray *)entries {
    
    NSMutableArray *entryDictionaries = [NSMutableArray new];
    
    for (Entry *entry in entries) {
        [entryDictionaries addObject:[entry entryDictionary]];
    }
    
    
    [[NSUserDefaults standardUserDefaults] setObject:entryDictionaries forKey:entriesKey];
    [[NSUserDefaults standardUserDefaults] synchronize];
    
}

@end
