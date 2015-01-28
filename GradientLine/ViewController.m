//
//  ViewController.m
//  GradientLine
//
//  Created by liyuchang on 15-1-28.
//  Copyright (c) 2015年 com.Vacn. All rights reserved.
//

#import "ViewController.h"
#import "GradientLineView.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    GradientLineView *line = [[GradientLineView alloc] initWithFrame:CGRectMake(0, 100, self.view.frame.size.width, 2)];
    [self.view addSubview:line];
    [line start];
    [self performSelector:@selector(stop:) withObject:line afterDelay:3];
}

-(void)stop:(GradientLineView *)line
{
    [line stop];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}

@end
