//
//  ViewController.m
//  rotateTest
//
//  Created by xuguoxing on 13-5-5.
//  Copyright (c) 2013年 xuguoxing. All rights reserved.
//

#import "ViewController.h"
#import "ViewController2.h"

@interface ViewController ()
{
    UILabel *label;
    UIButton *button;
}
@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	label = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, CGRectGetWidth(self.view.bounds), 20)];
    label.autoresizingMask = UIViewAutoresizingFlexibleBottomMargin|UIViewAutoresizingFlexibleWidth;
    label.text = @"hello world";
    [self.view addSubview:label];
    
    button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    button.frame = CGRectMake(50, 100, 200, 30);
    [button addTarget:self action:@selector(buttonPressed:) forControlEvents:UIControlEventTouchUpInside];
    [button setTitle:@"Toggle StatusBar" forState:UIControlStateNormal];
    [self.view addSubview:button];


    UIButton *button2 = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    button2.frame = CGRectMake(50, 200, 200, 30);
    [button2 addTarget:self action:@selector(buttonPressed2:) forControlEvents:UIControlEventTouchUpInside];
    [button2 setTitle:@"push viewController" forState:UIControlStateNormal];
    [self.view addSubview:button2];
    
    
    UIButton *button3 = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    button3.frame = CGRectMake(50, 300, 200, 30);
    [button3 setTitle:@"JS" forState:UIControlStateNormal];
    [button3 addTarget:self action:@selector(buttonPressed3:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button3];
}

-(void)buttonPressed3:(id)sender{
        
    /*NSString *jsFunction = @"function couponPrice(m) {return (parseInt(m/50598))*49985+(parseInt(m%50598/10118))*9997+(parseInt(m%50598%10118/1010))*998+(parseInt(m%50598%10118%1010/303))*299.5+(parseInt(m%50598%10118%1010%303/101))*99.9+(parseInt(m%50598%10118%1010%303%101));}";
    UIWebView *webView = [[UIWebView alloc]init];
    [webView stringByEvaluatingJavaScriptFromString:jsFunction];
    NSString *result2 = [webView stringByEvaluatingJavaScriptFromString:@"couponPrice(200);"];
    NSLog(@"result2:%@",result2);   */ 
}

-(void)buttonPressed:(id)sender
{
    NSLog(@"pre view Frame:%@ bounds:%@",NSStringFromCGRect(self.view.frame),NSStringFromCGRect(self.view.bounds));
    BOOL hide = ![UIApplication sharedApplication].statusBarHidden;
    [[UIApplication sharedApplication] setStatusBarHidden:hide withAnimation:UIStatusBarAnimationFade];
    NSLog(@"post view Frame:%@ bounds:%@",NSStringFromCGRect(self.view.frame),NSStringFromCGRect(self.view.bounds));
}

-(void)buttonPressed2:(id)sender{
    UIViewController *controller = [[ViewController2 alloc]init];
    [self.navigationController pushViewController:controller animated:YES];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation
{

    NSLog(@"shouldAutorotateToInterfaceOrientation:%d",toInterfaceOrientation);
    /*if (toInterfaceOrientation == UIInterfaceOrientationPortrait) {
        return YES;
    }
    return NO;*/
    return YES;
}

-(void)willRotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation duration:(NSTimeInterval)duration
{
     NSLog(@"willRotateToInterfaceOrientation:%d view Frame:%@ bounds:%@ interfaceOrientation:%d statusBarOrientation:%d navFrame:%@ navBounds:%@",toInterfaceOrientation,NSStringFromCGRect(self.view.frame),NSStringFromCGRect(self.view.bounds),self.interfaceOrientation,[UIApplication sharedApplication].statusBarOrientation,
           NSStringFromCGRect(self.navigationController.view.frame),NSStringFromCGRect(self.navigationController.view.bounds));
}

-(void)willAnimateRotationToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation duration:(NSTimeInterval)duration
{
    NSLog(@"willAnimateRotationToInterfaceOrientation:%d view Frame:%@ bounds:%@ interfaceOrientation:%d statusBarOrientation:%d navFrame:%@ navBounds:%@",toInterfaceOrientation,NSStringFromCGRect(self.view.frame),NSStringFromCGRect(self.view.bounds),self.interfaceOrientation,[UIApplication sharedApplication].statusBarOrientation,
          NSStringFromCGRect(self.navigationController.view.frame),NSStringFromCGRect(self.navigationController.view.bounds));
}

-(void)didRotateFromInterfaceOrientation:(UIInterfaceOrientation)fromInterfaceOrientation
{
    NSLog(@"didRotateFromInterfaceOrientation:%d view Frame:%@ bounds:%@ interfaceOrientation:%d statusBarOrientation:%d navFrame:%@ navBounds:%@",fromInterfaceOrientation,NSStringFromCGRect(self.view.frame),NSStringFromCGRect(self.view.bounds),self.interfaceOrientation,[UIApplication sharedApplication].statusBarOrientation,
          NSStringFromCGRect(self.navigationController.view.frame),NSStringFromCGRect(self.navigationController.view.bounds));
}

-(void)viewWillLayoutSubviews
{
    NSLog(@"viewWillLayoutSubviews view Frame:%@ bounds:%@ interfaceOrientation:%d statusBarOrientation:%d navFrame:%@ navBounds:%@",NSStringFromCGRect(self.view.frame),NSStringFromCGRect(self.view.bounds),self.interfaceOrientation,[UIApplication sharedApplication].statusBarOrientation,
          NSStringFromCGRect(self.navigationController.view.frame),NSStringFromCGRect(self.navigationController.view.bounds));
}



-(void)viewDidLayoutSubviews
{
    NSLog(@"viewDidLayoutSubviews view Frame:%@ bounds:%@ interfaceOrientation:%d statusBarOrientation:%d navFrame:%@ navBounds:%@",NSStringFromCGRect(self.view.frame),NSStringFromCGRect(self.view.bounds),self.interfaceOrientation,[UIApplication sharedApplication].statusBarOrientation,
          NSStringFromCGRect(self.navigationController.view.frame),NSStringFromCGRect(self.navigationController.view.bounds));
}

@end
