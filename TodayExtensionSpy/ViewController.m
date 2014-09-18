//
//  ViewController.m
//  TodayExtensionSpy
//
//  Created by kaiinui on 2014/09/18.
//  Copyright (c) 2014年 aruamarine. All rights reserved.
//

#import "ViewController.h"

#import "AQSTodayExtensionSpyObserver.h"

#import "SharedConst.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    AQSTodayExtensionSpyObserver *observer = [AQSTodayExtensionSpyObserver observerWithIdentifier:kBundleIdentifier];
    [observer observeStatus];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(didChangeTodayExtensionOpenStatus:) name:kAQSTodayExtensionSpyStatusDidChangeNotification object:nil];
    
    NSLog(@"%hhd", observer.hasTodayExtensionOpened);
    NSLog(@"%@", observer.lastOpenedAtOrNil);
    
    // Do any additional setup after loading the view, typically from a nib.
}

- (IBAction)clearInfo:(id)sender {
    [UIPasteboard pasteboardWithName:kBundleIdentifier create:NO].string = @"";
}

- (void)didChangeTodayExtensionOpenStatus:(NSNotification *)notification {
    NSLog(@"changed!");
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
