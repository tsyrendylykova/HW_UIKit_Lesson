//
//  ViewController.m
//  HitTestExample
//
//  Created by Цырендылыкова Эржена on 16/03/2019.
//  Copyright © 2019 Erzhena Tsyrendylykova. All rights reserved.
//

#import "ViewController.h"
#import "LCTCustomViewController.h"
#import "LCTCustomView.h"

@interface ViewController ()

@property (nonatomic, strong) LCTCustomView *customView;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad]; //вызываем viewDidLoad который реализован у родителя
    
    NSLog(@"View is loaded");
    
    [self prepareUI];
    
    
}


-(void)viewWillAppear:(BOOL)animated {
    NSLog(@"View появится");
}

-(void)viewDidAppear:(BOOL)animated {
    NSLog(@"View появилась");
}

-(void)viewWillDisappear:(BOOL)animated {
    NSLog(@"View исчезнет");
}

-(void)viewDidDisappear:(BOOL)animated {
    NSLog(@"View исчезла");
}


#pragma mark - UI

-(void)prepareUI
{
    self.view.backgroundColor = [UIColor colorWithRed:255/255.f green:250/255.f blue:208/255.f alpha:1];
    self.navigationItem.title = @"UIKit first lesson";
    self.navigationController.navigationBar.prefersLargeTitles = YES;
    
    self.customView = [[LCTCustomView alloc] initWithFrame:CGRectMake(self.view.frame.size.width / 2 - 100, self.view.frame.size.height / 2 - 100, 200, 200)];
    self.customView.backgroundColor = [UIColor colorWithRed:251/255.f green:230/255.f blue:139/255.f alpha:1];
    [self.view addSubview: self.customView];

    UIButton *presentButton = [UIButton buttonWithType:UIButtonTypeCustom];
    presentButton.frame = CGRectMake(0, CGRectGetHeight(self.view.frame) - 100, CGRectGetWidth(self.view.frame), 100);
    presentButton.backgroundColor = [UIColor colorWithRed:200/255.f green:172/255.f blue:98/255.f alpha:1];
    [presentButton setTitle: @"push me" forState: UIControlStateNormal];
    [presentButton setTitleColor:[UIColor colorWithRed:157/255.f green:125/255.f blue:15/255.f alpha:1] forState:UIControlStateNormal];
    [presentButton addTarget: self action: @selector(goToNextVC) forControlEvents: UIControlEventTouchUpInside];
    [self.view addSubview: presentButton];
    
    UIButton *reloadViewButton = [UIButton buttonWithType:UIButtonTypeCustom];
    reloadViewButton.frame = CGRectMake(0, 135, self.view.frame.size.width, 100);
    reloadViewButton.backgroundColor = [UIColor colorWithRed:255/255.f green:252/255.f blue:233/255.f alpha:1];
    [reloadViewButton setTitle:@"Reload View" forState:UIControlStateNormal];
    [reloadViewButton setTitleColor:[UIColor colorWithRed:157/255.f green:125/255.f blue:15/255.f alpha:1] forState:UIControlStateNormal];
    [reloadViewButton addTarget:self action:@selector(reloadView) forControlEvents: UIControlEventTouchUpInside];
    [self.view addSubview:reloadViewButton];
    
}

#pragma mark - Special Method
-(void)goToNextVC
{
    LCTCustomViewController *viewController = [[LCTCustomViewController alloc] init];
    viewController.view.backgroundColor = [UIColor whiteColor];
    [self presentViewController:viewController animated: true completion:^{
        NSLog(@"Completion");
    }];

}

-(void)reloadView
{
    self.view = nil;
    self.view.backgroundColor = [UIColor colorWithRed:255/255.f green:250/255.f blue:208/255.f alpha:1];
    [self.navigationController.view insertSubview:self.view belowSubview:self.navigationController.navigationBar];
    
}

#pragma mark - UIResponder methods

- (void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    UITouch *touch = touches.anyObject;
    CGPoint currentPoint = [touch locationInView: self.view];
    CGFloat width = self.view.frame.size.width;
    self.view.backgroundColor = [UIColor colorWithRed:currentPoint.x / width green:currentPoint.x / width blue:currentPoint.x / width alpha:1];
    
}

@end
