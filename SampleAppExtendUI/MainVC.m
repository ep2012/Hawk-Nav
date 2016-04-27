//
//  MainVC.m
//  SampleAppExtendUI
//
//  Created by Old Account on 4/6/16.
//  Copyright © 2016 Ten Degrees. All rights reserved.
//
#import "MainVC.h"
#import "ViewController.h"
@interface MainVC ()
@property (weak, nonatomic) IBOutlet UITextField *txtDestination;
//- (IBAction)pressedGo:(UIButton *)sender;
@property (weak, nonatomic) IBOutlet UITextField *txtDestinationLat;

@property (weak, nonatomic) IBOutlet UIButton *routeButton;


@end

@implementation MainVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Do any additional setup after loading the view, typically from a nib.
    _routeButton.hidden = YES;
}
- (IBAction)pressedGo:(UIButton *)sender {
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    [userDefaults setObject:_txtDestination.text forKey:@"destLong"];
    [userDefaults setObject:_txtDestinationLat.text forKey:@"destLat"];
    
    _routeButton.hidden = NO;
    
    // do any setup you need for myNewVC
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end

