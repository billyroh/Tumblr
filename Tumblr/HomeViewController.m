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
@property (weak, nonatomic) IBOutlet UIView *logInFormView;
@property (strong, nonatomic) JCRBlurView *blurView;
@property (strong, nonatomic) UIDynamicAnimator *animator;
//- (IBAction)onLogInButtonTap:(id)sender;
- (IBAction)onCancelTap:(id)sender;
@property (weak, nonatomic) IBOutlet UITextField *textField;

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
    CGPoint center = self.logInFormView.center;
    center.y = 600;
    self.logInFormView.hidden = YES;
    self.logInFormView.center = center;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)onCancelTap:(id)sender {
    
    [UIView animateWithDuration:1.0
                          delay:0
         usingSpringWithDamping:0.9
          initialSpringVelocity:10
                        options:UIViewAnimationOptionCurveEaseOut
                     animations:^{
                         self.blurView.alpha = 0;
                         CGPoint center = self.logInFormView.center;
                         center.y = 600;
                         self.logInFormView.center = center;
                     }
                     completion:nil
                     ];
    [self.view endEditing:YES];
}
- (IBAction)onLogInButtonTap:(id)sender {
    // blurView
    self.blurView = [JCRBlurView new];
    self.blurView.blurTintColor = [UIColor colorWithRed:51.0f/255.0f green:70.0f/255.0f blue:93.0f/255.0f alpha:1];
    [self.blurView setFrame:CGRectMake(0.0f,0.0f,320.0f,568.0f)];
    [self.view addSubview:self.blurView];
    [self.view bringSubviewToFront:self.logInFormView];
    self.blurView.alpha = 0;
    
    // logInFormView
    CGPoint center = self.logInFormView.center;
    center.y = 600;
    self.logInFormView.center = center;
    center.y = 100;
    self.logInFormView.hidden = NO;
    
    [UIView animateWithDuration:1.0
                          delay:0
         usingSpringWithDamping:1
          initialSpringVelocity:10
                        options:UIViewAnimationOptionCurveEaseOut
                     animations:^{
                         self.blurView.alpha = 1;
                         CGPoint test = self.logInFormView.center;
                         test.y = 1;
                         self.logInFormView.center = CGPointMake(300, 100);
                     }
                     completion:nil];
    
    [self.textField becomeFirstResponder];
}

@end
