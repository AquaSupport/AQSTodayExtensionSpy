//
//  AQSIsTodayExtensionAdded.h
//  TodayExtensionSpy
//
//  Created by kaiinui on 2014/09/18.
//  Copyright (c) 2014年 aruamarine. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AQSTodayExtensionSpy : NSObject

@property (nonatomic, copy) NSString *identifier;

+ (instancetype)spyWithIdentifier:(NSString *)identifier;
- (void)didOpenTodayExtension;

@end
