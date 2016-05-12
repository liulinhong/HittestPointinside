//
//  ViewController.m
//  test
//
//  Created by LiuLinhong on 16/4/6.
//  Copyright © 2016年 LiuLinhong. All rights reserved.
//

#import "ViewController.h"
#import "TestView.h"
#import "TestButton.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    TestView *testView = [[TestView alloc] initWithFrame:CGRectMake(0, 70, 300, 300)];
    testView.backgroundColor = [UIColor redColor];
    [self.view addSubview:testView];
    
    UIButton *yellowButton = [UIButton buttonWithType:UIButtonTypeCustom];
    yellowButton.frame = CGRectMake(0, 80, 100, 53);
    yellowButton.tag = 111;
    [yellowButton addTarget:self action:@selector(yellowButtonPressed) forControlEvents:UIControlEventTouchUpInside];
    [testView addSubview:yellowButton];
    yellowButton.backgroundColor = [UIColor yellowColor];
    
    UIButton *greenButton = [UIButton buttonWithType:UIButtonTypeCustom];
    greenButton.frame = CGRectMake(50, 100, 100, 80);
    greenButton.tag = 222;
    [greenButton addTarget:self action:@selector(greenButtonPressed) forControlEvents:UIControlEventTouchUpInside];
    [testView addSubview:greenButton];
    greenButton.backgroundColor = [UIColor greenColor];
}

- (void)yellowButtonPressed
{
    NSLog(@"LLH...... yellow Button Pressed");
}

- (void)greenButtonPressed
{
    NSLog(@"LLH...... green Button Pressed");
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

@end
