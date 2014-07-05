//
//  HomeViewController.m
//  Tumblr
//
//  Created by Billy Roh on 7/5/14.
//  Copyright (c) 2014 Billy Roh. All rights reserved.
//

#import "HomeViewController.h"
#import "JCRBlurView.h"

@interface HomeViewController ()
@property (weak, nonatomic) IBOutlet UIButton *logInButton;
- (IBAction)onLogInButtonTap:(id)sender;

@end

@implementation HomeViewController

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
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)onLogInButtonTap:(id)sender {
//    TODO implement log in button
//    JCRBlurView *blurView = [JCRBlurView new];
//    blurView.blurTintColor = self.tumblrBlue;
//    [blurView setFrame:CGRectMake(20.0f,20.0f,320.0f,568.0f)];
//    [self.composerView addSubview:blurView];
//    [self.composerView sendSubviewToBack:blurView];
}
@end
