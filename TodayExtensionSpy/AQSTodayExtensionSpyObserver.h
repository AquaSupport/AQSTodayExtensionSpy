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

/**
 *  Instantiate an observer with given identifier.
 *
 *  Note:
 *  `identifier` must be unique among your all apps.
 *  (e.g.) For app which has bundle identifier `com.example.someapp`, pass an identifier like `com.example.someapp`.
 *  IT SHOULD BE SAME WITH SPY's IDENTIFIER
 *
 *  @param identifier Unique string in your all apps
 *
 *  @return instance
 */
+ (instancetype)observerWithIdentifier:(NSString *)identifier;

/**
 *  Return if the Today Extension has been opened at least once.
 *
 *  @return Whether the today extension has been opened
 */
- (BOOL)hasTodayExtensionOpened;

/**
 *  Returns last opened date.
 *  It returns `nil` if `- hasTodayExtensionOpened` = `NO`.
 *
 *  @return Last opened date or nil
 */
- (NSDate *)lastOpenedAtOrNil;

/**
 *  Posts the notification named `kAQSTodayExtensionSpyStatusDidChangeNotification` when the open status being changed.
 *  The notification object is the observer and does not contain userInfo.
 *      
 *      AQSTodayExtensionObsever *observer = [AQSTodayExtensionObserver observerWithIdentifier:@"com.example.yourapp"];
 *      [observer observeOpenStatus];
 *      [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(didChangeTodayExtensionOpenStatus:) object:nil];
 */
- (void)observeOpenStatus;

@end
