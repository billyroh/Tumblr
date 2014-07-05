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

@property (strong, nonatomic) HomeViewController *homeViewController;
@property (strong, nonatomic) ExploreViewController *exploreViewController;
@property (strong, nonatomic) ProfileViewController *profileViewController;
@property (strong, nonatomic) ActivityViewController *activityViewController;

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
    // Do any additional setup after loading the view from its nib.
    
    [self.contentView addSubview:self.homeViewController.view];
    [self.homeButton setBackgroundImage:[UIImage imageNamed:@"home_selected_icon"] forState:UIControlStateSelected];
    [self.exploreButton setBackgroundImage:[UIImage imageNamed:@"search_selected_icon"] forState:UIControlStateSelected];
    [self.profileButton setBackgroundImage:[UIImage imageNamed:@"account_selected_icon"] forState:UIControlStateSelected];
    [self.activityButton setBackgroundImage:[UIImage imageNamed:@"trending_selected_icon"] forState:UIControlStateSelected];
    
    [self.homeButton setSelected:YES];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)onHomeButtonTap:(id)sender {
    [self.contentView addSubview:self.homeViewController.view];
    [self.homeButton setSelected:YES];
    [self.exploreButton setSelected:NO];
    [self.profileButton setSelected:NO];
    [self.activityButton setSelected:NO];
    self.bubbleImageView.hidden = NO;
}
- (IBAction)onExploreButtonTap:(id)sender {
    [self.contentView addSubview:self.exploreViewController.view];
    [self.homeButton setSelected:NO];
    [self.exploreButton setSelected:YES];
    [self.profileButton setSelected:NO];
    [self.activityButton setSelected:NO];
    self.bubbleImageView.hidden = YES;
}
- (IBAction)onComposeButton:(id)sender {

}
- (IBAction)onProfileButtonTap:(id)sender {
    [self.contentView addSubview:self.profileViewController.view];
    [self.homeButton setSelected:NO];
    [self.exploreButton setSelected:NO];
    [self.profileButton setSelected:YES];
    [self.activityButton setSelected:NO];
    self.bubbleImageView.hidden = YES;
}
- (IBAction)onActivityButtonTap:(id)sender {
    [self.contentView addSubview:self.activityViewController.view];
    [self.homeButton setSelected:NO];
    [self.exploreButton setSelected:NO];
    [self.profileButton setSelected:NO];
    [self.activityButton setSelected:YES];
    self.bubbleImageView.hidden = YES;
}


@end
