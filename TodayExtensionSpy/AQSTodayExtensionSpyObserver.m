//
//  AQSTodayExtensionSpyObserver.m
//  TodayExtensionSpy
//
//  Created by kaiinui on 2014/09/18.
//  Copyright (c) 2014年 aruamarine. All rights reserved.
//

#import "AQSTodayExtensionSpyObserver.h"
#import <UIKit/UIKit.h>

NSString *const kAQSTodayExtensionSpyStatusDidChangeNotification = @"AQSTodayExtensionSpyStatusDidChangeNotification";

@interface AQSTodayExtensionSpyObserver ()

@property (nonatomic, copy) NSString *previousPastebaordString;

@end

@implementation AQSTodayExtensionSpyObserver

/**
 *  Instantiate an observer with given identifier.
 *
 *  Note:
 *  `identifier` must be unique among your all apps.
 *  (e.g.) For app which has bundle identifier `com.example.someapp`, pass an identifier like `com.example.someapp`.
 *
 *  @param identifier Unique string in your all apps
 *
 *  @return instance
 */
+ (instancetype)observerWithIdentifier:(NSString *)identifier {
    AQSTodayExtensionSpyObserver *observer = [[AQSTodayExtensionSpyObserver alloc] init];
    observer.identifer = identifier;
    return observer;
}

/**
 *  Return if the Today Extension has been opened at least once.
 *
 *  @return Whether the today extension has been opened
 */
- (BOOL)hasTodayExtensionOpened {
    UIPasteboard *pasteboard = [self pasteboard];
    return !!pasteboard.string;
}

/**
 *  Returns last opened date.
 *  It returns `nil` if `- hasTodayExtensionOpened` = `NO`.
 *
 *  @return Last opened date or nil
 */
- (NSDate *)lastOpenedAtOrNil {
    NSTimeInterval interval = [self timestampOrZero];
    if (interval == 0.f) {
        return nil;
    }
    return [NSDate dateWithTimeIntervalSince1970:interval];
}

/**
 *  Posts the notification named `kAQSTodayExtensionSpyStatusDidChangeNotification` when the open status being changed.
 *  The notification object is nil and does not contain userInfo.
 */
- (void)observeStatus {
    // Dirty hack but neither KVO, NSNotification does not work properly.
    [NSTimer scheduledTimerWithTimeInterval:1.0f target:self selector:@selector(checkPasteboard) userInfo:nil repeats:YES];
}

# pragma mark - Scheduled Method

- (void)checkPasteboard {
    if (self.previousPastebaordString == nil) {
        self.previousPastebaordString = [self pasteboard].string;
    }
    
    if ([[self pasteboard].string isEqualToString:self.previousPastebaordString] == NO) {
        [self postStatusDidChangeNotification];
        self.previousPastebaordString = [self pasteboard].string;
    }
}

# pragma mark - Helpers

- (UIPasteboard *)pasteboard {
    return [UIPasteboard pasteboardWithName:self.identifer create:YES];
}

- (NSTimeInterval)timestampOrZero {
    UIPasteboard *pasteboard = [self pasteboard];
    if (!pasteboard) {
        return 0.f;
    }
    NSTimeInterval timestamp = [pasteboard.string doubleValue];
    return timestamp;
}

- (void)postStatusDidChangeNotification {
    [[NSNotificationCenter defaultCenter] postNotificationName:kAQSTodayExtensionSpyStatusDidChangeNotification object:nil];
}

@end
