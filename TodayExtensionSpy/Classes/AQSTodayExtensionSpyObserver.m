//
//  AQSTodayExtensionSpyObserver.m
//  TodayExtensionSpy
//
//  Created by kaiinui on 2014/09/18.
//  Copyright (c) 2014 aruamarine. All rights reserved.
//

#import "AQSTodayExtensionSpyObserver.h"
#import <UIKit/UIKit.h>

NSString *const kAQSTodayExtensionSpyStatusDidChangeNotification = @"AQSTodayExtensionSpyStatusDidChangeNotification";
NSString *const kAQSTodayExtensionSpyHasOpenedKey = @"AQSTodayExtensionSpyHasOpened";

@interface AQSTodayExtensionSpyObserver ()

@property (nonatomic, copy) NSString *previousPastebaordString;

@end

@implementation AQSTodayExtensionSpyObserver

+ (instancetype)observerWithIdentifier:(NSString *)identifier {
    AQSTodayExtensionSpyObserver *observer = [[AQSTodayExtensionSpyObserver alloc] init];
    observer.identifer = identifier;
    return observer;
}

- (BOOL)hasTodayExtensionOpened {
    if ([[NSUserDefaults standardUserDefaults] boolForKey:kAQSTodayExtensionSpyHasOpenedKey] == YES) {
        return YES;
    }
    
    UIPasteboard *pasteboard = [self pasteboard];
    if (pasteboard.string) {
        [[NSUserDefaults standardUserDefaults] setBool:YES forKey:kAQSTodayExtensionSpyHasOpenedKey];
    }
    return !!pasteboard.string;
}

- (NSDate *)lastOpenedAtOrNil {
    NSTimeInterval interval = [self timestampOrZero];
    if (interval == 0.f) {
        return nil;
    }
    return [NSDate dateWithTimeIntervalSince1970:interval];
}

- (void)observeOpenStatus {
    // Dirty hack but neither KVO, NSNotification does not work properly.
    [NSTimer scheduledTimerWithTimeInterval:1.0f target:self selector:@selector(checkPasteboard) userInfo:nil repeats:YES];
}

# pragma mark - Scheduled Method

- (void)checkPasteboard {
    // Do not check if it has not opened yet.
    if (![self pasteboard].string) { return; }
    
    // If it is the first interval.
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
    [[NSNotificationCenter defaultCenter] postNotificationName:kAQSTodayExtensionSpyStatusDidChangeNotification object:self];
}

@end
