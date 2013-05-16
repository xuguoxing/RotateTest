//
//  ViewController2.m
//  rotateTest
//
//  Created by xuguoxing on 13-5-5.
//  Copyright (c) 2013年 xuguoxing. All rights reserved.
//

#import "ViewController2.h"
#import "ViewController3.h"

@interface ViewController2 ()
{
    UILabel *label;
    UIButton *button;
}
@end

@implementation ViewController2

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
    self.view.backgroundColor = [UIColor whiteColor];
	label = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, CGRectGetWidth(self.view.bounds), 20)];
    label.autoresizingMask = UIViewAutoresizingFlexibleBottomMargin|UIViewAutoresizingFlexibleWidth;
    label.text = @"hello world2";
    [self.view addSubview:label];
    
    button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    button.frame = CGRectMake(50, 100, 200, 30);
    [button setTitle:@"Toggle StatusBar" forState:UIControlStateNormal];
    [self.view addSubview:button];
    
    [button addTarget:self action:@selector(buttonPressed:) forControlEvents:UIControlEventTouchUpInside];
    
    UIButton *button2 = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    button2.frame = CGRectMake(50, 200, 200, 30);
    [button2 addTarget:self action:@selector(buttonPressed2:) forControlEvents:UIControlEventTouchUpInside];
    [button2 setTitle:@"modal viewController" forState:UIControlStateNormal];
    [self.view addSubview:button2];
    
    
    NSLog(@"2.viewDidLoad");
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [UIViewController attemptRotationToDeviceOrientation];
    NSLog(@"2.view viewWillAppear");
}

-(void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
     NSLog(@"2.view viewDidAppear");
}

-(void)buttonPressed:(id)sender
{
    NSLog(@"2.pre view Frame:%@ bounds:%@",NSStringFromCGRect(self.view.frame),NSStringFromCGRect(self.view.bounds));
    BOOL hide = ![UIApplication sharedApplication].statusBarHidden;
    [[UIApplication sharedApplication] setStatusBarHidden:hide withAnimation:UIStatusBarAnimationFade];
    NSLog(@"2.post view Frame:%@ bounds:%@",NSStringFromCGRect(self.view.frame),NSStringFromCGRect(self.view.bounds));
}

-(void)buttonPressed2:(id)sender{
    UIViewController *controller = [[ViewController3 alloc]init];
    UINavigationController *nav = [[UINavigationController alloc]initWithRootViewController:controller];
    [self presentModalViewController:nav animated:YES];
    //[self.navigationController pushViewController:controller animated:YES];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation
{
    NSLog(@"2.shouldAutorotateToInterfaceOrientation:%d",toInterfaceOrientation);
    /*if (toInterfaceOrientation == UIInterfaceOrientationLandscapeLeft) {
        return YES;
    }
    return NO;*/
    return YES;
}

-(void)willRotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation duration:(NSTimeInterval)duration
{
    NSLog(@"2.willRotateToInterfaceOrientation:%d view Frame:%@ bounds:%@ interfaceOrientation:%d statusBarOrientation:%d navFrame:%@ navBounds:%@",toInterfaceOrientation,NSStringFromCGRect(self.view.frame),NSStringFromCGRect(self.view.bounds),self.interfaceOrientation,[UIApplication sharedApplication].statusBarOrientation,
          NSStringFromCGRect(self.navigationController.view.frame),NSStringFromCGRect(self.navigationController.view.bounds));
}

-(void)willAnimateRotationToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation duration:(NSTimeInterval)duration
{
    NSLog(@"2.willAnimateRotationToInterfaceOrientation:%d view Frame:%@ bounds:%@ interfaceOrientation:%d statusBarOrientation:%d navFrame:%@ navBounds:%@",toInterfaceOrientation,NSStringFromCGRect(self.view.frame),NSStringFromCGRect(self.view.bounds),self.interfaceOrientation,[UIApplication sharedApplication].statusBarOrientation,
          NSStringFromCGRect(self.navigationController.view.frame),NSStringFromCGRect(self.navigationController.view.bounds));
}

-(void)didRotateFromInterfaceOrientation:(UIInterfaceOrientation)fromInterfaceOrientation
{
    NSLog(@"2.didRotateFromInterfaceOrientation:%d view Frame:%@ bounds:%@ interfaceOrientation:%d statusBarOrientation:%d navFrame:%@ navBounds:%@",fromInterfaceOrientation,NSStringFromCGRect(self.view.frame),NSStringFromCGRect(self.view.bounds),self.interfaceOrientation,[UIApplication sharedApplication].statusBarOrientation,
          NSStringFromCGRect(self.navigationController.view.frame),NSStringFromCGRect(self.navigationController.view.bounds));
}

-(void)viewWillLayoutSubviews
{
    NSLog(@"2.viewWillLayoutSubviews view Frame:%@ bounds:%@ interfaceOrientation:%d statusBarOrientation:%d navFrame:%@ navBounds:%@",NSStringFromCGRect(self.view.frame),NSStringFromCGRect(self.view.bounds),self.interfaceOrientation,[UIApplication sharedApplication].statusBarOrientation,
          NSStringFromCGRect(self.navigationController.view.frame),NSStringFromCGRect(self.navigationController.view.bounds));
}


-(void)viewDidLayoutSubviews
{
    NSLog(@"2.viewDidLayoutSubviews view Frame:%@ bounds:%@ interfaceOrientation:%d statusBarOrientation:%d navFrame:%@ navBounds:%@",NSStringFromCGRect(self.view.frame),NSStringFromCGRect(self.view.bounds),self.interfaceOrientation,[UIApplication sharedApplication].statusBarOrientation,
          NSStringFromCGRect(self.navigationController.view.frame),NSStringFromCGRect(self.navigationController.view.bounds));
}

@end
