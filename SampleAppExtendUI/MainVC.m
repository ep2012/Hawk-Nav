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
- (IBAction)pressedGo:(UIButton *)sender;

@end

@implementation MainVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end

