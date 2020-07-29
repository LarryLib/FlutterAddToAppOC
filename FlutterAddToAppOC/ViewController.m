//
//  ViewController.m
//  FlutterAddToAppOC
//
//  Created by Larry Mac Pro on 2020/7/29.
//  Copyright © 2020 LarryTeam. All rights reserved.
//

#import "ViewController.h"
#import <Flutter/Flutter.h>

@interface ViewController ()
@property(nonatomic, strong) UIButton *enterBtn;

@property (nonatomic, strong) FlutterMethodChannel *msgChannel;
@property (nonatomic, strong) FlutterViewController *flutterViewController;

@end

@implementation ViewController

static NSString  * const kChannelName = @"com.test_flutter";

- (void)viewDidLoad {
    [super viewDidLoad];
        
    [self initFlutterConfig];
    
    CGFloat w = 200;
    CGFloat h = 100;
    CGFloat x = (UIScreen.mainScreen.bounds.size.width - w) * 0.5;
    CGFloat y = 100;
    
    _enterBtn = [[UIButton alloc] initWithFrame:CGRectMake(x, y, w, h)];
    [_enterBtn setTitle:@"Enter Flutter" forState:UIControlStateNormal];
    [_enterBtn setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    [_enterBtn addTarget:self action:@selector(handleEnterBtn) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_enterBtn];
}

- (void)initFlutterConfig {
    
    _flutterViewController = [FlutterViewController new];
    
    _msgChannel = [FlutterMethodChannel methodChannelWithName:kChannelName binaryMessenger: _flutterViewController];
    
    __weak typeof (self) weakself = self;
    
    [_msgChannel setMethodCallHandler:^(FlutterMethodCall * _Nonnull call, FlutterResult  _Nonnull result) {
        if ([call.method isEqualToString:@"pop"]) {
            [weakself dismissViewControllerAnimated:YES completion:nil];
        }
    }];
}

- (void)handleEnterBtn {
    NSLog(@"handleEnterBtn");
    [self presentViewController:_flutterViewController animated:YES completion:nil];
}


@end
