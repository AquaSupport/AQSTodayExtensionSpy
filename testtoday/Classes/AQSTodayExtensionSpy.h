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

/**
 *  Instantiate a spy with given identifier.
 *
 *  Note:
 *  `identifier` must be unique among your all apps.
 *  (e.g.) For app which has bundle identifier `com.example.someapp`, pass an identifier like `com.example.someapp`.
 *  IT SHOULD BE SAME WITH OBSERBER's IDENTIFIER
 *
 *  @param identifier Unique string in your all apps
 *
 *  @return instance
 */
+ (instancetype)spyWithIdentifier:(NSString *)identifier;

/**
 *  Call when the Today Extension opened.
 *  (Typically in `- viewDidLoad`)
 */
- (void)didOpenTodayExtension;

@end
