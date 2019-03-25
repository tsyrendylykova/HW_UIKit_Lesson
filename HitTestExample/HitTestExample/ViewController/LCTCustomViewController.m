//
//  LCTCustomViewController.m
//  HitTestExample
//
//  Created by Цырендылыкова Эржена on 16/03/2019.
//  Copyright © 2019 Erzhena Tsyrendylykova. All rights reserved.
//

#import "LCTCustomViewController.h"

@interface LCTCustomViewController ()

@end

@implementation LCTCustomViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self prepareUI];
}

-(void)prepareUI
{
    UIButton *backButton = [UIButton buttonWithType:UIButtonTypeCustom];
    backButton.frame = CGRectMake(100, 100, 200, 200);
    backButton.backgroundColor = [UIColor grayColor];
    [backButton setTitle:@"Back" forState:UIControlStateNormal];
    [backButton addTarget:self action:@selector(goBack) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:backButton];
}

-(void)goBack {
    [self dismissViewControllerAnimated:YES completion:nil];
}
@end
