//
//  MainViewController.m
//  Tumblr
//
//  Created by Billy Roh on 7/5/14.
//  Copyright (c) 2014 Billy Roh. All rights reserved.
//

#import "MainViewController.h"
#import "HomeViewController.h"
#import "ExploreViewController.h"
#import "ProfileViewController.h"
#import "ActivityViewController.h"
#import "JCRBlurView.h"

@interface MainViewController ()
@property (weak, nonatomic) IBOutlet UIButton *homeButton;
- (IBAction)onHomeButtonTap:(id)sender;
@property (weak, nonatomic) IBOutlet UIButton *exploreButton;
- (IBAction)onExploreButtonTap:(id)sender;
@property (weak, nonatomic) IBOutlet UIButton *composeButton;
- (IBAction)onComposeButton:(id)sender;
@property (weak, nonatomic) IBOutlet UIButton *profileButton;
- (IBAction)onProfileButtonTap:(id)sender;
@property (weak, nonatomic) IBOutlet UIButton *activityButton;
- (IBAction)onActivityButtonTap:(id)sender;
@property (weak, nonatomic) IBOutlet UIView *contentView;
@property (weak, nonatomic) IBOutlet UIImageView *bubbleImageView;

// Composer Stuff
@property (weak, nonatomic) IBOutlet UIView *composerView;
@property (weak, nonatomic) IBOutlet UIView *composerTextView;
@property (weak, nonatomic) IBOutlet UIView *composerPhotoView;
@property (weak, nonatomic) IBOutlet UIView *composerQuoteView;
@property (weak, nonatomic) IBOutlet UIView *composerLinkView;
@property (weak, nonatomic) IBOutlet UIView *composerChatView;
@property (weak, nonatomic) IBOutlet UIView *composerVideoView;
@property (weak, nonatomic) IBOutlet UIButton *composerDismissButton;
- (IBAction)onComposerDismissButtonTap:(id)sender;


// View Controllers
@property (strong, nonatomic) HomeViewController *homeViewController;
@property (strong, nonatomic) ExploreViewController *exploreViewController;
@property (strong, nonatomic) ProfileViewController *profileViewController;
@property (strong, nonatomic) ActivityViewController *activityViewController;

// Global
@property (strong, nonatomic) UIColor *tumblrBlue;

@end

@implementation MainViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        self.homeViewController = [[HomeViewController alloc] init];
        self.exploreViewController = [[ExploreViewController alloc] init];
        self.profileViewController = [[ProfileViewController alloc] init];
        self.activityViewController = [[ActivityViewController alloc] init];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.tumblrBlue = [UIColor colorWithRed:51.0f/255.0f green:70.0f/255.0f blue:93.0f/255.0f alpha:1];
    
    self.composerView.hidden = YES;
    self.composerView.backgroundColor = [UIColor colorWithRed:51.0f/255.0f green:70.0f/255.0f blue:93.0f/255.0f alpha:0];
    
    // tabBarView setup
    [self.homeButton setBackgroundImage:[UIImage imageNamed:@"home_selected_icon"] forState:UIControlStateSelected];
    [self.exploreButton setBackgroundImage:[UIImage imageNamed:@"search_selected_icon"] forState:UIControlStateSelected];
    [self.profileButton setBackgroundImage:[UIImage imageNamed:@"account_selected_icon"] forState:UIControlStateSelected];
    [self.activityButton setBackgroundImage:[UIImage imageNamed:@"trending_selected_icon"] forState:UIControlStateSelected];
    
    // bubbleImageView setup
    [UIView animateWithDuration: 0.8
                          delay: 0.0
                        options: UIViewAnimationOptionCurveEaseOut | UIViewAnimationOptionAutoreverse | UIViewAnimationOptionRepeat
                     animations: ^{
                         CGAffineTransform transform = CGAffineTransformMakeTranslation(0,5);
                         self.bubbleImageView.transform = transform;
                     } completion: nil];
    
    [self onHomeButtonTap:nil];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)onHomeButtonTap:(id)sender {
    [self.contentView addSubview:self.homeViewController.view];
    [self setButtonStates];
    self.homeButton.selected = YES;
}
- (IBAction)onExploreButtonTap:(id)sender {
    [self.contentView addSubview:self.exploreViewController.view];
    [self setButtonStates];
    self.exploreButton.selected = YES;
    self.bubbleImageView.hidden = YES;
}
- (IBAction)onComposeButton:(id)sender {
    self.composerView.hidden = NO;
    JCRBlurView *blurView = [JCRBlurView new];
    blurView.blurTintColor = self.tumblrBlue;
    [blurView setFrame:CGRectMake(20.0f,20.0f,320.0f,568.0f)];
    [self.composerView addSubview:blurView];
    [self.composerView sendSubviewToBack:blurView];

}
- (IBAction)onProfileButtonTap:(id)sender {
    [self.contentView addSubview:self.profileViewController.view];
    [self setButtonStates];
    self.profileButton.selected = YES;
}
- (IBAction)onActivityButtonTap:(id)sender {
    [self.contentView addSubview:self.activityViewController.view];
    [self setButtonStates];
    self.activityButton.selected = YES;
}
- (IBAction)onComposerDismissButtonTap:(id)sender {
    self.composerView.hidden = YES;
}

- (void)setButtonStates {
    [self.homeButton setSelected:NO];
    [self.exploreButton setSelected:NO];
    [self.profileButton setSelected:NO];
    [self.activityButton setSelected:NO];
    self.bubbleImageView.hidden = NO;
}


@end
