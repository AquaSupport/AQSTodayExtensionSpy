//
//  AQSIsTodayExtensionAdded.m
//  TodayExtensionSpy
//
//  Created by kaiinui on 2014/09/18.
//  Copyright (c) 2014年 aruamarine. All rights reserved.
//

#import "AQSTodayExtensionSpy.h"
#import <UIKit/UIKit.h>

@implementation AQSTodayExtensionSpy

+ (instancetype)spyWithIdentifier:(NSString *)identifier {
    AQSTodayExtensionSpy *spy = [[AQSTodayExtensionSpy alloc] init];
    spy.identifier = identifier;
    return spy;
}

- (void)didOpenTodayExtension {
    UIPasteboard *pasteboard = [self pasteboard];
    NSString *timestamp = [NSString stringWithFormat:@"%f",[[NSDate date] timeIntervalSince1970]];
    pasteboard.string = timestamp;
}

# pragma mark - Helpers

- (UIPasteboard *)pasteboard {
    UIPasteboard *pasteboard = [UIPasteboard pasteboardWithName:self.identifier create:YES];
    pasteboard.persistent = YES;
    return pasteboard;
}

@end
