//
//  Entry.h
//  Entries
//
//  Created by Joel on 1/15/15.
//  Copyright (c) 2015 DevMountain. All rights reserved.
//

#import <Foundation/Foundation.h>

static NSString *const titleKey = @"title";
static NSString *const noteKey = @"note";
static NSString *const createdTimeKey = @"createdTime";

@interface Entry : NSObject

@property (nonatomic, strong) NSString *title;
@property (nonatomic, strong) NSString *note;
@property (nonatomic, strong) NSDate *createdTime;

- (id)initWithDictionary:(NSDictionary *)dictionary;
- (NSDictionary *)entryDictionary;

@end
