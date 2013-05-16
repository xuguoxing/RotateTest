//
//  ViewController3.m
//  rotateTest
//
//  Created by xuguoxing on 13-5-5.
//  Copyright (c) 2013年 xuguoxing. All rights reserved.
//

#import "ViewController3.h"

@interface ViewController3 ()
{
    UILabel *label;
    UIButton *button;
}
@end

@implementation ViewController3

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonItemStyleDone target:self action:@selector(doneButtonPressed:)];
    
    
	self.view.backgroundColor = [UIColor whiteColor];
	label = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, CGRectGetWidth(self.view.bounds), 20)];
    label.autoresizingMask = UIViewAutoresizingFlexibleBottomMargin|UIViewAutoresizingFlexibleWidth;
    label.text = @"hello world3";
    [self.view addSubview:label];
    
    button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    button.frame = CGRectMake(50, 100, 100, 30);
    [self.view addSubview:button];
    
    [button addTarget:self action:@selector(buttonPressed:) forControlEvents:UIControlEventTouchUpInside];
    
    NSLog(@"3.viewDidLoad");
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    NSLog(@"3.view viewWillAppear");
}

-(void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    NSLog(@"3.view viewDidAppear");
}

-(void)doneButtonPressed:(id)sender
{
    NSLog(@"3 dismiss self");
    [self dismissModalViewControllerAnimated:YES];
}

-(void)buttonPressed:(id)sender
{
    NSLog(@"3.pre view Frame:%@ bounds:%@",NSStringFromCGRect(self.view.frame),NSStringFromCGRect(self.view.bounds));
    BOOL hide = ![UIApplication sharedApplication].statusBarHidden;
    [[UIApplication sharedApplication] setStatusBarHidden:hide withAnimation:UIStatusBarAnimationFade];
    NSLog(@"3.post view Frame:%@ bounds:%@",NSStringFromCGRect(self.view.frame),NSStringFromCGRect(self.view.bounds));
}



- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation
{
    NSLog(@"3.shouldAutorotateToInterfaceOrientation:%d",toInterfaceOrientation);
    if (toInterfaceOrientation == UIInterfaceOrientationLandscapeLeft) {
        return YES;
    }
    return NO;
}

-(void)willRotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation duration:(NSTimeInterval)duration
{
    NSLog(@"3.willRotateToInterfaceOrientation:%d view Frame:%@ bounds:%@ interfaceOrientation:%d statusBarOrientation:%d navFrame:%@ navBounds:%@",toInterfaceOrientation,NSStringFromCGRect(self.view.frame),NSStringFromCGRect(self.view.bounds),self.interfaceOrientation,[UIApplication sharedApplication].statusBarOrientation,
          NSStringFromCGRect(self.navigationController.view.frame),NSStringFromCGRect(self.navigationController.view.bounds));
}

-(void)willAnimateRotationToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation duration:(NSTimeInterval)duration
{
    NSLog(@"3.willAnimateRotationToInterfaceOrientation:%d view Frame:%@ bounds:%@ interfaceOrientation:%d statusBarOrientation:%d navFrame:%@ navBounds:%@",toInterfaceOrientation,NSStringFromCGRect(self.view.frame),NSStringFromCGRect(self.view.bounds),self.interfaceOrientation,[UIApplication sharedApplication].statusBarOrientation,
          NSStringFromCGRect(self.navigationController.view.frame),NSStringFromCGRect(self.navigationController.view.bounds));
}

-(void)didRotateFromInterfaceOrientation:(UIInterfaceOrientation)fromInterfaceOrientation
{
    NSLog(@"3.didRotateFromInterfaceOrientation:%d view Frame:%@ bounds:%@ interfaceOrientation:%d statusBarOrientation:%d navFrame:%@ navBounds:%@",fromInterfaceOrientation,NSStringFromCGRect(self.view.frame),NSStringFromCGRect(self.view.bounds),self.interfaceOrientation,[UIApplication sharedApplication].statusBarOrientation,
          NSStringFromCGRect(self.navigationController.view.frame),NSStringFromCGRect(self.navigationController.view.bounds));
}

-(void)viewWillLayoutSubviews
{
    NSLog(@"3.viewWillLayoutSubviews view Frame:%@ bounds:%@ interfaceOrientation:%d statusBarOrientation:%d navFrame:%@ navBounds:%@",NSStringFromCGRect(self.view.frame),NSStringFromCGRect(self.view.bounds),self.interfaceOrientation,[UIApplication sharedApplication].statusBarOrientation,
          NSStringFromCGRect(self.navigationController.view.frame),NSStringFromCGRect(self.navigationController.view.bounds));
}

-(void)viewDidLayoutSubviews
{
    NSLog(@"3.viewDidLayoutSubviews view Frame:%@ bounds:%@ interfaceOrientation:%d statusBarOrientation:%d navFrame:%@ navBounds:%@",NSStringFromCGRect(self.view.frame),NSStringFromCGRect(self.view.bounds),self.interfaceOrientation,[UIApplication sharedApplication].statusBarOrientation,
          NSStringFromCGRect(self.navigationController.view.frame),NSStringFromCGRect(self.navigationController.view.bounds));
}



@end
