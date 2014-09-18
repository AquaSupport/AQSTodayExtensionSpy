//
//  ViewController.m
//  TodayExtensionSpy
//
//  Created by kaiinui on 2014/09/18.
//  Copyright (c) 2014年 aruamarine. All rights reserved.
//

#import "ViewController.h"

#import "AQSTodayExtensionSpyObserver.h"

NSString *const kIdentifier = @"org.openaquamarine.todayextensionspy";

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    AQSTodayExtensionSpyObserver *observer = [AQSTodayExtensionSpyObserver observerWithIdentifier:kIdentifier];
    
    NSLog(@"%hhd", observer.hasTodayExtensionOpened);
    NSLog(@"%@", observer.lastOpenedAtOrNil);
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(changed:) name:UIPasteboardChangedNotification object:[UIPasteboard pasteboardWithName:kIdentifier create:NO]];
    [[UIPasteboard pasteboardWithName:kIdentifier create:NO] addObserver:self forKeyPath:@"string" options:NSKeyValueObservingOptionNew context:NULL];
    
    [observer observeStatus];
    
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)changed:(NSNotification *)notification {
    NSLog(@"%@", notification.userInfo);
    NSLog(@"%@", notification.object);
    NSLog(@"%@", notification);
}

- (void)checkPasteboard {
    NSString *string = [UIPasteboard pasteboardWithName:kIdentifier create:YES].string;
    NSLog(@"%@", string);
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context {
    NSLog(@"WHOA");
}

- (IBAction)didPushButton:(id)sender {
    [UIPasteboard pasteboardWithName:kIdentifier create:YES].string = @"WHOA";
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
