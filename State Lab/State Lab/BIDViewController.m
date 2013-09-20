//
//  BIDViewController.m
//  State Lab
//
//  Created by Maria Alice C. Lim on 9/20/13.
//  Copyright (c) 2013 __MyCompanyName__. All rights reserved.
//

#import "BIDViewController.h"

@interface BIDViewController ()
@property (assign, nonatomic) BOOL animate;
- (void)rotateLabelUp;
- (void)rotateLabelDown;
@end

@implementation BIDViewController
@synthesize label;
@synthesize animate;

- (void)applicationWillResignActive {
    NSLog(@"VC: %@", NSStringFromSelector(_cmd));
    animate = NO;
}
- (void)applicationDidBecomeActive {
    NSLog(@"VC: %@", NSStringFromSelector(_cmd));
    animate = YES;
    [self rotateLabelDown];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(applicationWillResignActive)
                                                 name:UIApplicationWillResignActiveNotification
                                               object:[UIApplication sharedApplication]];
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(applicationDidBecomeActive)
                                                 name:UIApplicationDidBecomeActiveNotification
                                               object:[UIApplication sharedApplication]];
    CGRect bounds = self.view.bounds;
    CGRect labelFrame = CGRectMake(bounds.origin.x, CGRectGetMidY(bounds) - 50,
                                   bounds.size.width, 100);
    self.label = [[UILabel alloc] initWithFrame:labelFrame];
    label.font = [UIFont fontWithName:@"Helvetica" size:70];
    label.text = @"Bazinga!";
    label.textAlignment = UITextAlignmentCenter;
    label.backgroundColor = [UIColor clearColor];
    [self.view addSubview:label];
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
    self.label = nil;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated
{
	[super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated
{
	[super viewDidDisappear:animated];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

- (void)rotateLabelDown {
    [UIView animateWithDuration:0.5
                     animations:^{
                         label.transform = CGAffineTransformMakeRotation(M_PI);
                     }
                     completion:^(BOOL finished){
                         [self rotateLabelUp];
                     }];
}
- (void)rotateLabelUp {
    [UIView animateWithDuration:0.5
                     animations:^{label.transform = CGAffineTransformMakeRotation(0);
                     }
                     completion:^(BOOL finished){
                         if (animate) {
                             [self rotateLabelDown];
                         }
                     }];
}

@end
