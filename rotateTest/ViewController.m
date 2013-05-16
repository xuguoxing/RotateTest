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
    button.frame = CGRectMake(50, 100, 100, 30);
    [button addTarget:self action:@selector(buttonPressed:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
    
    
    UIImage *arrowImage = [UIImage imageNamed:@"passUpArrow"];
    [button setImage:arrowImage forState:UIControlStateNormal];
    [button setTitle:@"过关" forState:UIControlStateNormal];
    
    NSArray *titleArray = @[@"hello",@"过关",@"过关方式",@"依依呀呀呀",@"四五十月铁定的不管哪里的dd"];
    
    
    for (NSString *title in titleArray) {
        [button setTitle:title forState:UIControlStateNormal];
        CGRect bounds = button.bounds;
        CGRect contentRect = [button contentRectForBounds:bounds];
        CGRect titleRect = [button titleRectForContentRect:contentRect];
        CGRect imageRect = [button imageRectForContentRect:contentRect];
        
        NSLog(@"title:%@ button bounds:%@ content:%@ titleRect:%@ imageRect:%@ titlelabel:%@ imageView:%@",title,NSStringFromCGRect(bounds),NSStringFromCGRect(contentRect),NSStringFromCGRect(titleRect),NSStringFromCGRect(imageRect),NSStringFromCGRect(button.titleLabel.frame),NSStringFromCGRect(button.imageView.frame));
    }
    

    
    

    UIButton *button2 = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    button2.frame = CGRectMake(50, 200, 100, 30);
    [button2 addTarget:self action:@selector(buttonPressed2:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button2];
    
    
    UIButton *button3 = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    button3.frame = CGRectMake(50, 300, 100, 30);
    button3.titleLabel.text = @"JS";
    [button3 addTarget:self action:@selector(buttonPressed3:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button3];
}

-(void)buttonPressed3:(id)sender{
    
    UIColor *color1 = [UIColor colorWithRed:0.0 green:0.0 blue:0.0 alpha:0.8];
    UIColor *color2 = [UIColor clearColor];
    
    
    CGColorRef colorRef1 = color1.CGColor;
    CGColorRef colorRef2 = color2.CGColor;
    
    NSLog(@"color1:%@ color2:%@ color1Ref:%@ color2Ref:%@",color1,color2,colorRef1,colorRef2);
    
    CGColorRef outerColor = [UIColor colorWithWhite:0.0 alpha:0.0].CGColor;
    CGColorRef innerColor = [UIColor colorWithWhite:0.2 alpha:1.0].CGColor;
    
     NSLog(@"outerColor:%@ innerColor:%@",outerColor,innerColor);
    
    NSArray *array = @[(__bridge_transfer id)(CGColorRetain(colorRef1)),
      (__bridge_transfer id)(CGColorRetain(colorRef1))];
    NSLog(@"array:%@",array);
    
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
    if (toInterfaceOrientation == UIInterfaceOrientationPortrait) {
        return YES;
    }
    return NO;
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
