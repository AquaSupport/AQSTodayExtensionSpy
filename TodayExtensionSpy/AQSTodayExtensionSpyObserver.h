//
//  AQSTodayExtensionSpyObserver.h
//  TodayExtensionSpy
//
//  Created by kaiinui on 2014/09/18.
//  Copyright (c) 2014年 aruamarine. All rights reserved.
//

#import <Foundation/Foundation.h>

extern NSString *const kAQSTodayExtensionSpyStatusDidChangeNotification;

@interface AQSTodayExtensionSpyObserver : NSObject

@property (nonatomic, copy) NSString *identifer;

+ (instancetype)observerWithIdentifier:(NSString *)identifier;
- (BOOL)hasTodayExtensionOpened;
- (NSDate *)lastOpenedAtOrNil;
- (void)observeStatus;

@end
